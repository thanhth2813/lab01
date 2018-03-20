pipeline {
    agent {
        node {
            label 'Host01'
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
		withEnv(["TF_VAR_access_key=AKIAJRXMAOEOAUGY3G2Q", "TF_VAR_secret_key=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"]) 
		{	
	                sh 'ls ./jenkins;terraform plan ./jenkins'
		}	
            }
        }
	stage('terraform apply') {
            steps   { 
                  withEnv(["TF_VAR_access_key=AKIAJRXMAOEOAUGY3G2Q", "TF_VAR_secret_key=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"])
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
