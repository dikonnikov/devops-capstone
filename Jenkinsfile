pipeline {
  agent any
  stages {
    stage('error') {
      steps {
        sh '''tidy -q -e webcontent/*.html
   '''
      }
    }

  }
}