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
                sh 'docker build -t nginx -f nginx/Dockerfile .'
                sh 'docker tag nginx mengqingyang/nginx'
                withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
                    sh 'docker push mengqingyang/nginx'
                }
                    //def testImage = docker.build('test-image', 'nginx')
                    //testImage.push()
            }
        }
    }
}