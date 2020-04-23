pipeline {
	agent any
	stages {
		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}
		stage('Upload to AWS.') {
			steps {
				retry(3) {
                    withAWS(credentials:'aws-static') {
						sh 'echo "Hello World"'
						sh '''
							echo "Multiline shell works too"
							ls -lah
						'''
						s3Upload(file:'index.html', bucket:'neha-jenkins-exercise', path:'index.html')
					}
                }
				timeout(time: 3, unit: 'MINUTES') {
                    sh './healthCheck.sh'
                }
			}
		}
	}
}
