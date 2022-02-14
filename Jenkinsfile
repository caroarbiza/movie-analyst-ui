node {
    // The first milestone step starts tracking concurrent build order

    stage('Build') {
        steps {
            echo "Building"
        }
        
    }
}

// This locked resource contains both Test stages as a single concurrency Unit.
// Only 1 concurrent build is allowed to utilize the test resources at a time.
// Newer builds are pulled off the queue first. When a build reaches the
// milestone at the end of the lock, all jobs started prior to the current
// build that are still waiting for the lock will be aborted
lock(resource: 'myResource', inversePrecedence: true){
    node('test') {
        stage('Unit Tests') {
            steps {
                echo "Unit Tests"
            }
            
        }
        stage('System Tests') {
            steps {
                echo "System Tests"
            }
            
        }
    }
  
}

// The Deploy stage does not limit concurrency but requires manual input
// from a user. Several builds might reach this step waiting for input.
// When a user promotes a specific build all preceding builds are aborted,
// ensuring that the latest code is always deployed.
node {
    input "Deploy?"
    stage('Deploy') {
        steps {
            echo "Deploying"
        }
        
    }
}