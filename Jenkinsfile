pipeline {
    agent any
    environment {
            GITHUB_CREDENTIALS = credentials('github-credentials-id')
    }
    tools {
        maven 'M3'
     }
    stages {
        stage('Checkout from Github') {
            steps{
             git url: 'https://github.com/bjjd-microservices/config-server.git' , branch: 'master'
            }
        }
        stage('Build Project') {
            steps{
                sh "mvn clean install -DskipTests"
            }
        }
        stage('Build Docker Image') {
            steps {
                 sh "docker build -t rajivbansal2981/config-server:0.0.1-RELEASE ."
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

