pipeline {
    agent any
    stages{
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ashwaft/terraform-deployment'
            }
        }
        stage('Terraform initialization') {
            steps {
                withCredentials([file(credentialsId: 'db', variable: 'db')]) {
                    sh 'terraform init -var-file $db'
                    }
                }
        }
        stage("Validation") {
            steps {
                sh "terraform fmt"
                sh "terraform validate"
            }
        }
        stage("Terraform Action") {
            steps {
                withCredentials([file(credentialsId: 'db', variable: 'db')]) {
                    echo "Terraform action: ${action}"
                    sh("terraform ${action} -var-file $db --auto-approve")
                    }
            }
        }
    }
}