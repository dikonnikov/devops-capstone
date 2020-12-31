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
        sh 'kubectl set image deployment.apps/devops-capstone nginx=meow13th/nginx-web:latest'
      }
    }

  }
}