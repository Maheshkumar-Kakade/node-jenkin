# echo "KEY PATH $0 $1 $2"
rsync -a --delete --exclude-from .rsyncignore -e "ssh -i $1 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" "./" $2@$3:/opt/test
ssh -i $1 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $2@$3 pm2 reload all
