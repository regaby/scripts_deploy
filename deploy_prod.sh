#######################################################################
# Deploy to prod
# parameters: hash
# example ./deploy_prod.sh cd961f83c5e2d28f9a2eeb3349e642f024332f38
hash=$1
source ./config
cd $dir

echo "Arguments received: $#" 
if [ $# -lt 1 ]
  then
    echo "No arguments supplied: hash "
    exit 
fi

echo "******************************************************************** Deploying to pre-prod $hash"
echo

git checkout qa
git branch -D pre-prod
git fetch
git checkout pre-prod

git pull
git cherry-pick $hash
git push
