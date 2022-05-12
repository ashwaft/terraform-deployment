pipeline {
    agent any
    environment {
        PATH = "${PATH}:tool name: 'terraform-deployment', type: 'terraform'"
    }
    stages{
        stage('terraform init') {
            steps {
                sh "terraform init"
            }
        }
    }
}