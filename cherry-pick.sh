#######################################################################
# Updating branches
# parameters: hash
# example ./cherry-pick.sh cd961f83c5e2d28f9a2eeb3349e642f024332f38
hash=$1
branches=( dev pre-qa qa )
# branches=( dev )
source ./config
cd $dir

echo "Arguments received: $#" 
if [ $# -lt 1 ]
  then
    echo "No arguments supplied: hash "
    exit 
fi

for branch in ${branches[@]}
do
    echo "******************************************************************** Updating Branch $branch"
    echo
    git checkout $branch
    git pull
    git cherry-pick $hash
    git push

done