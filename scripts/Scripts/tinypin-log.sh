#!/bin/bash
#
# i use this to check on the files uploaded to my tinypin instance regularly
# because tinypin has no admin dashboard or whatever
# use the extract cmd provided at the end or else u get ugly empty folders

basedir="/mnt/tank/tinypin-data/images"
WD="/home/kat/tinypin-log"
now=$(date "+%Y-%m-%d")

cd ${WD} && mkdir -p ${WD}/${now}

newdir=$(echo "${WD}/${now}")

for f in *.jpg *.JPG *.jpeg *.png *.webp *.gif; do
  cd ${basedir} && find . -type f -not -path "./1/*" -exec cp --parent -t ${newdir}/ {} +
done

cd ${WD} && tar -czf ${now}.tar.gz -C ${WD} .

/bin/rm -rf ./${now}

# extract:
# tar xzf *.tar.gz --transform='s/.*\///' && find . -type d -empty -delete
