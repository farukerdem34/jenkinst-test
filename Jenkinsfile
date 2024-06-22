pipeline {
    agent any

    stages {
	stage('Checkout'){
		git "https://github.com/farukerdem34/jenkinst-test.git"
	}
	stage('Docker Compose'){
		echo "Running docker-compose.yml"
		sh "docker-compose up -d"
		echo "Docker compose completed."
	}
   post {
        always {
            
            echo 'Pipeline completed.'
        }
    }
}
