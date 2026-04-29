pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // This pulls your code from GitHub to the Jenkins workspace
                git branch: 'main', url: 'https://github.com/sarfathi/student-project-devops.git'
            }
        }

        stage('Build JAR') {
            steps {
                // Uses the Maven Wrapper to package your Java 21 app
                bat 'mvnw.cmd clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                // Builds the Docker image using the Dockerfile you created
                bat 'docker build -t student-app .'
            }
        }

        stage('Deploy') {
            steps {
                // Removes any old container and runs the new one on port 8081
                bat 'docker rm -f student-app-container || true'
                bat 'docker run -d -p 8081:8081 --name student-app-container student-app'
            }
        }
    }
}