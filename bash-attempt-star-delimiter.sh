#!/bin/bash

# loops over csv file in bash and posts each line to the google translate API
# generates json results in a log file
# changed IFS=, to IFS=* because the XQuery uses * as a delimiter rather than a comma

#replace paths to match location of local files

export GOOGLE_APPLICATION_CREDENTIALS="/Users/rbscadmin/Desktop/scripting-test-files/private-key.json"

while IFS=* read f1 f2 f3
do
curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) --data "{'q': '$f3'}" "https://translation.googleapis.com/language/translate/v2/detect"
done < "/Users/rbscadmin/Desktop/scripting-test-files/output.csv" > "/Users/rbscadmin/Desktop/log.txt"