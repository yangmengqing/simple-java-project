pipeline {
    agent any
    stages {
    //    stage('Build') {
    //         steps {
    //             script {
    //                 def mvnHome = tool 'Maven'
    //                 sh "${mvnHome}/bin/mvn clean package"
    //             }
                
    //         }
    //         post {
    //             always {
    //                 junit 'target/surefire-reports/*.xml' 
    //             }
    //         }
    //     } 
    //     stage('Publish to DockerHub') {
    //         steps {
    //             sh 'docker build -t tomcat -f tomcat/Dockerfile .'
    //             sh 'docker tag tomcat mengqingyang/tomcat'
    //             sh 'docker build -t nginx -f nginx/Dockerfile .'
    //             sh 'docker tag nginx mengqingyang/nginx'
    //             withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
    //                 sh 'docker push mengqingyang/nginx'
    //                 sh 'docker push mengqingyang/tomcat'
    //             }
    //         }
    //     }
        stage('Deploy to Stack') {
            agent {
                docker { image 'ansible/ubuntu14.04-ansible:stable'}
            }
            steps {
                sh 'cd ansible && ansible-playbook playbook.yml --tags=deploy_service'
            }
        }
    }
}