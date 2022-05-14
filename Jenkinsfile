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
                // sh "tflint --init"
                // sh "tflint"
            }
        }
        stage('terraform init') {
            steps {
                withCredentials([file(credentialsId: 'secrets.db', variable: 'secrets'), file(credentialsId: 'db.tfvars', variable: 'db')]) {
                    sh "terraform init -var-file $db $secrets"
                    sh "terraform validate"
                    }
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