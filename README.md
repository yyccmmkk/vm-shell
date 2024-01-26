### 简介
本地开发环境及虚拟机开荒脚本合集 

- sshd.ps1 免密登录配置脚本
    
    先修改虚拟机IP执行 `. ./sshd.ps1` ，根据提示输入密码 ssh登陆成功后 执行 
    
    `chmod +x ssh.sh` `sh ./ssh.sh`

- init-network.ps1 NAT网络初始化脚本

    打开 powershell  执行 `. ./init-network.ps1`

    `chmod +x ./network.sh` `sh ./network.sh`

- sh/kms.sh  布署KMS服务脚本
    
    自行上传给赋予脚本执行权限并执行，需要指出的是虚拟机IP必须配置为非本机IP，建议多配一块桥接模式虚拟网卡，否则激活失败。
    `chmod +x ./kms.sh` `sh ./kms.sh`

    需要注意的是安装gcc、g++
    `chmod +x ./init.sh` `sh ./init.sh`


    