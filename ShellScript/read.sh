# Estrutura read
echo "Digite seu nome: "
read NOME

# Parâmetros
-a	Todas as opções irá ser armazenadas em um array até você pressionar ENTER
-d	Caractere delimitador, só irá sair quando ele for informado
-e	Readline é utilizado para obter o valor se é proveniente de um terminal
-i	Usa um texto inicial de readline
-n	Seta o numero de caracteres a ser digitado antes de continuar
-p	Prompt interativo, onde você pode informar uma string a ser exibida e irá ler o que voce digitar
-r	Elemina o uso de para caracteres de escape, nunca precisei utilizar este
-s	Silent mode, não é feito o echo do que é digitado, como digitar senha no terminal
-t	Timeout, tempo limite que irá aguardar o operador digitar algo
-u	Lê a partir de um file descriptor no lugar do input do terminal

######################################################################################
################################## Exemplos Scripts ##################################
######################################################################################

----> ExRead01.sh

#!/bin/bash
# O exemplo mais básico com read, armazenando o valor digitado na variável NOME
echo -e "Digite seu nome:"
read NOME

# Utilizando -p e uma string, ignorando o uso do echo e armazenando na variável IDADE
read -p "Digite sua idade: " IDADE

# Utilizando -a para uma array de opções, sendo digitado com espaços e finalizando com ENTER
read -a DISTRIBUICOES -p "Informe as distribuições linux que você usa: "

# Mostrando na tela do que foi digitado
echo
echo -e "Seu nome: $NOMEn"
echo -e "Sua idade: $IDADEn"
echo -e "Voce usa as seguintes Distribuicoes: "
for dist in ${DISTRIBUICOES[@]}
do
echo "$dist"
done

{SAÍDA}

cleiton@linuxVM:~/projetos/shell script/read_shift$ ./ExRead01.sh
Digite seu nome:
Cleiton Bueno
Digite sua idade: 26
Informe as distribuições linux que você usa: Ubuntu Debian Mint CentOS Fedora Debian

Seu nome: Cleiton Bueno

Sua idade: 26

Voce usa as seguintes Distribuicoes:
Ubuntu
Debian
Mint
CentOS
Fedora
Debian
cleiton@linuxVM:~/projetos/shell script/read_shift$

____________________________________________________________________________________________________________

----> ExRead02.sh

#!/bin/bash

clear

echo -e "Sistema de autenticacao 1.0"

# O operador tem 5s para informar o usuario
# caso contrario o script excede o timeout
# entra no if que verifica se a variavel é nula
# caso seja finaliza o script
echo -e "Voce tem 5 segundos para informar o usuario..."
read -p "Usuario: " -t 5 USER

if [ -z $USER ]; then
echo -e "nUsuario em branco"
exit 0
fi

read -s -p "Password: " PASSWD
echo -e "n"
read -p "Informe um codigo de seguranca de 8 digitos: " -n 8 COD

echo -e "nnn"
echo -e "Informacoes cadastradas com sucesso!"
echo -e "nUsuario: $USERnSenha: $PASSWDnCodigo: $COD"

{SAÍDA}

Sistema de autenticacao 1.0
Voce tem 5 segundos para informar o usuario...
Usuario: bueno
Password:

Informe um codigo de seguranca de 8 digitos: 12345678

Informacoes cadastradas com sucesso!

Usuario: bueno
Senha: senha
Codigo: 12345678
cleiton@linuxVM:~/projetos/shell script/read_shift$

----> ExRead04.sh

#!/bin/bash

# Exemplo de uso pratico 1
echo -e "Informe o device. Ex: [/dev/sda]"
read DEVICE

# -p Prompt, -n Numero de caracteres para sair
read -p "Deseja formatar $DEVICE? [s/n] " -e -n 1 OP

case $OP in
(s|S)
for prog in $(seq 10);
do
echo -n "###"
sleep 1
done
echo -ne "[100%]n"
;;
(n|N) echo -e "n"; exit 0 ;;
(*) echo -e "nOpcao Invalidan"; exit 0 ;;
esac

# Exemplo de uso pratico 2
echo
echo -e "nLendo um arquivo e trabalhando com file descriptor com readn"
LINHAS=$( wc -l /etc/hosts | cut -d" " -f1)

# Criando file descriptor com conteudo do /etc/hosts
exec 345< /etc/hosts

for ((i=0; i<$LINHAS; i++))
do
read -u 345 a$i
done
# Finalizando o file descriptor
exec 345<&-

echo -e "Linha1: $a0"
echo -e "Linha2: $a1"
echo -e "Linha3: $a2"
echo -e "Linha4: $a3"

# Exemplo de uso pratico 3
echo
echo -e "nLendo um arquivo e trabalhando direto com read e estrutura de repeticaon"
count=1
cat /etc/passwd | cut -d":" -f1 | while read line
do
echo Linha $count : $line
count=$[ $count + 1 ]
done

exit 0

{SAÍDA}

cleiton@linuxVM:~/projetos/shell script/read_shift$ ./ExRead04.sh
Informe o device. Ex: [/dev/sda]
/dev/sdc1
Deseja formatar /dev/sdc1? [s/n] s
##############################[100%]

Lendo um arquivo e trabalhando com file descriptor com read

Linha1: 127.0.0.1 localhost
Linha2: 127.0.1.1 linuxVM
Linha3: 127.0.0.1 gateway
Linha4: 127.0.0.1 vm02.intranet

Lendo um arquivo e trabalhando direto com read e estrutura de repeticao

Linha 1 : root
Linha 2 : daemon
Linha 3 : bin
Linha 4 : sys
Linha 5 : sync
Linha 6 : games
Linha 7 : man
Linha 8 : lp
Linha 9 : mail
Linha 10 : news
Linha 11 : uucp
Linha 12 : proxy
Linha 13 : www-data
Linha 14 : backup
Linha 15 : list
Linha 16 : irc
Linha 17 : gnats
Linha 18 : nobody
Linha 19 : libuuid
Linha 20 : syslog
Linha 21 : messagebus
Linha 22 : avahi-autoipd
Linha 23 : avahi
Linha 24 : usbmux
Linha 25 : gdm
Linha 26 : speech-dispatcher
Linha 27 : kernoops
Linha 28 : pulse
Linha 29 : rtkit
Linha 30 : hplip
Linha 31 : saned
Linha 32 : cleiton
Linha 33 : sshd
Linha 34 : mysql
Linha 35 : postgres
Linha 36 : Debian-exim
Linha 37 : snmp
Linha 38 : postfix
Linha 39 : fetchmail
Linha 40 : proftpd
Linha 41 : ftp
cleiton@linuxVM:~/projetos/shell script/read_shift$
