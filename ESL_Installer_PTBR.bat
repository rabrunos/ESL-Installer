@ECHO off & setlocal enableDelayedExpansion
@chcp 65001 >NUL

mode 90, 13
SET /a size=90
TITLE = Easy Solo Lobby Installer by Luduaver
:: ==================================================
:: LOCALIZATION TEXTS
:: here contains the setup location texts
:: translate to the language you want
:: change only the text after the "=" operator

:: EXTRAS
:: ==========
:: here you can set the confirmation operator
:: the default is yes/no
:: but you can put whatever you want
:: It can be numbers, symbols, etc.
SET "no=Não"
SET "yes=Sim"
:: ==========
SET "confirm=Confirmar: "
SET "continue=Pressione uma tecla para continuar..."
SET "borderLine1==========================================================================================="
SET "borderLine2=------------------------------------------------------------------------------------------"

:: CHECK ROOT FOLDER Page
SET "l.rootRDO=O instalador está na mesma pasta onde o Red Dead Online está instalado."
SET "l.rootESL=O instalador não encontrou os arquivos do Easy Solo Lobby."
SET "l.rootx64=Coloque o instalador na pasta que contém a pasta x64 dos arquivos do Easy Solo Lobby."

:: CHECK PROCESS Page
SET "l.processTitle=O Red Dead Online está sendo executado."
SET "l.processInfo=Para iniciar a instalação do Easy Solo Lobby é necessário encerrar o processo."
SET "l.processKill=Deseja finalizar o processo? (%yes% ou %no%)"

:: REINSTALL Page
SET "l.reinstallTitle=Existe uma instalação sem uma Lobby Key salva nas configurações."
SET "l.reinstallInfo=Para continuar é necessário reinstalar."
SET "l.reinstallConfirm=Deseja reinstalar? (%yes% ou %no%)"

:: SELECT FOLDER Page
SET "l.pathWelcome=Bem-vindo ao instalador do Easy Solo Lobby"
SET "l.pathSelectPrompt=Selecione a pasta do Red Dead Online:"
SET "l.pathInvalid=O caminho especificado para a pasta do Red Dead Online está incorreto."
SET "l.pathInfo=O caminho correto contém o arquivo RDR2.exe."
SET "l.pathAgain=Selecione a pasta novamente para continuar a instalação."
SET "l.pathSelected=O caminho selecionado foi:"
SET "l.pathConfirm=Tem certeza disso? (%yes% ou %no%)"

:: INSTALL ESL Page
SET "l.installTitle=Instalar Easy Solo Lobby"
SET "l.installConfirm=Deseja instalar o Easy Solo Lobby? (%yes% ou %no%)"

:: SET LOBBY KEY Page
SET "l.setInfo1=Você precisa definir uma Lobby Key para continuar."
SET "l.setInfo2=A Lobby Key serve para impedir outros jogadores de entrarem em sua sessão."
SET "l.setInfo3=Para um amigo entrar em sua sessão ele precisa definir a mesma Lobby Key que você."
SET "l.setKey=Defina a sua Lobby Key abaixo."
SET "l.insertKey=Lobby Key: "

:: CONFIRM LOBBY KEY Page
SET "l.confirmKeyInfo=Você definiu a Lobby Key abaixo:"
SET "l.confirmKey=Tem certeza disso? (%yes% ou %no%)"

:: CHANGE LOBBY KEY Page
SET "l.changeKeyInfo=A Lobby Key abaixo já está instalada:"
SET "l.changeKey=Deseja continuar com essa Lobby Key? (%yes% ou %no%)"

:: CANCEL INSTALL Page
SET "l.cancelInstall=A instalação foi cancelada pelo usuário."

:: RUN RED DEAD ONLINE Page
SET "l.startInstalled=O Easy Solo Lobby e a Lobby Key foram instalados com sucesso."
SET "l.startRedDead=Deseja iniciar o Red Dead Online? (%yes% ou %no%)"
SET "l.startingRedDead=Iniciando Red Dead Online..."

:: UNINSTALL ESL Page
SET "l.uninstallTitle=Desinstalar Easy Solo Lobby"
SET "l.uninstallConfirm=Deseja desinstalar o Easy Solo Lobby? (%yes% ou %no%)"

:: SUCCESSEFUL UNINSTALL Page
SET "l.uninstalled=O Easy Solo Lobby foi desinstalado com sucesso."

:: CANCEL UNINSTALL Page
SET "l.cancelUninstall=A desinstalação foi cancelada pelo usuário."

:: CLOSE SETUP Page
SET "l.closeSetup=Encerrando instalador."
:: ==================================================


:: ==================================================
:: CHECK IF THE INSTALLER IS IN THE CORRECT FOLDER
:CHECKROOTFOLDER
IF EXIST "x64" IF EXIST "RDR2.exe" GOTO RDOROOT
IF NOT EXIST "x64\data\startup.meta" GOTO INVALIDROOT
IF NOT EXIST "x64\boot_launcher_flow.ymt" GOTO INVALIDROOT
IF EXIST "x64" IF NOT EXIST "RDR2.exe" GOTO CHECKPROCESS

:RDOROOT
ECHO %borderLine1%
ECHO:
	FOR /L %%# IN (1,2,!size!) DO IF "!l.rootRDO:~%size%,1!" == "" SET "l.rootRDO= !l.rootRDO! "
	SET l.rootRDO=!l.rootRDO:~1,%size%!& ECHO(!l.rootRDO!
	FOR /L %%# IN (1,2,!size!) DO IF "!l.rootx64:~%size%,1!" == "" SET "l.rootx64= !l.rootx64! "
	SET l.rootx64=!l.rootx64:~1,%size%!& ECHO(!l.rootx64!
ECHO:
ECHO %borderLine1%
ECHO:
	FOR /L %%# IN (1,2,!size!) DO IF "!continue:~%size%,1!" == "" SET "continue= !continue! "
	SET continue=!continue:~1,%size%!& ECHO(!continue!
timeout /t 10 >NUL
GOTO CLOSESETUP

:INVALIDROOT
ECHO %borderLine1%
ECHO:
	FOR /L %%# IN (1,2,!size!) DO IF "!l.rootESL:~%size%,1!" == "" SET "l.rootESL= !l.rootESL! "
	SET l.rootESL=!l.rootESL:~1,%size%!& ECHO(!l.rootESL!
	FOR /L %%# IN (1,2,!size!) DO IF "!l.rootx64:~%size%,1!" == "" SET "l.rootx64= !l.rootx64! "
	SET l.rootx64=!l.rootx64:~1,%size%!& ECHO(!l.rootx64!
ECHO:
ECHO %borderLine1%
ECHO:
	FOR /L %%# IN (1,2,!size!) DO IF "!continue:~%size%,1!" == "" SET "continue= !continue! "
	SET continue=!continue:~1,%size%!& ECHO(!continue!
timeout /t 10 >NUL
GOTO CLOSESETUP
:: ==================================================


:: ==================================================
:: CHECK IF RED DEAD ONLINE IS RUNNING
:CHECKPROCESS
QPROCESS "RDR2.exe">NUL
IF %ERRORLEVEL% NEQ 0 GOTO TESTKEY

:: description
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.processTitle:~%size%,1!" == "" SET "l.processTitle= !l.processTitle! "
	SET l.processTitle=!l.processTitle:~1,%size%!& ECHO(!l.processTitle!
	FOR /l %%# IN (1,2,!size!) DO IF "!l.processInfo:~%size%,1!" == "" SET "l.processInfo= !l.processInfo! "
	SET l.processInfo=!l.processInfo:~1,%size%!& ECHO(!l.processInfo!
ECHO:
ECHO %borderLine1%
ECHO:
ECHO %l.processKill%

:: confirm task kill
ECHO:
SET /p "v.taskKill=%confirm%"
IF /i "%v.taskKill%" NEQ "%yes%" GOTO CLOSESETUP
taskkill /f /im RDR2.exe
:: ==================================================


:: ==================================================
:: CHECKS IF THERE IS AN INSTALLATION WITHOUT KEY SAVED
:TESTKEY
IF EXIST "config.ini" IF NOT EXIST "lobby.key" SET /p v.keyTest=<config.ini
IF EXIST "config.ini" IF EXIST "%v.keyTest%\x64\boot_launcher_flow.ymt" IF NOT EXIST "lobby.key" GOTO REINSTALLKEY
IF EXIST "config.ini" IF EXIST "%v.keyTest%\x64\data\startup.meta" IF NOT EXIST "lobby.key" GOTO REINSTALLKEY
GOTO CHECKPATH
:: ==================================================


:: ==================================================
:: REINSTALL FILES
:REINSTALLKEY
:: description
CLS
ECHO %borderLine1%
ECHO:
	FOR /L %%# IN (1,2,!size!) DO IF "!l.reinstallTitle:~%size%,1!" == "" SET "l.reinstallTitle= !l.reinstallTitle! "
	SET l.reinstallTitle=!l.reinstallTitle:~1,%size%!& ECHO(!l.reinstallTitle!
	FOR /L %%# IN (1,2,!size!) DO IF "!l.reinstallInfo:~%size%,1!" == "" SET "l.reinstallInfo= !l.reinstallInfo! "
	SET l.reinstallInfo=!l.reinstallInfo:~1,%size%!& ECHO(!l.reinstallInfo!
ECHO:
ECHO %borderLine1%
ECHO:
ECHO %l.reinstallConfirm%
ECHO:
SET /p "v.reinstall=%confirm%"
IF /i "%v.reinstall%" NEQ "%yes%" GOTO CLOSESETUP
GOTO CHECKLOBBYKEY
:: ==================================================


:: ==================================================
:: CHECK IF A FOLDER IS SELECTED
:SELECTFOLDER
:: description
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.pathWelcome:~%size%,1!" == "" SET "l.pathWelcome= !l.pathWelcome! "
	SET l.pathWelcome=!l.pathWelcome:~1,%size%!& ECHO(!l.pathWelcome!
ECHO:
ECHO %borderLine1%
ECHO:
ECHO:
FOR /l %%# IN (1,2,!size!) DO IF "!continue:~%size%,1!" == "" SET "continue= !continue! "
SET continue=!continue:~1,%size%!& ECHO(!continue!
ECHO:
ECHO:
ECHO:
SET "credits=Created by Luduaver (faelBrunnoS)"
	FOR /l %%# IN (1,2,!size!) DO IF "!credits:~%size%,1!" == "" SET "credits= !credits! "
	SET credits=!credits:~1,%size%!& ECHO(!credits!
pause >NUL
:: select folder dialog
SET "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'%l.pathSelectPrompt%',0,0).self.path""
FOR /f "usebackq delims=" %%P in (`powershell %psCommand%`) do SET "v.targetPath=%%P
SET "v.targetPathInfo=%v.targetPath%"

:: check if it is the correct folder 
IF NOT EXIST "%v.targetPath%\RDR2.exe" GOTO INVALIDFOLDER
IF EXIST "%v.targetPath%\RDR2.exe" GOTO VALIDFOLDER
:: ==================================================


:: ==================================================
:: CHECK IF THE PATH IS CORRECT
:CHECKPATH
IF NOT EXIST "config.ini" GOTO SELECTFOLDER
SET /p v.checkPath=<config.ini
IF EXIST "%v.checkPath%\RDR2.exe" GOTO CHECKSTATUS
:: ==================================================


:: ==================================================
:: INFORMS THAT THE SELECTED PAGE IS INVALID
:INVALIDFOLDER
::description
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.pathInvalid:~%size%,1!" == "" SET "l.pathInvalid= !l.pathInvalid! "
	SET l.pathInvalid=!l.pathInvalid:~1,%size%!& ECHO(!l.pathInvalid!
	FOR /l %%# IN (1,2,!size!) DO IF "!l.pathInfo:~%size%,1!" == "" SET "l.pathInfo= !l.pathInfo! "
	SET l.pathInfo=!l.pathInfo:~1,%size%!& ECHO(!l.pathInfo!
	FOR /l %%# IN (1,2,!size!) DO IF "!l.pathAgain:~%size%,1!" == "" SET "l.pathAgain= !l.pathAgain! "
	SET l.pathAgain=!l.pathAgain:~1,%size%!& ECHO(!l.pathAgain!
ECHO:
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!continue:~%size%,1!" == "" SET "continue= !continue! "
	SET continue=!continue:~1,%size%!& ECHO(!continue!
TIMEOUT /t 10 >NUL
GOTO SELECTFOLDER
:: ==================================================


:: ==================================================
:: INFORMS THAT THE SELECTED PAGE IS VALID
:VALIDFOLDER
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.pathSelected:~%size%,1!" == "" SET "l.pathSelected= !l.pathSelected! "
	SET l.pathSelected=!l.pathSelected:~1,%size%!& ECHO(!l.pathSelected!
ECHO %borderLine2%
	FOR /l %%# IN (1,2,!size!) DO IF "!v.targetPathInfo:~%size%,1!" == "" SET "v.targetPathInfo= !v.targetPathInfo! "
	SET v.targetPathInfo=!v.targetPathInfo:~1,%size%!& ECHO(!v.targetPathInfo!
ECHO %borderLine2%
ECHO:
ECHO %borderLine1%
ECHO:
ECHO %l.pathConfirm%
ECHO:
SET /p "v.pathConfirm=%confirm%"
ECHO:

IF /i "%v.pathConfirm%" NEQ "%yes%" GOTO SELECTFOLDER
(ECHO %v.targetPath%)> config.ini
:: ==================================================


:: ==================================================
:: CHECK IF EASY SOLO LOBBY IS INSTALLED
:CHECKSTATUS
SET /p v.sourceFolder=<config.ini
IF EXIST "%v.sourceFolder%\x64\boot_launcher_flow.ymt" GOTO UNINSTALL
IF EXIST "%v.sourceFolder%\x64\data\startup.meta" GOTO UNINSTALL
IF NOT EXIST "%v.sourceFolder%\x64\boot_launcher_flow.ymt" GOTO INSTALL
IF NOT EXIST "%v.sourceFolder%\x64\data\startup.meta" GOTO INSTALL
:: ==================================================


:: ==================================================
:: INSTALL EASY SOLO LOBBY
:INSTALL
:: description
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.installTitle:~%size%,1!" == "" SET "l.installTitle= !l.installTitle! "
	SET l.installTitle=!l.installTitle:~1,%size%!& ECHO(!l.installTitle!
ECHO:
ECHO %borderLine1%
ECHO:
ECHO %l.installConfirm%
ECHO:
SET /p "v.install=%confirm%"
IF /i "%v.install%" NEQ "%yes%" GOTO CANCELINSTALL

:: COPIAR AQRUQIVOS ESTAVA AQUI

:: ==================================================


:: ==================================================
:CHECKLOBBYKEY
:: check IF EXIST lobby key installed
IF NOT EXIST "lobby.key" GOTO SETLOBBYKEY
SET /p v.lobbyKey=<lobby.key
SET "v.lobbyKeyInfo=%v.lobbyKey%"
IF EXIST "lobby.key" GOTO CHANGELOBBYKEY
:: ==================================================


:: ==================================================
:: SET CUSTOM LOBBY KEY
:SETLOBBYKEY
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.setInfo1:~%size%,1!" == "" SET "l.setInfo1= !l.setInfo1! "
	SET l.setInfo1=!l.setInfo1:~1,%size%!& ECHO(!l.setInfo1!
	FOR /l %%# IN (1,2,!size!) DO IF "!l.setInfo2:~%size%,1!" == "" SET "l.setInfo2= !l.setInfo2! "
	SET l.setInfo2=!l.setInfo2:~1,%size%!& ECHO(!l.setInfo2!
	FOR /l %%# IN (1,2,!size!) DO IF "!l.setInfo3:~%size%,1!" == "" SET "l.setInfo3= !l.setInfo3! "
	SET l.setInfo3=!l.setInfo3:~1,%size%!& ECHO(!l.setInfo3!
ECHO:
	FOR /L %%# IN (1,2,!size!) DO IF "!l.setKey:~%size%,1!" == "" SET "l.setKey= !l.setKey! "
	SET l.setKey=!l.setKey:~1,%size%!& ECHO(!l.setKey!
ECHO:
ECHO %borderLine1%
ECHO:
SET /p "v.setKey=%l.insertKey%"
SET "v.setKeyInfo=%v.setKey%"
ECHO %continue%
:: ==================================================


:: ==================================================
:: CONFIRM LOBBY KEY SETTING
:CONFIRMLOBBYKEY
:: description
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.confirmKeyInfo:~%size%,1!" == "" SET "l.confirmKeyInfo= !l.confirmKeyInfo! "
	SET l.confirmKeyInfo=!l.confirmKeyInfo:~1,%size%!& ECHO(!l.confirmKeyInfo!
ECHO %borderLine2%
	FOR /l %%# IN (1,2,!size!) DO IF "!v.setKeyInfo:~%size%,1!" == "" SET "v.setKeyInfo= !v.setKeyInfo! "
	SET v.setKeyInfo=!v.setKeyInfo:~1,%size%!& ECHO(!v.setKeyInfo!
ECHO %borderLine2%
ECHO:
ECHO %borderLine1%
ECHO:
ECHO %l.confirmKey%
ECHO:
SET /p "v.keyConfirm=%confirm%"
ECHO:

:: write lobby key to files
IF /i "%v.keyConfirm%" NEQ "%yes%" GOTO SETLOBBYKEY
ECHO %v.setKey%> lobby.key

:: copy files to red dead online folder
del "%v.sourceFolder%\x64\boot_launcher_flow.ymt"
del "%v.sourceFolder%\x64\data\startup.meta"
copy x64\boot_launcher_flow.ymt "%v.sourceFolder%\x64\boot_launcher_flow.ymt"
copy x64\data\startup.meta "%v.sourceFolder%\x64\data\startup.meta"

:: write lobby key to files
ECHO  %v.setKey%>> "%v.sourceFolder%\x64\boot_launcher_flow.ymt"
ECHO  %v.setKey%>> "%v.sourceFolder%\x64\data\startup.meta"
GOTO STARTRDO
:: ==================================================


:: ==================================================
:: CHANGE LOBBY KEY SETTING
:CHANGELOBBYKEY
:: description
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.changeKeyInfo:~%size%,1!" == "" SET "l.changeKeyInfo= !l.changeKeyInfo! "
	SET l.changeKeyInfo=!l.changeKeyInfo:~1,%size%!& ECHO(!l.changeKeyInfo!
ECHO %borderLine2%
	FOR /l %%# IN (1,2,!size!) DO IF "!v.lobbyKeyInfo:~%size%,1!" == "" SET "v.lobbyKeyInfo= !v.lobbyKeyInfo! "
	SET v.lobbyKeyInfo=!v.lobbyKeyInfo:~1,%size%!& ECHO(!v.lobbyKeyInfo!
ECHO %borderLine2%
ECHO:
ECHO %borderLine1%
ECHO:
ECHO %l.changeKey%
ECHO:
SET /p "v.keyChange=%confirm%"
ECHO:

IF /i "%v.keyChange%" NEQ "%yes%" GOTO SETLOBBYKEY

:: copy files to red dead online folder
del "%v.sourceFolder%\x64\boot_launcher_flow.ymt"
del "%v.sourceFolder%\x64\data\startup.meta"
copy x64\boot_launcher_flow.ymt "%v.sourceFolder%\x64\boot_launcher_flow.ymt"
copy x64\data\startup.meta "%v.sourceFolder%\x64\data\startup.meta"

:: write lobby key to files
ECHO  %v.lobbyKey%>> "%v.sourceFolder%\x64\boot_launcher_flow.ymt"
ECHO  %v.lobbyKey%>> "%v.sourceFolder%\x64\data\startup.meta"
:: ==================================================


:: ==================================================
:: START RED DEAD ONLINE
:STARTRDO
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.startInstalled:~%size%,1!" == "" SET "l.startInstalled= !l.startInstalled! "
	SET l.startInstalled=!l.startInstalled:~1,%size%!& ECHO(!l.startInstalled!
ECHO:
ECHO %borderLine1%
ECHO:
ECHO %l.startRedDead%
ECHO:
SET /p "v.startRedDead=%confirm%"
IF /i "%v.startRedDead%" NEQ "%yes%" GOTO CLOSESETUP
start "" "%v.sourceFolder%\PlayRDR2.exe"
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.startingRedDead:~%size%,1!" == "" SET "l.startingRedDead= !l.startingRedDead! "
	SET l.startingRedDead=!l.startingRedDead:~1,%size%!& ECHO(!l.startingRedDead!
TIMEOUT /t 5 >NUL
GOTO CLOSESETUP
:: ==================================================


:: ==================================================
:: CANCEL EASY SOLO LOBBY INSTALLATION
:CANCELINSTALL
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.cancelInstall:~%size%,1!" == "" SET "l.cancelInstall= !l.cancelInstall! "
	SET l.cancelInstall=!l.cancelInstall:~1,%size%!& ECHO(!l.cancelInstall!
ECHO:
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!continue:~%size%,1!" == "" SET "continue= !continue! "
	SET continue=!continue:~1,%size%!& ECHO(!continue!
TIMEOUT /t 3 >NUL
GOTO CLOSESETUP
:: ==================================================


:: ==================================================
:: UNINSTALL EASY SOLO LOBBY
:UNINSTALL
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.uninstallTitle:~%size%,1!" == "" SET "l.uninstallTitle= !l.uninstallTitle! "
	SET l.uninstallTitle=!l.uninstallTitle:~1,%size%!& ECHO(!l.uninstallTitle!
ECHO:
ECHO %borderLine1%
ECHO:
ECHO %l.uninstallConfirm%
ECHO:
SET /p "uninstall=%confirm%"
IF /i "%uninstall%" NEQ "%yes%" GOTO CANCELUNINSTALL

del "%v.sourceFolder%\x64\boot_launcher_flow.ymt"
del "%v.sourceFolder%\x64\data\startup.meta"
:: ==================================================


:: ==================================================
:: SUCCESSEFUL UNINSTALL
:SUCCESSFULUNINSTALL
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.uninstalled:~%size%,1!" == "" SET "l.uninstalled= !l.uninstalled! "
	SET l.uninstalled=!l.uninstalled:~1,%size%!& ECHO(!l.uninstalled!
ECHO:
ECHO %borderLine1%
ECHO: 
TIMEOUT /t 3 >NUL
GOTO CLOSESETUP
:: ==================================================


:: ==================================================
:: CANCEL UNINSTALLING EASY SOLO LOBBY
:CANCELUNINSTALL
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.cancelUninstall:~%size%,1!" == "" SET "l.cancelUninstall= !l.cancelUninstall! "
	SET l.cancelUninstall=!l.cancelUninstall:~1,%size%!& ECHO(!l.cancelUninstall!
ECHO:
ECHO %borderLine1%
TIMEOUT /t 3 >NUL


:: ==================================================
:: CLOSE SETUP
:CLOSESETUP
CLS
ECHO %borderLine1%
ECHO:
	FOR /l %%# IN (1,2,!size!) DO IF "!l.closeSetup:~%size%,1!" == "" SET "l.closeSetup= !l.closeSetup! "
	SET l.closeSetup=!l.closeSetup:~1,%size%!& ECHO(!l.closeSetup!
ECHO:
ECHO %borderLine1%
TIMEOUT /t 5 >NUL
EXIT
