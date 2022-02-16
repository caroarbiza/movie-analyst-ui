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
                    sh "ssh -o StrictHostKeyChecking=no -l ec2-user 10.0.1.100 'sudo docker run -e PORT=80 -e BACKEND_URL=10.0.3.100:3036 -dp 80:80 caroarbiza/movie-frontend:2'"
                    sh "ssh -o StrictHostKeyChecking=no -l ec2-user 10.0.2.100 'sudo docker run -e PORT=80 -e BACKEND_URL=10.0.3.100:3036 -dp 80:80 caroarbiza/movie-frontend:2'"
                }
            }
        }
    }
}
