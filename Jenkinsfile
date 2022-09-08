pipeline {
    agent any

    environment {
            GITHUB_CREDENTIALS = credentials('github-credentials-id')
        }

    stages {
        stage('Checkout from Github') {
           git url: 'https://github.com/bjjd-microservices/config-server.git' , credentialsId: $GITHUB_CREDENTIALS , branch: 'master'
        }
        stage('Build Project') {
            def mavenHome= tool name: "Maven", type: "maven"
            sh "${mavenHome}/bin/mvn clean install -DskipTests"
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}