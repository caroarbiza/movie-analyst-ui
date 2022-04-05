node {
    stage('Build') {
        checkout scm
        def customImage = docker.build("caroarbiza/movie-frontend:latest")
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
        customImage.push("latest")
        }

    }
}



node {
    stage('Deploy') {
        echo 'deploying the application'
        sshagent(credentials: ['SSH-EC2']) {
            git credentialsId: 'jenkins-user-github', url: 'https://github.com/caroarbiza/k8s-rampup.git'
            sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.1.100 'sudo salt-key -A -y'"
           // sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.1.100 '/home/ubuntu/k8s-rampup/script.sh'" 
        }
    }



}