#!/bin/bash -e

# Set the build number from CircleCI or from date timestamp
export BUILD_NUM=${CIRCLE_BUILD_NUM:-`date +%Y%m%d%H%M%S`}

cd code

for i in *
do
    echo "Working in $i..."
    cd $i
    mvn package
    
    # Now, update the deployment template
    echo "Updating the manifest..."
    envsubst < ./kube/deployment.yml.template  > ./kube/deployment.yml
    
    echo "Done in $i."
    cd ..
done


