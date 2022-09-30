pipeline {
    agent any
    environment {
            GITHUB_CREDENTIALS = credentials('github-credentials-id')
            def dockerImage = 'rajivbansal2981/config-server'
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
        stage('Remove existing Docker Image') {
             steps {
                 sh "docker rmi \$(docker images | grep 'rajivbansal2981/config-server')"
             }
        }
        stage('Build Docker Image') {
            steps {
                 sh "docker build -t rajivbansal2981/config-server:${BUILD_NUMBER} ."
            }
        }
        stage('Docker Login and push') {
                    steps {
                         withCredentials([string(credentialsId: 'DockerHubPassword', variable: 'DockerHubPassword')]) {
                             sh "docker login -u rajivbansal2981 -p ${DockerHubPassword}"
                         }
                         sh "docker push rajivbansal2981/config-server:${BUILD_NUMBER}"
                    }
                }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

