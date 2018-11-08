cls
echo off
cls

REM - VARIAVEIS
set filedatetime=%date%
set filedatetime=%filedatetime:~6,4%%filedatetime:~3,2%%filedatetime:~0,2%
mkdir C:\Users\Administrador\Documents\Backups\%filedatetime%
set ORIGEM=C:\xampp\htdocs
set DESTINO=C:\Users\Administrador\Documents\Backups\Win-%filedatetime%.7z
set LOG=C:\Users\Administrador\Documents\script-backup\LOG
REM - ESTRUTURA
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #         COPIA DE ARQUIVOS E/OU DIRETORIOS         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
7z.exe a %DESTINO% %ORIGEM%\*
sftpc vjbs@192.168.0.8 -pw="GAIOLINHA#1234" put %DESTINO%
REM /E - Copia diretórios e subdiretórios, inclusive os vazios.
REM /Y - Suprime o prompt para você confirmar se deseja substituir um arquivo de destino existente.
REM /C - Continua copiando, mesmo que ocorram erros.
REM /H - Copia arquivos ocultos e do sistema também.
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo # GERANDO LOG DE ARQUIVOS E/OU DIRETORIOS COPIADOS  #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
dir /s %DESTINO% > %LOG%\Arquivos.txt