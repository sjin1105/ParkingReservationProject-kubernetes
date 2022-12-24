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
         steps {
             git credentialsId: 'git_key',
                 url: 'https://github.com/seungjin-1105/ParkingReservationProject-kubernetes.git',
                 branch: 'main'

             sh "sed -i 's/image/image: sjin1105/django:$BUILD_NUMBER/g' ./ArgoCD/django/django-deploy.yaml"
             sh "git add ."
             sh "git commit -m '[UPDATE] django $BUILD_NUMBER image versioning'"
             sh "git push origin main"
             }
     }
}
