#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "Usage: getFirestoreProdData.sh {project name}"
    echo ""
    echo "The script will export the Firestore to the defualt storage bucket"
    echo "then download it into ./prod_data and delete it from the bucket."
    exit 1
fi

gcloud firestore export gs://"$1".appspot.com/prod_data --project "$1"
gsutil -m cp -r gs://"$1".appspot.com/prod_data .
gsutil rm -r gs://"$1".appspot.com/prod_data