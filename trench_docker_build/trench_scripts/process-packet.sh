#!/bin/bash

echo "Welcome to Trench!" | figlet
echo $(date -u)
echo "========== =========== ========== ==========="

#Create folders
mkdir -p temp/neg/
mkdir -p temp/pos/

#Set file paths
FILES=$(find /home/ubuntu/devops_test/pcap_4 -type f -name '*.pcap')
FILES2=$(find /home/ubuntu/devops_test/pcap_12 -type f -name '*.pcap')

#Process benign traffic
for filename in $FILES; do
    input_path="$filename"
    output_path="${input_path%.pcap}.gz"
    echo "Processing ${input_path##*/}"
    joy/bin/joy bidir=1 tls=1 dist=1 "$input_path" > "temp/neg/${output_path##*/}"
done

#Process malware traffic
for filename in $FILES2; do
    input_path="$filename"
    output_path="${input_path%.pcap}.gz"
    echo "Processing ${input_path##*/}"
    joy/bin/joy bidir=1 tls=1 dist=1 "$input_path" > "temp/pos/${output_path##*/}"
done


echo "================================================================================="
echo "Done Processing files"
echo "================================================================================="
echo " "

echo "================================================================================" 
echo "Running Python3: Script"
echo "-------------------------------------------------------------------------------"

python3 trench.py temp/pos/ temp/neg/
