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
                sh 'sudo cp /home/thanhth/variable.tf ./jenkins/'
		sh 'sudo cp /home/thanhth/terraform.tfvars ./jenkins/'
		sh 'sudo cp /home/thanhth/mykey ./jenkins/'
		sh 'sudo cp /home/thanhth/mykey.pub ./jenkins/'
            }
        }
        stage('create server') {
	    steps {
		sh 'sudo terraform init ./jenkins'
		sh 'ls ./jenkins;terraform plan  ./jenkins'
		sh 'terraform apply -input=false -auto-approve ./jenkins'
		}
        }

        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
