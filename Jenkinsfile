pipeline {
  agent {
    label "docker-agent"
  }
  environment{
    HOST="http://192.168.100.135"
    REPORT_DIR="/home/jenkins/report"
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
      steps{
      echo "Initializing baseling scan..."
      sh "rm -rf $REPORT_DIR/report"
      sh "mkdir -p $REPORT_DIR/report"
      sh "chmod 777 $REPORT_DIR/report"
      sh "docker run --rm -v $REPORT_DIR/:/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t ${HOST} -r $REPORT_DIR/report/testreport.html -w $REPORT_DIR/report/testreport.md -J $REPORT_DIR/report/testreport.json"
      echo "Baseling scan completed succesfully"
      sh "cat $REPORT_DIR/testreport.md"
      }
    }
  }
}
