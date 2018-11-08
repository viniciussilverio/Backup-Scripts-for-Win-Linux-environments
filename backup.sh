#!/bin/sh
#
# Créditos do script, versão, etc.
#

# Confs do script
# Onde, DIR_ORIG é o diretório a ser backupeado e DIR_DEST é o 
# diretório para onde vai o arquivo compactado e BKP_NAME é o nome ao 
# qual será compactado o diretório.
DIR_ORIG="/home/teamspeak/"
DIR_DEST="/home/vjbs/backups/"
BKP_NAME="Lin-`date +%Y%m%d`.tgz"

# compactação do diretório de origem diretamente no diretório de destino
tar -czpf ${DIR_DEST}${BKP_NAME} ${DIR_ORIG}

sftp vjbs@192.168.0.8 << SOMEDELIMITER
  put ${DIR_DEST}${BKP_NAME}
  quit
SOMEDELIMITER

# mensagem de resultado
echo "Seu backup foi realizado com sucesso."
echo "Diretório: ${DIR_ORIG}"
echo "Destino: ${DIR_DEST}${BKP_NAME}";
exit 0
