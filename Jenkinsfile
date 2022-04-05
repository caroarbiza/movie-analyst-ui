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
            sh "ssh -o StrictHostKeyChecking=no -l ec2-user 10.0.1.100 'sudo salt-key -A -y'"
            sh "ssh -o StrictHostKeyChecking=no -l ec2-user 10.0.1.100 'sudo salt '*' state.apply'"
            sh "ssh -o StrictHostKeyChecking=no -l ec2-user 10.0.1.100 'sudo salt-call --local cmd.run "/home/ubuntu/k8s-rampup/k8s-master.sh"'"    
        }
    }



}