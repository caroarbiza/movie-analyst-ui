node {
    stage('Build') {
        checkout scm
        def customImage = docker.build("caroarbiza/movie-frontend:1.8")
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
        customImage.push("1.8")
        }

    }
}


node {
    stage('Updates') {
        echo 'Updating'
        sshagent(credentials: ['SSH-EC2']) {
            sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.1.100 'sudo kubectl set image deployment frontend movie-analyst-ui=caroarbiza/movie-frontend:1.8 --record'"

        }
    }    
}