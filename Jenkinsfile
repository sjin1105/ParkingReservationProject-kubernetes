pipeline{

	agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('dckr_pat_FtAhiAjbnyemDbzfhXhpvPK6mik')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/seungjin-1105/ParkingReservationProject-kubernetes.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t sjin1105/docker:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push sjin1105/docker:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
