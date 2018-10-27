pipeline
{
	agent any
	triggers{
		pollSCM('* * * * *')
	}
	stages{
		stage('Build')
		{
			steps{
				sh '/opt/maven/bin/mvn clean package'
			}
			post{
				success{
					echo "Now Archiving"
					archiveArtifacts artifacts: '**starget*.war'
				}
			}
		}
	}
}