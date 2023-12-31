#!/bin/bash
#---------------------------------------------------------
# written by: Lawrence McDaniel
#             https://lawrencemcdaniel.com
#
# date:       Aug-2022
#
# usage: generate a report of historical EC2 spot prices
#        for t3.medium instances type over the last 12
#        hours.
#--------------------------------------------------------

# macOS format
#TIMESTAMP=`date -v-12H +%Y-%m-%dT%H:%M:%S`

# Ubuntu format
TIMESTAMP=`date -Is`

# for welcome screen output
if [ $# == 2 ]; then
    EC2_SPOT_PRICE=$(/home/linuxbrew/.linuxbrew/bin/aws ec2 describe-spot-price-history --instance-types $1 --product-description Linux/UNIX --start-time ${TIMESTAMP})
    EC2_SPOT_PRICE=$(echo "$EC2_SPOT_PRICE" | jq -r '."SpotPriceHistory"[0].SpotPrice')
    echo "$EC2_SPOT_PRICE"
    exit 0
fi

if [ $# == 1 ]; then
    echo "probing for spot prices for EC2 instance type $1 in your default AWS region"
    aws ec2 describe-spot-price-history --instance-types $1 --product-description Linux/UNIX --start-time ${TIMESTAMP}
else
    echo "ec2-current-prices.sh"
    echo "Usage: ./ec2-current-prices.sh ec2-instance-type (example t3.xlarge) "
    exit 1
fi
