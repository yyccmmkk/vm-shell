#ssh-copy-id -i ~/.ssh/id_rsa.pub user@192.168.12.101
#Import-Module -Name Posh-SSH

if((test-path '~/.ssh/id_rsa.pub') -eq $false){
    ssh-keygen -t rsa -C "xxxx@xxxx.com"
}
cat ~/.ssh/id_rsa.pub >> authorized_keys

scp  ./authorized_keys root@127.0.0.2:/root/
scp  ./sh/ssh.sh root@127.0.0.2:/root/
rm -force authorized_keys

#$sshClient = New-SSHClient -HostName 127.0.0.2 -Port 22 -Username root
#$sshSession = New-SSHSession -SSHClient $sshClient
#Invoke-SSHCommand -SSHSession $sshSession -Command "/path/to/your/script.sh"
#Remove-SSHSession -SSHSession $sshSession

ssh root@127.0.0.2;
#chmod +x ssh.sh
#sh ./ssh.sh