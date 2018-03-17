pipeline {
    agent {
        node {
            label 'Node01'
        }
    }

    stages {

        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('git clone') {
            steps {
                sh 'sudo rm -r *;sudo git clone https://github.com/thanhth2813/lab01.git'
		sh 'mv lab01 jenkins'
            }
        }
        stage('tfsvars create'){
            steps {
                sh 'sudo cp /home/thanhth/variables.tf ./jenkins/'
		sh 'sudo cp /home/thanhth/terraform.tfvars ./jenkins/'
            }
        }
        stage('terraform init') {
            steps {
                sh 'sudo terraform init ./jenkins'
            }
        }
        stage('terraform plan') {
            steps {
		withEnv(["access_key=${access_key}", "secret_key=${secret_key}"]) 
			{
	                sh 'ls ./jenkins;terraform plan ./jenkins'
			}
            }
        }
	stage('terraform apply') {
            steps {
                withEnv(["access_key=${access_key}", "secret_key=${secret_key}"])
                        {
                        sh 'terraform apply ./jenkins'
                        }
            }
        }



        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
