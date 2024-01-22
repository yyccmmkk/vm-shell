#!/bin/bash
yum update
sudo yum groupinstall "Development Tools"  
sudo yum install zlib-devel bzip2-devel openssl-devel ncurses-devel
yum install -y git 