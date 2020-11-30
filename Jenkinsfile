pipeline {
     agent none 
      
	 tools { 
        maven 'apache-maven-3.6.3' 
        
    }
    stages {
        stage('Build') {
            
			steps {
			
			   git url: 'https://github.com/saipot/war-application.git'
			    withmaven {
                parallel(
				sh 'find / -name apache-maven-3.6.3.*'
				sh 'grep -iRn apache-maven-3.6.3'
				sh 'echo $PATH'
				sh 'mvn clean package'
                sh 'echo "build ran"'
                archiveArtifacts artifacts: 'web-thymeleaf-war/target/mkyong.war', fingerprint:true
                junit '**/target/surefire-reports/*.xml'
				}
            )
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