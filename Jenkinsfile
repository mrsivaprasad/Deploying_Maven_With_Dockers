pipeline
{
	agent any
	parameters{
		string(name:'tomcat_stage',defaultValue:'52.66.239.67',description:'Tomcat Staging server')
		string(name:'tomcat_prod',defaultValue:'13.233.150.196',description:'Tomcat Production server')
	}
	triggers{
		POLLSCM('* * * * *'')
	}
	stages{
		stage('Build')
		{
			steps{
				sh 'mvn clean package'
			}
			post{
				success{
					echo "Now Archiving"
					archiveArifacts artifacts: '**/target/*.war'
				}
			}
		}

		stage('Deployments')
		{
			parallel{
				stage('Deploy to staging')
				{
					steps{
						sh "scp -i 	/home/ec2-user/Tomcat_Keys/Tomcat-servers.pem **/target/*.war ec2-user@${params.tomcat_stage}:/home/ec2-user/apache-tomcat-8.5.34/webapps"
					}
				}

				stage('Deploy to Production')
				{
					steps{
						sh "scp -i 	/home/ec2-user/Tomcat_Keys/Tomcat-servers.pem **/target/*.war ec2-user@${params.tomcat_prod}:/home/ec2-user/apache-tomcat-8.5.34/webapps"
					}
				}

			}
		}

	}


}