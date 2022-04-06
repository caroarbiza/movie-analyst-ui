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
    stage('Deploy') {
        echo 'deploying the application'
        sshagent(credentials: ['SSH-EC2']) {
            sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.1.100 'sudo salt-key -A -y'"   
            sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.2.100 'git clone https://github.com/caroarbiza/k8s-rampup.git'"
            sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.1.100 'git clone https://github.com/caroarbiza/k8s-rampup.git'"
            sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.1.100 'sudo cp /home/ubuntu/k8s-rampup/top.sls /srv/salt/ '"
            sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.1.100 'sudo cp /home/ubuntu/k8s-rampup/k8s.sls /srv/salt/ '" 
            sh "ssh -o StrictHostKeyChecking=no -l ubuntu 10.0.1.100 '/home/ubuntu/k8s-rampup/script.sh'" 
             
        }
   }



}