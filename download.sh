#!/bin/bash
set -x

BASE=`dirname $0`
MIRROR="ftp.fu-berlin.de/pub/misc/movies/database/"

FILES=( "actors" "actresses" "aka-names" "aka-titles" "alternate-versions" "biographies" "business" "certificates" "cinematographers" "color-info" "complete-cast" "complete-crew" "composers" "costume-designers" "countries" "crazy-credits" "directors" "distributors" "editors" "genres" "german-aka-titles" "goofs" "iso-aka-titles" "italian-aka-titles" "keywords" "language" "laserdisc" "literature" "locations" "miscellaneous-companies" "miscellaneous" "movie-links" "movies" "mpaa-ratings-reasons" "plot" "producers" "production-companies" "production-designers" "quotes" "ratings" "release-dates" "running-times" "sound-mix" "soundtracks" "special-effects-companies" "taglines" "technical" "trivia" "writers" )
mkdir -p ${BASE}/rawimdb

for file in ${FILES[@]}
do
	wget --directory-prefix "${BASE}/raw" --timestamping --continue "${MIRROR}/${file}.list.gz"
done;

