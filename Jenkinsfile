pipeline{
	agent any
	stages {    
		stage('gitclone') {
			steps {
				git branch: 'main', credentialsId: 'sjin1105', url: 'https://github.com/seungjin-1105/ParkingReservationProject-kubernetes.git'
			}
		}
		stage('build') {
			steps {
				script {
					dockerImage = docker.build('sjin1105/django')
				}
			}
		}
		stage('test') {
			steps {
				echo 'test....'
			}
		}
		stage('deploy') {
			steps {
				echo 'deploy....'
			}
		}
	}
}
