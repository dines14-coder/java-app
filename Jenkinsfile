pipeline {
    agent any
    tools{
        maven "maven-3.9"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Hello World'
                git branch: 'main', url: 'https://github.com/dines14-coder/java-app.git'   
            }
        }
    

    
        stage('Build') {
            steps {
                sh 'ls -ltr'
                //sh 'mvn clean package'   
            }
        }
    

    
        stage('BuildImage and push') {
            environment {
                DOCKER_IMAGE = "dinesh14coder/java-app:${BUILD_NUMBER}"
                REGISTRY_CREDENTIALS = credentials('docker-cred')
            }
            steps {
                script{
                    sh 'docker --version'
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                    def dockerImage = docker.image("${DOCKER_IMAGE}")
                    docker.withRegistry('https://index.docker.io/v1/', "docker-cred"){
                        dockerImage.push()
                    }
                }   
            }
        }
    }
}
