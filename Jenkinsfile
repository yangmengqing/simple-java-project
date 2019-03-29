pipeline {
    agent any
    stages {
       stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn package test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        } 
        stage('Deploy to Production') {
            steps {
                script {
                    docker.image('tomcat').inside {
                        sh 'ps aux'
                    }
                }
            }
        }
    }
}