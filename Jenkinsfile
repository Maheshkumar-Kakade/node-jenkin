pipeline {
    agent all
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
            steps {
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