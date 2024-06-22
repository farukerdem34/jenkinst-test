pipeline {
    agent {
	    label "docker-agent"
    }

    stages {
	stage('Docker Compose'){
		echo "Running docker-compose.yml"
		sh "docker-compose up -d"
		echo "Docker compose completed."
	}
 }
}
