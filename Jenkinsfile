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
             sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@https://github.com/seungjin-1105/ParkingReservationProject-kubernetes.git')
                    }
     }
}
