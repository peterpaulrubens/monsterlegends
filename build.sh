#!/bin/bash
cd data
cat common.csv uncommon.csv rare.csv epic.csv legendary.csv > all_monsters.csv

# the next step requires the Perl module App::fsql to be installed
for tier in common uncommon rare epic legendary all_monsters; do
    cat header.json > ${tier}.json;
    fsql  -aoh -a ${tier}.csv -f json "SELECT * FROM ${tier}" >> ${tier}.json;
    cat footer.json >> ${tier}.json;
done;
