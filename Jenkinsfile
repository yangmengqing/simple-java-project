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
                sh 'mvn clean test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        } 
        stage('Deploy to Production') {
            steps {
                scripts {
                    def testImage = docker.build('test-image', 'nginx/Dockerfile')
                    testImage.push()
                }
                }
            }
        }
    }
}