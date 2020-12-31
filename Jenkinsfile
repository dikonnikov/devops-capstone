pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh '''tidy -q -e webcontent/*.html
   '''
      }
    }

    stage('Build image') {
<<<<<<< HEAD
      steps{
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
          sh 'docker build -t meow13th/nginx-web .'
        }
      }

=======
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
        sh 'docker build -t meow13th/nginx-web .'
        }
>>>>>>> 05b9a6fe78f99510261ea6e0b3b360293fdfad52
    }

    stage('Upload image') {

      steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
        sh 'docker image push meow13th/nginx-web'
        }
      }
    }

  }
}