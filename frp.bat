echo=1/*
goto windows
 
linux(){
curl -# -o $0 https://github.com/swordstudiox/frpbat/raw/master/frp.bat
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::     欢迎使用linux & mac 系统的frp启动脚本，                              ::"
echo "::     本脚本由 ☆夢幻煋涳☆ 编写，如有疑问请联系本人！ http://www.lu8.win  ::"
echo "::     本脚本由sword修改优化，博客地址： https://agint.me                   ::"
echo "::     免费frp内网穿透服务器地址： https://freenat.win                      ::"
echo "::     项目地址： https://github.com/swordstudiox/frp_bat                   ::"
echo "::     转载请不要删除本信息！                                               ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""   
echo " 请选择你要的操作："
echo "     1、搭建自己的frps服务器"
echo "     2、配置并运行frpc客户端"
echo "     3、退出"
echo ""
echo ""
read num
case "$num" in
	[1] )
		rm -rf frps_linux.bat	
		curl -# -o frps_linux.bat https://github.com/swordstudiox/frpbat/raw/master/linux/frps_linux.bat
		sh frps.bat			
		;;
	[2] )
		rm -rf frpc_linux.bat	
		curl -# -o frpc_linux.bat https://github.com/swordstudiox/frpbat/raw/master/linux/frpc_linux.bat		
		sh frpc.bat			
		;;
	[3] )
			exit			
		;;
		*) echo "选择错误，退出";;
	esac
	} 
linux
exit

:windows

@echo off
title frp���ýű� V1.0-20190302 
COLOR 02
cls

cd %~dp0
rem cscript -nologo -e:jscript "%~f0" "http://www.lu8.win/downloads/curl/curl.exe" "curl.exe" 
rem cscript -nologo -e:jscript "%~f0" "https://file.agint.me/frpbat/others/curl.exe" "curl.exe" 


rem curl -s http://www.lu8.win/downloads/frp/frp-version>frp-version.bat
certutil.exe -urlcache -split -f https://github.com/swordstudiox/frpbat/raw/master/frpbat_version frpbat_version.bat

call frpbat_version.bat
del frpbat_version.bat
set client=20190301
if %server% EQU %client% ( 
rem del curl.exe 
) else ( 
echo ���°汾��%server%
echo �������� 
rem curl -o %~nx0 -# http://www.lu8.win/downloads/frp/frp.bat 1>nul
del frp.bat
certutil.exe -urlcache -split -f https://github.com/swordstudiox/frpbat/raw/master/frp.bat
rem curl -o %~nx0 -# https://file.agint.me/frpbat/frp.bat 1>nul
echo ������� 
%~nx0
)

goto moshi

:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::     ��ӭʹ��Windowsƽ̨��frp�����ű���                                   ::
ECHO.::     ���ű��� ����ß���� ��д��������������ϵ���ˣ� http://www.lu8.win  ::
ECHO.::     ���ű���sword�޸��Ż������͵�ַ�� https://agint.me                   :: 
ECHO.::     ���frp������͸��������ַ�� https://freenat.win                      ::
ECHO.::     ��Ŀ��ַ�� https://github.com/swordstudiox/frp_bat                   ::
ECHO.::     ת���벻Ҫɾ������Ϣ��                                               ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.

echo  ��ѡ����Ҫ�Ĳ�����
echo      1����Լ���frps������
echo      2�����ò�����frpc�ͻ���
echo      3���˳�
set num=0
set /p num=
if %num%==1 goto frps
if %num%==2 goto frpc
if %num%==3 exit

:frps
set frp=frps_win
goto start

:frpc
set frp=frpc_win
goto start

:start
cd %~dp0
del %frp%.bat
if exist %frp% goto run
cscript -nologo -e:jscript "%~f0" "https://github.com/swordstudiox/frpbat/raw/master/windows/%frp%.bat" "%frp%.bat"  
goto run


:run
call %frp%.bat
exit
*/ 
var iLocal,iRemote,xPost,sGet;  
iLocal =WScript.Arguments(1);   
iRemote = WScript.Arguments(0);   
iLocal=iLocal.toLowerCase();  
iRemote=iRemote.toLowerCase();  
xPost = new ActiveXObject("WinHttp"+String.fromCharCode(0x2e)+"WinHttpRequest.5.1"); 
xPost.Open("GET",iRemote,0);  
xPost.Send(); 
sGet = new ActiveXObject("ADODB"+String.fromCharCode(0x2e)+"Stream");  
sGet.Mode = 3;  
sGet.Type = 1;   
sGet.Open();   
sGet.Write(xPost.responseBody);  
sGet.SaveToFile(iLocal,2);   
