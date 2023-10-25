pipeline {
    agent any
    environment {
        PATH = "/opt/maven3/bin:$PATH"
    }
    stages {
        stage("git checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/priyavamsi/projectdemo.git'
            }
        }
        stage("maven build") {
            steps {
                sh "mvn clean package"
                sh "mv target/*.war target/myweb.war"
            }
        }
        stage("deploy-dev") {
            steps {
                sshagent(['tomcat-new']) {
                    sh """
                    scp -o StrictHostKeyChecking=no target/myweb.war ec2-user@172.31.13.244:/home/ec2-user/apache-tomcat-9.0.82/webapps/
                    ssh ec2-user@172.31.13.244 '/home/ec2-user/apache-tomcat-9.0.82/bin/shutdown.sh'
                    ssh ec2-user@172.31.13.244 '/home/ec2-user/apache-tomcat-9.0.82/bin/startup.sh'
                    """
                }
            }
        }
    }
}
