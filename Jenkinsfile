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
        sh 'docker build --tag=minipaint .'
      }
    }

    stage('Upload Docker image to Docker Hub') {
      steps {
        echo 'Pushing image to docker hub'
        script {
          docker.withRegistry( '', 'dockerhub') {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying to AWS Kubernetes cluster'
        withAWS(region: 'us-west-2') {
          echo 'Deploying to EKS cluster'
          sh 'aws eks --region us-west-2 update-kubeconfig --name minipaintCluster'
          sh 'kubectl config use-context arn:aws:eks:us-west-2:204657556734:cluster/minipaintCluster'
          sh 'kubectl apply -f deployment.yml'
          sh 'kubectl get pods'
          sh 'kubectl get services'
        }
      }
    }

  }
}