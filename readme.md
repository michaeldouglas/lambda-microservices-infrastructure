# Lambda Creator Ambiente

O ambiente foi feito em Vagrant para facilitar a subida em todos os ambientes.
Isso por que no Windows temos que possuir o Hyper-V para utilizar o Docker e 
só pode se utilizado para quem possuir o Windows Professional e muitos já conhecem
o VirtualBox sendo assim foi decidido criar uma vagrant box para o VirtualBox que irá subir
os ambientes com os containers.

`Atenção:` Você não é obrigado a utilizar a box para subir a infra-estrutura
do projeto porém como ainda o projeto encontra-se na versão `beta` tudo foi
testado a partir da Box que está disponibilizada. 

## Arquivo de Hosts

Esse arquivo é importante pois é com ele que configuramos uma ponte entre a máquina 
local e as máquinas: **web** e **containers**.

Caso você esteja no Mac\Linux você deve criar e\ou alterar o arquivo de hosts no caminho:

```
sudo vim /etc/hosts
```

Agora caso você esteja trabalhando em um Windows você deverá criar e\ou alterar o arquivo de hosts no caminho:

```
C:\Windows\System32\drivers\etc
```

`Atenção:` Toda a nova inserção de host você deverá alterar o arquivo e lembrar de 
postar a alteração aqui na documentação dos ambientes.

# Estrutura do arquivo:


A estrutura deve ficar da seguinte maneira:

```
# Copyright (c) 1993-2009 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host

# localhost name resolution is handled within DNS itself.
#	127.0.0.1       localhost
#	::1             localhost

##### GENERAL
192.168.56.102		 local.jenkins.com.br
192.168.56.102		 local.lambdacreator.com.br
```