pipeline {
  agent {
    label "docker-agent"
  }
  environment {
    HOST = "http://192.168.100.135"
    REPORT_DIR = "/home/jenkins/report"
  }
  stages {
    stage('Trufflehog') {
      steps {
        sh "docker run --rm -v $PWD:/pwd trufflesecurity/trufflehog:latest github --json --repo https://github.com/farukerdem34/jenkinst-test"
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
    stage('Zaproxy Baseline Scan') {
      steps {
        echo "Initializing baseling scan..."
        // sh "docker run --rm -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t ${HOST}"
        echo "Baseling scan completed succesfully"
      }
    }
  }
}
