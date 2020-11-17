#!/bin/bash

MOBILENO123=$1
# %k %p %n %b
MESSAGE123=$2
MESSAGE1234=`echo $MESSAGE123 | sed 's/\%/ percent/g'`
MESSAGE123="${MESSAGE1234// /+}"
#NUMBE=$3
#UBIDS=$4
# DRIV=$5
# ADDRESS=$6


/usr/bin/curl https://x.x.x.x/smsapi/httpapi.jsp?username=Xxxxxx\&password=xxxxx\&from=xxxxxx\&to=${MOBILENO123}\&text=${MESSAGE123}
#DATE1=`/bin/date +%H:%M:%S.%N`

#echo "{" > /tmp/UNI_WAN_$DATE1
#echo "\"username\" : \"xxxx\"," >> /tmp/UNI_WAN_$DATE1
#echo "\"password\" : \"xxxxx\"," >> /tmp/UNI_WAN_$DATE1
#echo "\"from\" : \"xxxxx\"," >> /tmp/UNI_WAN_$DATE1
#echo "\"to\" : \"${MOBILENO123}\"," >> /tmp/UNI_WAN_$DATE1
#echo "\"text\" : \"${MESSAGE123}\"," >> /tmp/UNI_WAN_$DATE1
#echo "\"coding\" : \"0\"," >> /tmp/UNI_WAN_$DATE1
#echo "\"flash\" : \"1\"" >> /tmp/UNI_WAN_$DATE1
#echo "}" >> /tmp/UNI_WAN_$DATE1




#URL="http://xx.xx.xx.xx/smsapi/jsonapi.jsp"
# cat /tmp/UNI_WAN_$DATE1
#curl --max-time 20 -d @/tmp/UNI_WAN_$DATE1 -H "Content-Type: application/json" -X POST $URL
#rm -rf /tmp/UNI_WAN_$DATE1

# JSON API
# For bulk SMS sending, write JSON data in format given below and post to URL given.
# JSON Format for Single SMS to Single/Multiple Numbers:
# URL: You will call the below URL using POST method

# http://xx.xx.xx.xx/smsapi/jsonapi.jsp
# OR
# https://xx.xx.xxx.xx/smsapi/jsonapi.jsp
# {
# "username" : "XXXXXXXXX",
# "password" : "XXXXXXXX",
# "from" : "XXXXXX",
# "to" : [ "XXXXXXXXXX","XXXXXXXXXX","XXXXXXXXXX","XXXXXXXXXX", …………………"XXXXXXXXXX" ],
# "text" : "This is testing for json data",
# "coding" : "0",
# "flash" : "1",
# “scheduletime” : "XXXX-XX-XX XX:XX"
# }

# Compulsory Parameter Description
# 1. username: Valid User Name provided, when user registers for an account
# 2. password: Valid Password provided in combination with the Username, when user registers
# for an account.
# 3. to: comma separated mobile numbers on which message will be delivered. (Example
# 98XXXXXXXX).
# 4. from: from parameter refers to the Sender Id registered for sending messages
# 5. text: text parameter refers to the Message content, which needs to be sent to entered Mobile
# Number. (Example: Written content will be sent.)
# Optional Parameter Description
# 1. coding: If you want to send Unicode SMS, then enter value as 2. If you do not use this
# parameter, then it will take non-Unicode by default.
# 2. scheduletime: Schedule time to deliver this message in the format of YYYY-MM-DD HH:mm
# 3. flash: If you want to send Flash SMS, then enter value as per below requirement:
#  1 : This type supports all modern handsets and English SMS count will be as 70 chars per
# SMS (like non –English SMS).
#  2 : This type might be not supports all modern handsets and English SMS count will be
# as 160 chars per SMS (like other English SMS).
