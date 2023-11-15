#! /bin/bash

echo $(date):Random read
fio --filename=/test-l2arc-cache/test --sync=1 --rw=randread --bs=4k --numjobs=1 \
  --iodepth=4 --group_reporting --name=test --filesize=10G --runtime=300 && rm test

echo $(date):Random write
fio --filename=/test-l2arc-cache/test --sync=1 --rw=randwrite --bs=4k --numjobs=1 \
  --iodepth=4 --group_reporting --name=test --filesize=10G --runtime=300 && rm test

echo $(date):Sequential read
fio --filename=/test-l2arc-cache/test --sync=1 --rw=read --bs=4k --numjobs=1 \
  --iodepth=4 --group_reporting --name=test --filesize=10G --runtime=300 && rm test

echo $(date):Sequential write
fio --filename=/test-l2arc-cache/test --sync=1 --rw=write --bs=4k --numjobs=1 \
  --iodepth=4 --group_reporting --name=test --filesize=10G --runtime=300 && rm test
