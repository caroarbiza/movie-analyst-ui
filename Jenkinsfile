node {
    stage('Build') {
        checkout scm
        def customImage = docker.build("caroarbiza/movie-frontend:latest")
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
        customImage.push("latest")
        }

    }
}


node{
     stage('Unit Tests') {
         echo "Unit Tests"
      }
      stage('System Tests') {
         echo "System Tests"
      }
}


node {
    stage('Deploy') {
        echo 'deploying the application'
        sshagent(credentials: ['SSH-EC2']) {
            sh "ssh -o StrictHostKeyChecking=no -l ec2-user 10.0.1.100 'sudo docker run -e PORT=80 -e BACKEND_URL=10.0.3.100:3036 -dp 80:80 caroarbiza/movie-frontend:latest'"
            sh "ssh -o StrictHostKeyChecking=no -l ec2-user 10.0.2.100 'sudo docker run -e PORT=80 -e BACKEND_URL=10.0.3.100:3036 -dp 80:80 caroarbiza/movie-frontend:latest'"
        }
    }
}