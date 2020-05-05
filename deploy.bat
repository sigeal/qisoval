rem Emplacement des fichiers sources
set PLUGIN_SOURCE=%~dp0

rem Paramétrage de l'environnement d'exécution pour QGIS 3.10
@echo off
set OSGEO4W_ROOT=C:\Program Files\QGIS 3.10
call "%OSGEO4W_ROOT%\bin\o4w_env.bat"
call "%OSGEO4W_ROOT%\bin\qt5_env.bat"
call "%OSGEO4W_ROOT%\bin\py3_env.bat"
@echo on

rem Compilation des interfaces QTDesigner pour QGIS 3.10
Call "C:\Program Files\QGIS 3.10\apps\Python37\Scripts\pyuic5.bat" qisoval_dock_base.ui --from-imports -o qisoval_dock_base.py

rem Compilation des ressources
Call "C:\Program Files\QGIS 3.10\apps\Python37\Scripts\pyrcc5.bat" -o resources.py resources.qrc

rem Déploiement du plugin pour QGIS 3.10
set PLUGIN_DIR=C:\Users\%USERNAME%\AppData\Roaming\QGIS\QGIS3\profiles\default\python\plugins\QIsoVal
rem xcopy /S /Y %PLUGIN_SOURCE%\*.* %PLUGIN_DIR%
rem xcopy /S /Y %PLUGIN_SOURCE%\icons\*.* %PLUGIN_DIR%\icons\
rem xcopy /S /Y %PLUGIN_SOURCE%\doc\*.* %PLUGIN_DIR%\doc\

xcopy /S /Y %PLUGIN_SOURCE%__init__.py %PLUGIN_DIR%\
xcopy /S /Y %PLUGIN_SOURCE%metadata.txt %PLUGIN_DIR%\
xcopy /S /Y %PLUGIN_SOURCE%qisoval.py %PLUGIN_DIR%\
xcopy /S /Y %PLUGIN_SOURCE%qisoval_dock.py %PLUGIN_DIR%\
xcopy /S /Y %PLUGIN_SOURCE%qisoval_dock_base.py %PLUGIN_DIR%\
xcopy /S /Y %PLUGIN_SOURCE%qisoval_dock_base.ui %PLUGIN_DIR%\
xcopy /S /Y %PLUGIN_SOURCE%resources.qrc %PLUGIN_DIR%\
xcopy /S /Y %PLUGIN_SOURCE%resources.py %PLUGIN_DIR%\

exit /B
