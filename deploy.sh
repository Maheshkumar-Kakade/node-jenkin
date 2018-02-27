
rsync -a --delete --exclude-from .rsyncignore -e "ssh -i $DEPLOY_KEY_PATH -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" "./" ${DEPLOY_USER}@${DEPLOY_HOST}:/opt/test
ssh ${DEPLOY_USER}@${DEPLOY_HOST} pm2 reload all