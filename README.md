# scripting-affinity-group
Currently working on scripts to make Finding Aids more accessible by adding language codes where needed.

1: Run extract-string-replace-apostrophe.xquery over an EAD file. Requires Oxygen XML Editor. Older version still in repo: extract-strings.xq

2: Run log-languages-in-csv.sh over results file. Requires: curl, Cloud SDK (gcloud), and jq (https://stedolan.github.io/jq/). Older versions still in repo: log-languages-with-jq.sh, bash-loop-attempt.sh, bash-attempt-star-delimiter.sh.



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
