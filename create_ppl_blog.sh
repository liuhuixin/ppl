#！！！ 用于在新电脑初始化克隆博客工程

#!/bin/bash

#判断是否存在目录
#没有拉取远端
#执行构建
#挂接public文件夹到远端
#提交
echo "PPL's BLOG"
bolgName="ppl"
exitFlag=false
# project_path=$(cd `dirname $0`; pwd)
# project_name="${project_path##*/}"
# echo $project_path
# echo $project_name

dir=$(pwd)

for file in $dir/*; do
    #echo "${file##*/}"
    #echo "$bolgName"
    if [ "${file##*/}" == "$bolgName" ];then
        exitFlag=true
    fi
done

if [ $exitFlag == false ];then
        git clone https://github.com/liuhuixin/ppl.git ppl --recursive
    else
        echo "PPL Blog Exit Do Next"
fi

# 首先安装choco安装工具，Windows类似与yum的安装工具
#@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
# 安装hugo
choco install hugo -confirm
hugo version

cd $bolgName
git pull

hugo

start http://127.0.0.1:1313
hugo server