pipeline {
	agent any
	stages {
		stage('Upload to AWS.') {
			steps {
				withAWS(credentials:'aws-static') {
					sh 'echo "Hello World"'
					sh '''
						echo "Multiline shell works too"
						ls -lah
					'''
					s3Upload(file:'index.html', bucket:'neha-jenkins-exercise', path:'index.html')
				}
				
			}
		}
	}
}
