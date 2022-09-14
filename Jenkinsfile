pipeline {
    agent any

    environment {
            GITHUB_CREDENTIALS = credentials('github-credentials-id')
        }

    stages {
        stage('Checkout from Github') {
            steps{
             git url: 'https://github.com/bjjd-microservices/config-server.git' , credentialsId: $GITHUB_CREDENTIALS , branch: 'master'
            }
        }
        stage('Build Project') {
            steps{
            echo 'Deploying....'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}