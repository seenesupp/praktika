#!/bin/bash
#Colors
NC='\033[0m'
Green='\033[1;32m'

clear
echo -e "${Green}[Logide Otsing]${NC}"
echo

echo "1)Messages(Syslog) logid"
echo "2)Secure(Auth) logid"
echo
echo -n "Sisesta valiku number: "
read valik

echo -n "Siseta kuupäev(Jan 12): "
read kuupaev

echo -n "Siseta kellaaeg(15:23): "
read kellaaeg

echo -n "Sisesta otsingusõna: "
read votmesona

if [ $valik == 1 ]; then
cat /var/log/messages | grep "$kuupaev" | grep "$kellaaeg"  |  grep "$votmesona" | ccze -A
else
cat /var/log/secure | grep "$kuupaev" | grep "$kellaaeg"  |  grep "$votmesona" | ccze -A
fi
