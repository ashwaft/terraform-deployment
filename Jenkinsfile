pipeline {
    agent any
    stages{
        stage('Git') {
            steps {
                git branch: 'main', url: 'https://github.com/ashwaft/terraform-deployment'
            }
        }
        stage("Validation") {
            steps {
                sh "terraform fmt"
                sh "tflint"
            }
        }
        stage('terraform init') {
            steps {
                sh "terraform init"
            }
        }
        stage("terraform Action") {
            steps {
                echo "Terraform action: ${action}"
                sh("terraform ${action} --auto-approve")
            }
        }
    }
}