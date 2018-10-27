pipeline
{
	agent any
	/*triggers{
		pollSCM('* * * * *')
	}*/
	stages{
		stage('Build')
		{
			steps{
				sh "pwd"
				sh "/opt/maven/bin/mvn clean package"
				sh "/usr/bin/docker build . -t tomcatwebapp:${env.BUILD_ID}"		
			}
			post{
				success{
					echo "BUILDING DOCKERFILE"
					archiveArtifacts artifacts: '**/target/*.war'
				}
			}
		}
	}
}