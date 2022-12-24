node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("sjin1105/django")
     }
     stage('Push image') {
         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
         app.push("$BUILD_NUMBER")
	     app.push("latest")
         }
     }
     stage('K8S Manifest Update') {
         withCredentials([usernamePassword(credentialsId: 'git_key', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
			sh('git config --global user.email "user@test.com"')
            sh('git config --global user.name "Jenkins"')
            sh('git config --global push.default simple')
			sh('git checkout -b master')
			sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@https://github.com/seungjin-1105/ParkingReservationProject-kubernetes.git')
         }
     }
}
