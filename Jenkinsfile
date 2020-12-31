pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e webcontent/*.html'
      }
    }

    stage('Build image') {
      steps {
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
          sh 'docker build -t meow13th/nginx-web .'
        }

      }
    }

    stage('Upload image') {
      steps {
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
          sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
          sh 'docker image push meow13th/nginx-web'
        }

      }
    }

    stage('Rolling deployment to EKS') {
      steps {
        withAWS(region: 'us-east-1', credentials: 'Capstone') {
<<<<<<< HEAD
          sh 'kubectl set image deployment/devops-capstone nginx-web=meow13th/nginx-web:latest' 
=======
          sh 'kubectl set image deployment/devops-capstone nginx=meow13th/nginx-web:latest' 
>>>>>>> 978cc3a5e949a4639b8f5431221a3c1e8e654459
        }
      }
    }

  }
}