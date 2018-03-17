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
		withEnv(["TF_VAR_access_key=AKIAIT6PJELJVR6EJ2DQ", "TF_VAR_secret_key=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"]) 
			{
	                sh 'ls ./jenkins;terraform plan ./jenkins'
			}
            }
        }
	stage('terraform apply') {
            steps {
                withEnv(["TF_VAR_access_key=AKIAIT6PJELJVR6EJ2DQ", "TF_VAR_secret_key=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"])
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
