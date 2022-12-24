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
            git credentialsId: '{Credential ID}',
                url: 'https://github.com/seungjin-1105/ParkingReservationProject-kubernetes.git',
                branch: 'master'

            sh "sed -i 's/image/image: sjin1105/django:$BUILD_NUMBER/g' ./ArgoCD/django/django-deploy.yaml"
            sh "git add deployment.yaml"
            sh "git commit -m '[UPDATE] django $BUILD_NUMBER image versioning'"
            sshagent(credentials: ['{k8s-manifest repository credential ID}']) {
                sh "git remote set-url origin git@https://github.com/seungjin-1105/ParkingReservationProject-kubernetes.git"
                sh "git push -u origin main"
             }
        }
        post {
                failure {
                  echo 'K8S Manifest Update failure !'
                }
                success {
                  echo 'K8S Manifest Update success !'
                }
        }
    }
}
