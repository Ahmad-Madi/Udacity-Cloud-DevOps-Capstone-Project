pipeline {
  agent any
  stages {

    stage('Install Requirements') {
      steps {
        echo 'Installing hadolint'
        sh 'docker pull hadolint/hadolint'
      }
    }

    stage('Lint Dockerfile') {
      steps {
        echo 'Linting dockerfile for any syntax errors'
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
      }
    }

    stage('Build Docker image') {
      steps {
        echo 'Building Docker image'
        script {
          dockerImage = docker.build("sahlmady/minipaint", "-f Dockerfile .")
        }
      }
    }

    stage('Push image to Docker Hub') {
      steps {
        echo 'Pushing image to Docker Hub'
        script {
          docker.withRegistry( '', 'dockerhub_id' ) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploy to AWS Kubernetes cluster'
        withAWS(region: 'us-west-2', credentials: 'aws_credentials') {
          echo 'Deploying to EKS cluster'
          sh 'aws eks --region us-west-2 update-kubeconfig --name minipaintCluster'
          sh 'kubectl config use-context arn:aws:eks:us-west-2:204657556734:cluster/minipaintCluster'
          sh 'kubectl apply -f deployment.yml'
        }
      }
    }
  }
}