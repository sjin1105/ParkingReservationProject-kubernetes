node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("django")
     }
     stage('Push image') {
         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
             app.push("1.0")
         }
     }
     
}
