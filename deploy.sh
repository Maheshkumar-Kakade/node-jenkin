
# Remove Dev Dependancies
npm prune --production
# Syncronize build with deployment server
rsync -a --delete --exclude-from .rsyncignore -e "ssh -i $1 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" "./" $2@$3:/opt/test
# Reload Web Application
ssh -i $1 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $2@$3 pm2 reload all
