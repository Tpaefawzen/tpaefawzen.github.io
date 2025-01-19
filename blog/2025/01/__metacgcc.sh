#!/bin/sh

### Generate html.

# Convert CSV into Unicage CSV-Value format
cat cgcc-posts.csv | parsrc.sh |
#
# 1. Row 2. Column 3/NF. Value
#
# Original CSV
# 1. Post Link
# 2. body
# 3. owneruserid
# 4. ownerdisplayname
awk '$2 <= 2' |
#
# Remove header line of original CSV
awk '$1 > 1' |
#
# Original CSV
# 1. Post Link
# 2. body
#
# Convert each body into actual one-field
sed '
    /^[0-9]* 2 /{
	s/_/\\_/g;
	y/ /_/;
	s/_/ /; s// /;
    }' |
#
# 1. Row 2. Column 3. Value
delf 1 2 |
#
# Now convert to tag-value field
paste -d ' ' - - > __cgcc.unicage

mojihame -l ./__cgcc.mojihame ./__cgcc.unicage  > __cgcc.html
