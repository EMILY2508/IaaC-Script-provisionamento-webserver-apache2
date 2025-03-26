#! /bin/bash

echo "Atualizando servidor..."
apt-get update
apt-get upgrade

echo "Instalando Apache2..."
apt-get install apache2 -y

echo "Instalando unzip..."
apt-get install unzip -y

echo "Baixando aplicação..."
apt-get install wget -y
cd /tmp
wget https://github.com/usuario/diretorio/arquivo/main.zip

echo "Descompactando e organizando diretorio da aplicação"
unzip main.zip
cd diretorio-main
cp -r * /var/www/html/

echo "Subindo aplicação..."
echo "aplicação pronta para uso!"