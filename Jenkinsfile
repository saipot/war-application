pipeline {
     agent  { node{
                   label "jenkins"} 
      }
	 tools { 
        maven 'Maven home' 
        
    }
    stages {
        stage('Build') {
            agent { node{
                   label "jenkins"}
            }
			steps {
			    sh 'mvn -B -DskipTests clean package'
                sh 'echo "build ran"'
                archiveArtifacts artifacts: 'web-thymeleaf-war/target/mkyong.war', fingerprint:true
                junit '**/target/surefire-reports/*.xml'
				
        }
	}	
        
        stage ('Sonar Analysis') {
            agent { node{
                   label "jenkins"}
            }
            steps {
                sh 'echo "running sonar analysis"'
                sh "mvn sonar:sonar -Dsonar.host.url=http://sonarqube:9000 -Dsonar.branch=${env.BRANCH_NAME}"
            }   
        }
        
        stage ('Deploy to Integration') {
            agent {node{
                   label "jenkins"}
            }
            steps {
                build job:'../Tomcat Deploy To Integration' , parameters:[string(name: 'BRANCH_NAME', value: "${env.BRANCH_NAME}")]
            }
        }
    
  }

}