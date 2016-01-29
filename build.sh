#!/bin/bash
cd data
cat common.csv uncommon.csv rare.csv epic.csv legendary.csv > all_monsters.csv

# the next step requires the Perl module App::fsql to be installed
cat header.json > monsters.json
fsql  -aoh -a all_monsters.csv -f json "SELECT * FROM all_monsters" >> monsters.json
cat footer.json >> monsters.json
