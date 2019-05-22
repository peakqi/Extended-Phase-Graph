#! /bin/sh

Q=long.q
DONE=0;
L=0;
while [ $DONE -eq 0 ] ; do
    case $1 in
	"-q" ) Q=$2; shift 2;;
        "-l" ) L=$2; shift 2;;
        * )    DONE=1;;
    esac
done

if [ $# -lt 1 ] ; then
   echo "USAGE: qmatlab [-q queue -l uselinux] matfile1.m  matfile2.m ..."
   echo "   queue = desired q (e.g., long.q, optional)"
   echo "   uselinux = set to 1 to force linux"
   exit;
fi

FILES=$@
for f in $FILES ; do
    qmatlab -q $Q -l $L $f
done








#! /bin/sh

Q=long.q
DONE=0;
L=0;
T='';
while [ $DONE -eq 0 ] ; do
    case $1 in
	"-q" ) Q=$2;   shift 2;;
        "-l" ) L=$2;   shift 2;;
        "-t" ) T='-t'; shift 1;;
        * )    DONE=1;;
    esac
done

if [ $# -lt 1 ] ; then
   echo "USAGE: qmatlab [-q queue -l uselinux] matfile.m"
   echo "   queue = desired q (e.g., long.q, optional)"
   echo "   uselinux = set to 1 to force linux"
   exit;
fi
FILE=$1
shift 1;

if [ $L -eq 1 ] ; then
   MACH="-a lx24-amd64"
fi

fsl_sub $MACH -q $Q $T matlab -nojvm -nosplash -nodisplay -singleCompThread \< $FILE

