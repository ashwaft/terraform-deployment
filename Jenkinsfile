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
                withCredentials([file(credentialsId: 'db', variable: 'db')]) {
                    sh 'terraform init -var-file $db'
                    sh "terraform validate"
                    }
                }
        }
        stage("terraform Action") {
            steps {
                withCredentials([file(credentialsId: 'db', variable: 'db')]) {
                    echo "Terraform action: ${action}"
                    sh("terraform ${action} -var-file $db --auto-approve")
                    }

            }
        }
    }
}