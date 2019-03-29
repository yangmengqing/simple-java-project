pipeline {
    agent any
    stages {
       stage('Build') {
            steps {
                script {
                    def mvnHome = tool 'Maven'
                    sh "${mvnHome}/bin/mvn clean test"
                }
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        } 
        stage('Deploy to Production') {
            steps {
                sh 'pwd'
                script {
                    sh 'pwd'
                    def testImage = docker.build('test-image', 'nginx')
                    testImage.push()
                }
            }
        }
    }
}