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
		withEnv(["TF_VAR_access_key=AKIAJ52RA3KUVJKFPVVQ", "TF_VAR_secret_key=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"]) 
			{
	                sh 'ls ./jenkins;terraform plan ./jenkins'
			}
            }
        }
	stage('terraform apply') {
            steps {
                withEnv(["TF_VAR_access_key=AKIAJ52RA3KUVJKFPVVQ", "TF_VAR_secret_key=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"])
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
