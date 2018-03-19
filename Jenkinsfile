pipeline {
    agent {
        node {
            label 'master'
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
                sh 'sudo cp /home/jenkins/variables.tf ./jenkins/'
		sh 'sudo cp /home/jenkins/terraform.tfvars ./jenkins/'
            }
        }
        stage('terraform init') {
            steps {
                sh 'sudo terraform init ./jenkins'
            }
        }
        stage('terraform plan') {
            steps {
		withEnv(["TF_VAR_access_key=AKIAIAYIZBQKTERMPOWA", "TF_VAR_secret_key=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"]) 
			{
	                sh 'ls ./jenkins;terraform plan ./jenkins'
			}
            }
        }
	stage('terraform apply') {
            steps {
                        withEnv(["TF_VAR_access_key=AKIAIAYIZBQKTERMPOWA", "TF_VAR_secret_key=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"])
			{
                        sh 'terraform apply -input=false -auto-approve ./jenkins'
			output "ip" {
				  value = "${aws_eip.ip.public_ip}"
                                    }					
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
