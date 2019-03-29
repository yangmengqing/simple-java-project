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
                sh "mvn clean test"
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        } 
        stage('Publish to DockerHub') {
            steps {
                sh 'docker build -t nginx -f nginx/Dockerfile .'
                sh 'docker tag nginx mengqingyang/nginx'
                sh 'docker build -t tomcat -f tomcat/Dockerfile .'
                sh 'docker tag tomcat mengqingyang/tomcat'
                withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
                    sh 'docker push mengqingyang/nginx'
                    sh 'docker push mengqingyang/tomcat'
                }
            }
        }
    }
}