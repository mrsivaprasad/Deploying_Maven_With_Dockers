pipeline
{
	agent any
	parameters{
		string(name:'tomcat_stage',defaultValue:'52.66.239.67',description:'Tomcat Staging server')
		string(name:'tomcat_prod',defaultValue:'13.233.150.196',description:'Tomcat Production server')
	}
	triggers{
		pollSCM('* * * * *')
	}
	stages{
/*		stage('Build')
		{
			steps{
				sh '/opt/maven/bin/mvn clean package'
			}
			post{
				success{
					echo "Now Archiving"
					archiveArtifacts artifacts: '**/target/*.war'
				}
			}
		}
*/
		stage('Deployments')
		{
			parallel{
				stage('Deploy to staging')
				{
					steps{
						sh "scp -o 'StrictHostKeyChecking no' -i /home/ec2-user/Tomcat_Keys/Tomcat-servers.pem /var/lib/jenkins/workspace/Maven_Project_FullyAutomatedPipleline/**/target/*.war ec2-user@${params.tomcat_stage}:/home/ec2-user/apache-tomcat-8.5.34/webapps/"
					}
				}

				stage('Deploy to Production')
				{
					steps{
						sh "scp  -o 'StrictHostKeyChecking no' -i /home/ec2-user/Tomcat_Keys/Tomcat-servers.pem /var/lib/jenkins/workspace/Maven_Project_FullyAutomatedPipleline/**/target/*.war ec2-user@${params.tomcat_prod}:/home/ec2-user/apache-tomcat-8.5.34/webapps/"
					}
				}

			}
		}

	}


}