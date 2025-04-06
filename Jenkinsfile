pipeline {
    agent {
        label 'agent-1'
    }
    options {
                // timeout(time: 100, unit: 'SECONDS')
                timeout(time: 10, unit: 'MINUTES')
                disableConcurrentBuilds() 
                 ansiColor('xterm')
            }
    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the appication version?')

    }
    environment {
        def appVersion = '' //variable declaration
        nexusUrl = 'jenkins-nexus.daws78s.xyz:8081'
    }
    stages {
        stage('print the version') {
            steps {
                script {
                    echo "Application version: ${params.appversion}"
                }
            }
        }
        stage('Init') {
            steps {
                sh """
                cd terraform
                terraform init
                """
            }
        }
        stage('Plan') {
            steps {
                sh """
                cd terraform
                terraform plan -var="app_version=${params.appVersion}"
                """
            }
        }
        stage('Deploy') {
            steps {
                sh """
                cd terraform
                terraform apply -auto-approve -var="app_version=${params.appVersion}"
                """
            }
        }
    }
        
    post { 
            always { 
                echo 'I will always say Hello again!'
                deleteDir()
            }
            success { 
                echo 'I will run when pipeline sucess'
            }
            failure { 
                echo 'I will run when pipeline failure'
            }
        }
    }
