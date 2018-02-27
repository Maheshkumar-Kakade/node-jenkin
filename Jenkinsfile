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
                DEPLOY_HOST =  '192.168.0.25'//credentials('DEV_MACHINE')
                DEPLOY_KEY_PATH = '/ssh-keys/ssh_priv_key'//credentials('SSH_KEY_LOCATION')
            }
            steps {
                sh 'npm prune --production'
                sh './deploy.sh'
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