pipeline {
  agent {
    label "docker-agent"
  }
  environment{
    HOST="http://192.168.100.135"
  }
  stages {
    stage('Stop and Remove Existing Containers') {
      steps{
        sh 'docker compose down'
      }
    }
    stage ('Run Docker Compose') {
      steps{
        sh 'docker compose up -d --build'
      }
    }
    stage ('Zaproxy Baseline Scan'){
      echo "Initializing baseling scan..."
      sh "docker run -v $(pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t ${HOST} -r testreport.html -w testreport.md -J testreport.json"
      echo "Baseling scan completed succesfully"
      sh "cat testreport.md"
    }
  }
}
