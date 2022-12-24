node {
     stage('Clone repository') {
	 sh('cd .. && rm -rf ParkingReservationProject-kubernetes')
         sh('cd kube && rm -rf ParkingReservationProject-kubernetes')
	 sh('git clone https://github.com/seungjin-1105/ParkingReservationProject-kubernetes.git && cd ParkingReservationProject-kubernetes')
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
			 sh('sed -i "s|image: *|image: sjin1105/django:$BUILD_NUMBER|g" ./ArgoCD/django/django-deploy.yaml')
			 sh('git checkout main')
			 sh('git add .')
			 sh('git config --global user.email "sjin110550@gmail.com"')
			 sh('git config --global user.name "sjin110550"')
			 sh('git commit -m "$BUILD_NUMBER"')
			 sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/seungjin-1105/ParkingReservationProject-kubernetes.git')
                    }
     }
}
