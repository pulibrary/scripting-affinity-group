#!/bin/bash

# loops over csv file in bash and posts each line to the google translate API
# generates json results in a log file
# bug warning: it looks like quotes in the text are throwing off some results; may want to use a different delimiter for the csv

#replace paths to match location of local files

export GOOGLE_APPLICATION_CREDENTIALS="/Users/kellybolding/Desktop/udemy-python/private-key.json"

while IFS=, read f1 f2 f3
do
	curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) --data "{'q': '$f3'}" "https://translation.googleapis.com/language/translate/v2/detect"
done < "/Users/kellybolding/Desktop/udemy-python/strings.csv" > "/Users/kellybolding/Desktop/log.txt"