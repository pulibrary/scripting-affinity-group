#!/bin/bash

# loops over csv file in bash and posts each line to the google translate API
# creates new csv file with returned language code inserted as an additional field (separator is *)
# note: see http://www.unixguide.net/unix/bash/E4.shtml for why you can't just create a new variable by piping the curl output to read

#requires: curl, Cloud SDK (gcloud), and jq (https://stedolan.github.io/jq/)
#replace paths to match location of local files

export GOOGLE_APPLICATION_CREDENTIALS="/Users/rbscadmin/Desktop/scripting-test-files/private-key.json"

while IFS=* read f1 f2 f3
do
langcode=$(curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) --data "{'q': '$f3'}" "https://translation.googleapis.com/language/translate/v2/detect" | jq -r ".data.detections[0][0].language")
echo "$f1*$f2*$f3*$langcode" >> "/Users/rbscadmin/Desktop/log.csv"
done < "/Users/rbscadmin/Desktop/scripting-test-files/output.csv"
