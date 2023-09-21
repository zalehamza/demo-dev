pipeline {
    agent any

    environment {
        // Remplacez ces variables par vos informations
        DOCKERHUB_USERNAME = 'zalehamza'
        DOCKERHUB_PASSWORD = 'leil@2023'
        IMAGE_NAME = 'demo-app:latest'
        IMAGE_TAG = "1.0.0"
        GITHUB_TOKEN = credentials('zalehamza')
    }

    stages {
        // stage('Build Docker Image') {
        //     steps {
        //         script {
        //             // Construisez l'image Docker
        //             sh "docker build -t $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG ."
        //         }
        //     }
        // }

        // stage('Push to Docker Hub') {
        //     steps {
        //         script {
        //             // Authentifiez-vous sur Docker Hub
        //             sh "echo '$DOCKERHUB_PASSWORD' | docker login -u $DOCKERHUB_USERNAME --password-stdin"

        //             sh "docker tag $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
                    
        //             // Poussez l'image sur Docker Hub
        //             sh "docker push $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
        //         }
        //     }
        // }

        stage('Deploy to Kubernetes') {
            steps {
                script {

            //         sh "rm -rf demo-devops"
            //         sh 'git clone https://github.com/zalehamza/demo-devops.git'
            //         sh "cd demo-devops"
            //         sh "ls demo-devops"

            //         // Déploiement de l'application sur Kubernetes
            //         sh '''
            //             sed -i "s|IMAGE_NAME_PLACEHOLDER|IMAGE_NAME|g" demo-devops/deployment.yaml
                        
            //         '''

            //                   sh '''
                // git add demo-devops/deployment.yaml
            //     git commit -m "Update deployment.yaml"
            //     git push
            // '''
            sh "rm -rf demo-devops"
            sh 'git clone https://github.com/zalehamza/demo-devops.git'

            dir('demo-devops') {
                sh '''
                         sed -i "s|IMAGE_NAME_PLACEHOLDER|$IMAGE_NAME|g" deployment.yaml
                        
                     '''
                sh '''
                        git config --global user.email "zalehamza18@gmail.com"
                        git config --global user.name "zalehamza"
                        
                     '''
                sh "git add deployment.yaml"
                sh "git commit -m Update deployment.yaml"
                sh 'git push https://${GITHUB_TOKEN}@github.com/zalehamza/demo-devops.git'
            }


          
                    
                                        // Remplacer le placeholder par le vrai nom de l'image
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




