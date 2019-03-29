pipeline {
    //agent any
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
       stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'cp target/*.war $HOME/build'
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
