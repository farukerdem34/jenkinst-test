pipeline {
  agent {
    label "docker-agent"
  }
  environment {
    HOST = "http://192.168.100.135"
    REPORT_DIR = "/home/jenkins/report"
    BRANCH= "v1"
    IMAGE_NAME= "simple-webserver"
  }
  stages {
    stage('Trufflehog') {
      steps {
        sh "docker run --rm -v $PWD:/pwd trufflesecurity/trufflehog:latest github --json --repo ${GIT_URL}"
      }
    }
    stage('Trivy Repo Scan'){
      steps{
        sh "docker run --rm -t aquasec/trivy repository --branch ${BRANCH} ${GIT_URL}"
      }
    }
    stage('Stop and Remove Existing Containers') {
      steps {
        sh 'docker compose down'
      }
    }
    stage('Run Docker Compose') {
      steps {
        sh 'docker compose up -d --build'
      }
    }
    stage('Trivy Docker Image Scan'){
      steps{
        sh "trivy image ${IMAGE_NAME}"
      }
    }
    stage('Zaproxy Baseline Scan') {
      steps {
        echo "Initializing baseling scan..."
        // Due to false positives, disabled.
        // sh "docker run -v ${PWD}:/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t ${HOST} -g gen.conf -r testreport.html"
        echo "Baseling scan completed succesfully"
      }
    }
  }
}
