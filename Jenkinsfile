pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps { git branch: 'main', url: 'https://github.com/sarfathi/student-project-devops.git' }
        }
        stage('Build JAR') {
            steps { bat 'mvnw.cmd clean package -DskipTests' }
        }
        stage('Docker Build') {
            steps { bat 'docker build -t student-app:latest .' }
        }
        stage('Kubernetes Deploy') {
            steps {
                // This applies the YAML files to your local Kubernetes cluster
                bat 'kubectl apply -f deployment.yaml'
                bat 'kubectl apply -f service.yaml'
                
                // Optional: Force a restart to use the newest image
                bat 'kubectl rollout restart deployment/student-app-deployment'
            }
        }
    }
}