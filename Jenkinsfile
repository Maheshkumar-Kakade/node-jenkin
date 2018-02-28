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
                DEPLOY_HOST =  credentials('DEV_MACHINE')
                DEPLOY_KEY_PATH = credentials('SSH_KEY_LOCATION')
            }
            steps {
                sh './deploy.sh $DEPLOY_KEY_PATH $DEPLOY_USER $DEPLOY_HOST'
                echo 'deployed on development'
            }
        }
        stage ('Staging Deploy') {
            when {
                branch 'staging'
            }
            environment { 
                DEPLOY_USER = 'root'
                DEPLOY_HOST =  credentials('STAGING_MACHINE')
                DEPLOY_KEY_PATH = credentials('SSH_KEY_LOCATION')
            }
            steps {
                sh './deploy.sh $DEPLOY_KEY_PATH $DEPLOY_USER $DEPLOY_HOST'
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