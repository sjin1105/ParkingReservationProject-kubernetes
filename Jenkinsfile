node {
     stage('Clone repository') {
         checkout scm
     }
     step([$class: 'DockerBuilderPublisher', cleanImages: false, cleanupWithJenkinsJobDelete: false, cloud: '', dockerFileDirectory: 'dockerfile', fromRegistry: [], pushCredentialsId: 'sjin1105', pushOnSuccess: false, tagsString: ''])
     stage('Build image') {
         app = docker.build("sjin1105/django_image")
     }
     stage('Push image') {
         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
             app.push("latest")
         }
     }
     
}

stage('Build image') {
  app = docker.build("gasbugs/flask-example")
}

stage('Push image') {
  docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') 
  {
     app.push("latest")
  }
}
