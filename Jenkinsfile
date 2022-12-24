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
			 sh('sed -i "s|image|image: sjin1105/django:$BUILD_NUMBER|g" ./ArgoCD/django/django-deploy.yaml')
			 sh('')
			 sh('git add .')
			 sh('git config --global user.email "sjin110550@gmail.com"')
			 sh('git config --global user.name "sjin110550"')
			 sh('git commit -m "$BUILD_NUMBER"')
			 sh('git push origin main')
                    }
     }
}
