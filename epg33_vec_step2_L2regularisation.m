function F0_vector_out= epg33_vec_step2_L2regularisation(x,ESP_in,alp)

alpha_in=alp;
T2_in=x(1);
s0=x(2);
T1_in=450;
%ESP_in=11.5;
N_in=6;

refoc_mode  = +1;    % +1 = CPMG mode (Carr-Purcell-Meiboom-Gill: Excitation has RF phase 90deg, refocusing RF pulses have RF phase 0deg, see also EPG-R)
                     % -1 = CP   mode (Carr-Purcell             : Excitation and refocusing RF pulses have the same RF phase 0deg, also called 'anti-CPMG', see also EPG-R) 
                     
init_90pad2 =  0;    %  0 = take flip angle(s) (arrays) as specified
                     %  1 = the first refoc flip angle is altered to be 90+fa/2, which prepares the spin system close to the static PSS (SPSS)
                     %      only performed for ETL>1 (multi SE)  ;  here, fa is the second flip angle fa(2)
                     %      basically all TSE will do that to gain signal and improve stability - see literature 



% Initialization of various parameters regarding EPG matrix operators, output space, ...
% ---------------------------------------------------------------------------------------------------------------------

% Determine effective alpha arrays and dedicated length parameters
% By definition, all refocusing pulses have an RF phase of 0deg (around +x)
alpha_in = alpha_in/180.0*pi;                       % Convert flip angle(array) into [rad] 
fa       = alpha_in;                                % "alpha" is already a function in Matlab: not good

for pn = 2:N_in                                     % The given flip angle (array) is repeated N_in times
    fa = [fa,alpha_in];   %#ok<AGROW>
end

% Some auxiliary variables
N     = length(fa);
Nt2   = 2*N;                                     
Nt2p1 = Nt2+1;  
Nt2p2 = Nt2+2;

if ((init_90pad2 == 1) && (N>1))                    % initial 90+fa/2 functionality
    fa(1) = (pi+fa(2))/2;                           % flip angles are already in [rad] !
end
    

% Define relaxation operator E elements for one calculation interval = ESP/2 
if (T1_in == 0)                                     % T1=0 is equivalent to T1=Infinity=no relaxation : I love that ;-)
    E1 = 1.0;
else
    E1 = exp(-ESP_in/T1_in/2.0);                    % Eq.[23] in EPG-R 
end

if (T2_in == 0)                                     % T2=0 is equivalent to T2=Infinity=no relaxation : I love that ;-)
    E2 = 1.0;
else
    E2 = exp(-ESP_in/T2_in/2.0);                    % Eq.[23] in EPG-R
end


% Generate state matrices Omega before and after RF: Eq.[26] in EPG-R
Omega_preRF  = zeros(3,Nt2p1);                      % CP/CPMG shifts by +2 per interval
Omega_postRF = zeros(3,Nt2p1);                      % CP/CPMG shifts by +2 per interval


% Generate state evolution matrices Xi_F and Xi_Z: Eqs.[27] in EPG-R
% Here, they will (only) contain all post-RF states == output variables
Xi_F_all_out = zeros(4*N+1,Nt2);                    % Xi_F with F+ and F- states, Eq.[27a] in EPG-R               
Xi_Z_all_out = zeros(Nt2p1,Nt2);                    % Xi_Z with Z states, upper half of Eq.[27b] in EPG-R


% Starting with freshly excited equilibrium magnetization after a 90deg RF pulse ("excitation pulse")
% All magnetization has flown into an initial F0 state (FID); its magnitude is 1,
% However, its phase depends on the RF phase of the RF pulse, see EPG-R and all relevant SE literature
% It is RF phase excitation pulse =  0deg for a CP   experiment (out-of-phase refocusing, see EPG-R)
% It is RF phase excitation pulse = 90deg for a CPMG experiment (in-phase refocusing, see EPG-R)
if (refoc_mode == +1)                               % CPMG :
    Omega_postRF(1,1) = 1;                          % magnetization resides on +x for fa=+90deg excitation
    Omega_postRF(2,1) = 1;                          % remember: the Omega state matrix contains both F+(0) and F-(0)=(F+(0))*   
else                                                % CP :
    Omega_postRF(1,1) = -1i;                        % magnetization resides on -y for fa=+90deg excitation
    Omega_postRF(2,1) = +1i;                        % remember: the Omega state matrix contains both F+(0) and F-(0)=(F+(0))*   
end

% Starting the calculation of EPG states over time - "flow of magnetization in the EPG"
% ---------------------------------------------------------------------------------------------------------------------
for pn = 1:N                                                                % Loop over RF pulse #pn
      
    % Generate T matrix operator elements (RF pulse representation):  Eq.[15] or Eq.[18] in EPG-R
    % It is always phi=0, thus, all exponential phase terms vanish in the T matrix: effective matrix Tx
    % The T matrix has to be updated within the RF pulse loop, because the flip angle will be often non-constant:
    T(1,1) =         cos(fa(pn)/2)^2;   
    T(1,2) =         sin(fa(pn)/2)^2;
    T(1,3) = -1.0i * sin(fa(pn)  )  ;
    T(2,1) =         sin(fa(pn)/2)^2;
    T(2,2) =         cos(fa(pn)/2)^2;
    T(2,3) = +1.0i * sin(fa(pn)  )  ;
    T(3,1) = -0.5i * sin(fa(pn)  )  ;
    T(3,2) = +0.5i * sin(fa(pn)  )  ;           
    T(3,3) =         cos(fa(pn)  )  ;
    
    
    % In the following, further loops over the states' dephasing k will be needed to realize operators T, E, and S
    % --> Note that we deal with integral k units here, see EPG-R
    % Intead of "for loops over k", Matlab's "indexing capability" will be used, which is much faster for large values
    % To improve efficiency, only states are calculated that could be generated at all in the EPG before
    pn2 = 2*pn;
    k   = 1:(pn2-1);                                                        % "k loop index" with limit pn
    kp1 = 1:(pn2);                                                          % "k loop index" with limit pn+1
    kp2 = 1:(pn2+1);

    
    % E matrix operator: Experienced relaxation from the states for the next ESP/2
    % Expand E matrix relations from Eqs.[23] and [24] in EPG-R 
    Omega_preRF(1:2,k)      = E2 * Omega_postRF(1:2,k);                     % T2 relaxation for F+ and F-
    Omega_preRF(3,k(2:end)) = E1 * Omega_postRF(3,k(2:end));                % T1 relaxation for Z with k>0
    Omega_preRF(3,1)        = E1 * Omega_postRF(3,1) + 1 - E1;              % T1 recovery for Z with k=0 
        
    
    % S operator: Dephasing / shifting of F+ and F- states during the next ESP/2
    % With integral k units (see EPG-R):  Delta(k) = +1
    Omega_preRF(1,k+1) = Omega_preRF(1,k);                                  % dephase F+ (this expression only works with indexing !! no overwriting then) 
    Omega_preRF(2,k)   = Omega_preRF(2,k+1);                                % dephase F- 
    Omega_preRF(1,1)   = conj(Omega_preRF(2,1));                            % generate conjugate pendant F+0 from F-0, see EPG-R

    
    % T matrix operator: RF pulse acting, mixing of F+, F-, and Z states
    % Expand T matrix relations from Eq.[15] or Eq.[18] in EPG-R
    Omega_postRF(:,kp1) = T * Omega_preRF(:,kp1);                           % indexed matrix product !  faster than explicit writing out

    
    % Store these post-RF states of the current Omega state matrix in the Xi state evolution matrices
    Xi_F_all_out(Nt2p2-kp1,pn2-1)        =      Omega_postRF(1,kp1);
    Xi_F_all_out(Nt2+kp1(2:end),pn2-1) = conj(Omega_postRF(2,kp1(2:end)));  % this is a matter of definition, EPG-R defines Xi_F as a coherent set fully in the F+ domain, you could omit the 'conj' 
    Xi_Z_all_out(Nt2p2-kp1,pn2-1)        =      Omega_postRF(3,kp1);

    
    % E matrix operator: Experienced relaxation from the states for the next ESP/2
    % Expand E matrix relations from Eqs.[23] and [24] in EPG-R 
    Omega_postRF(1:2,kp1)      = E2 * Omega_postRF(1:2,kp1);                % T2 relaxation for F+ and F-
    Omega_postRF(3,kp1(2:end)) = E1 * Omega_postRF(3,kp1(2:end));           % T1 relaxation for Z with k>0
    Omega_postRF(3,1)          = E1 * Omega_postRF(3,1) + 1 - E1;           % T1 recovery for Z with k=0 

    
    % S operator: Dephasing / shifting of F+ and F- states during the next ESP/2
    % With integral k units (see EPG-R):  Delta(k) = +1
    Omega_postRF(1,kp1+1) = Omega_postRF(1,kp1);                            % dephase F+ (this expression only works with indexing !! no overwriting then) 
    Omega_postRF(2,kp1)   = Omega_postRF(2,kp1+1);                          % dephase F- 
    Omega_postRF(1,1)     = conj(Omega_postRF(2,1));                        % generate conjugate pendant F+0 from F-0, see EPG-R


    % Store these echo states of the current Omega state matrix in the Xi state evolution matrices
    Xi_F_all_out(Nt2p2-kp2,2*pn)        =      Omega_postRF(1,kp2);
    Xi_F_all_out(Nt2+kp2(2:end),2*pn) = conj(Omega_postRF(2,kp2(2:end)));   % this is a matter of definition, EPG-R defines Xi_F as a coherent set fully in the F+ domain, you could omit the 'conj' ; kp1 would also work, since the highest F- cannot be occupied
    Xi_Z_all_out(Nt2p2-kp2,2*pn)        =      Omega_postRF(3,kp2);         % kp1 would also work, since the highest Z cannot be occupied
     
end % of for loop over pn


% Output: "make nice zeros":
% Erase some float point accuracy errors
Xi_F_all_out(abs(Xi_F_all_out)<eps*1e3) = 0;
Xi_Z_all_out(abs(Xi_Z_all_out)<eps*1e3) = 0;


% Output: Isolate the states at the echo times 
indexer = 2:2:(Nt2);
Xi_F_out = Xi_F_all_out(:,indexer);
Xi_Z_out = Xi_Z_all_out(:,indexer);


% Output: Get "echo" F0 vector 
F0_vector_out = Xi_F_out(Nt2p1,:);


% Output: Final step to get Xi_F and Xi_Z from former "all states"
% Exclude the secondary pathway states (according to the definition of Xi_F and Xi_Z in the header)
Xi_F_out = Xi_F_out(1:2:end,:);
Xi_Z_out = Xi_Z_out(2:2:end,:);

F0_vector_out=F0_vector_out*s0;

end



