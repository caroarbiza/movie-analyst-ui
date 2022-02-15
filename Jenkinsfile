pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                echo 'building'
            }
        }
        stage("test") {
            steps {
                echo 'testing the application...'
            }
        }
        stage("deploy") {
            steps {
                echo 'deploying the application'
                sshagent(credentials: ['SSH-EC2']) {
                    sh 'ssh -o StrictHostKeyChecking=no user@hostname.com uptime'
                    sh 'ssh -v user@hostname.com'
                    sh 'touch /home/ec2-user/test'
                }
            }
        }
    }
}
