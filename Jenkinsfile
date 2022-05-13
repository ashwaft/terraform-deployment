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
                sh "terraform fmt -check -recursive -list=true -difft"
                sh "tflint"
            }
        }
        stage('terraform init') {
            steps {
                sh "terraform init"
                sh "terraform validate"
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