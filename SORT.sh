#!/bin/bash

/usr/bin/python /root/test.py > /root/text.txt
cp /var/www/html/GRAPHS/HTML.txt /var/www/html/GRAPHS/HTML1.txt

> /var/www/html/GRAPHS/HTML.txt

cat /root/text.txt | sed 's/\\n/\n/g' | sed 's/\\r/ /g' | grep pp | egrep -v cli | awk '{print $2}' | sort | uniq -c |
awk -F"et-0/2/1." '{print $2,$1}' | sort | while read VLAN COUNT1
do
        VLANNAME=`cat /root/VLAN.txt | grep -w $VLAN | awk -F"|" '{print $2}'`
        COUNT2=`cat /var/www/html/GRAPHS/HTML1.txt | awk -F":" '{print $2,$4}' | grep -w ^${VLAN} | awk '{print $2}'`
        # echo $COUNT1 $COUNT2
        # if [[ $COUNT2 > $COUNT1 ]]; then
        if [[ "$COUNT2" -ge "$COUNT1" ]]; then
                COUNT3=$COUNT2
        else
                COUNT3=$COUNT1
        fi
        echo $VLANNAME:"$VLAN:"$COUNT1":"$COUNT3 >> /var/www/html/GRAPHS/HTML.txt

done

VLAN_COUNT1=`cat /var/www/html/GRAPHS/HTML1.txt | wc -l`
VLAN_COUNT2=`cat /var/www/html/GRAPHS/HTML.txt | wc -l`
if [[ "$VLAN_COUNT1" -gt "$VLAN_COUNT2" ]]; then
cat /var/www/html/GRAPHS/HTML1.txt | while IFS=':' read ZONE VLAN CURN MAX
do
        EXIST=`cat /var/www/html/GRAPHS/HTML.txt | awk -F":" '{print $2}' | grep -w ${VLAN}`
        if [[ -z $EXIST ]]; then
                echo $ZONE":"$VLAN":0:"$MAX >> /var/www/html/GRAPHS/HTML.txt
        fi
        # echo $VLAN
done
fi
# cp /var/www/html/GRAPHS/TOTALC.txt /var/www/html/GRAPHS/TOTALC1.txt

cat /root/text.txt | sed 's/\\n/\n/g' | sed 's/\\r/ /g' | grep pp | egrep -v cli | awk '{print $2}' | wc -l > /var/www/
html/GRAPHS/TOTALC.txt

# cat /root/HTML.txt
TOTALCOUNT_OLD=`cat /var/www/html/GRAPHS/TOTALC2.txt`
TOTALCOUNT=`cat /var/www/html/GRAPHS/TOTALC.txt`
        if [[ "$TOTALCOUNT_OLD" -ge "$TOTALCOUNT" ]]; then
                TOTALCOUNT2=$TOTALCOUNT_OLD
        else
                TOTALCOUNT2=$TOTALCOUNT
        fi
echo "$TOTALCOUNT2" > /var/www/html/GRAPHS/TOTALC2.txt

/root/Convert.sh -d ":" -f /var/www/html/GRAPHS/HTML.txt > /var/www/html/GRAPHS/ONLINE.html
