# scripting-affinity-group
Currently working on scripts to make Finding Aids more accessible by adding language codes where needed.

### Draft Workflow

1: Run extract-string-replace-apostrophe.xquery over an EAD file.
* This XQuery runs over an EAD file and creates a .csv file with cid, element name, string value (stripped of apostrophes), line break. Uses asterisk as a delimiter.
* Run as transformation scenario in Oxygen XML Editor.
* Older version still in repo: extract-strings.xq

2: Run log-languages-in-csv.sh over results file.
* This bash script runs over the ouput .csv file from #1, queries Google's translation API, and creates a new .csv file with the same information, plus a column with the language code assigned by the Google API.
* Requires: curl, Cloud SDK (gcloud), and jq (https://stedolan.github.io/jq/).
* Older versions still in repo: log-languages-with-jq.sh, bash-loop-attempt.sh, bash-attempt-star-delimiter.sh.
* Change file paths/filenames in script to match local location of files.

### Miscellaneous Notes

extract-strings.xq creates a CSV table with cid, field name, string value, line break. Uses asterisk (*) as a delimiter. To run this file, TBD...

Installing python:
 
Mac
Check for XCode (which we checked with `gcc --version`), install Homebrew, install Python `brew install python`. Create a file and use the output of extract-strings.xq as your csv input.

```
import csv, os

f = open('strings.csv')
csv_f = csv.reader(f)

for row in csv_f:
  os.system('echo -%s' row) // this doesn't work yet
```
