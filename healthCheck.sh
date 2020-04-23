#!/bin/bash

touch output.html
diff -q index.html output.html
while [ $? -ne 0 ]; do
    curl https://neha-jenkins-exercise.s3-us-west-2.amazonaws.com/index.html -o output.html
    diff -q index.html output.html
done
    
