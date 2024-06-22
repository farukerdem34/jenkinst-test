pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo "Checkout scm"
                checkout scm
                echo "Checkout completed"
            }
        }
        stage('Run Script') {
            steps {
                echo "Runnig Python3 Server on Port 80"
                sh 'python3 myscript.py -p 80'
            }
        }
    }
    post {
        always {
            
            echo 'Pipeline completed.'
        }
    }
}
