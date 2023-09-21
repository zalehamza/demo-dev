pipeline {
    agent any

    environment {
        // Remplacez ces variables par vos informations
        DOCKERHUB_USERNAME = 'zalehamza'
        DOCKERHUB_PASSWORD = 'leil@2023'
        IMAGE_NAME = 'demo-app'
        IMAGE_TAG = "v${BUILD_NUMBER}"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Construisez l'image Docker
                    sh "docker build -t $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Authentifiez-vous sur Docker Hub
                    sh "echo '$DOCKERHUB_PASSWORD' | docker login -u $DOCKERHUB_USERNAME --password-stdin"

                    sh "docker tag $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
                    
                    // Poussez l'image sur Docker Hub
                    sh "docker push $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Remplacer le placeholder par le vrai nom de l'image
                   sh 'sed -i "s|IMAGE_NAME_PLACEHOLDER|'${DOCKERHUB_USERNAME}'/'${IMAGE_NAME}':'${IMAGE_TAG}'|g" deployment.yaml'
                }
            }
        }
    }

    post {
        always {
            // Déconnexion de Docker Hub après la fin du pipeline
            sh 'docker logout'
        }
    }
}
