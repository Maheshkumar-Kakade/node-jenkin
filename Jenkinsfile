pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage ('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage ('Dev Deploy') {
            when {
                branch 'development'
            }
            environment { 
                DEPLOY_USER = 'root'
                DEPLOY_HOST = credentials('DEV_MACHINE')
                DEPLOY_KEY_PATH = credentials('SSH_KEY_LOCATION')
            }
            steps {
                sh 'npm prune --production'
                sh 'rsync -a --delete --exclude-from .rsyncignore -e "ssh -i $DEPLOY_KEY_PATH -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" "./" ${DEPLOY_USER}@${DEPLOY_HOST}:/opt/test'
                ssh '${DEPLOY_USER}@${DEPLOY_HOST} pm2 reload all'
                echo 'deployed on development'
            }
        }
        stage ('Staging Deploy') {
            when {
                branch 'staging'
            }
            steps {
                echo 'deployed on staging'
            }
        }
        stage ('Production(Master) Deploy') {
            when {
                branch 'master'
            }
            steps {
                echo 'deployed on staging'
            }
        }
    }
}