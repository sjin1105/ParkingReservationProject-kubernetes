node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("sjin1105/django")
     }
     stage('Push image') {
         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
             app.push("1.1")
         }
     }
     
}
