#!/bin/bash -e

cd code

for i in *
do
    echo "Working in $i..."
    cd $i
    mvn package
    echo "Done in $i."
    cd ..
done


