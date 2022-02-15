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
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@18.228.214.12'
                    sh 'mkdir /home/ec2-user/test'
                }
            }
        }
    }
}
