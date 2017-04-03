#!/bin/bash

source /etc/JARVICE/jobinfo.sh
source /etc/JARVICe/jobenv.sh

if [ ! -f $OUTPUT_FILE ]; then
  echo "timestamp,job_name" > $OUTPUT_FILE

fi

fio --name=randrw --ioengine=libaio --iodepth=16 --rw=randrw --bs=4k --direct=1 --size=1G --numjobs=8 --runtime=120 --group_reporting

timestamp=`date --iso-8601=seconds`
