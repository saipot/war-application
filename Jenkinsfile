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
                archiveArtifacts artifacts: 'target/mkyong.war', fingerprint:true
            
        }
	}	
        
        
        
        stage ('Deploy to Integration') {
            agent {node{
                   label "jenkins"}
            }
            steps {
                build job:'../"Tomcat Deploy To Integration"' , parameters:[string(name: 'BRANCH_NAME', value: "${env.BRANCH_NAME}")]
            }
        }
    
  }

}