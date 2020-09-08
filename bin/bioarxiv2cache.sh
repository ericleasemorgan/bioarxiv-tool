#!/usr/bin/env bash

# bioarxiv2cache.sh - given an XML file of specific shape, cache PDF files from Bioarxiv

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 5, 2020 - first cut


# configure
XML2TSV='./bin/xml2tsv.sh'
HARVEST='./bin/harvest.sh'
METADATA='./metadata.tsv'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <xml>" >&2
	exit
fi

# get input
XML="$1"

# transform XML to TSV, harvest, and done
$XML2TSV $XML > "$METADATA"
$HARVEST "$METADATA"
exit
