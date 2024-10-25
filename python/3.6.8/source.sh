#!/bin/bash
# 작업 디렉토리 생성
mkdir -p ~/python && cd ~/python

# Python 3.6.8 다운로드
wget --no-check-certificate https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz

# 압축 해제
tar -xzf Python-3.6.8.tgz

# 설치 디렉토리 생성
mkdir -p ~/.local/python3.6.8

# 설정 및 설치
cd Python-3.6.8
./configure --prefix=$HOME/.local/python3.6.8
make
make install

# 환경변수 설정
echo 'export PATH=$HOME/.local/python3.6.8/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$HOME/.local/python3.6.8/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

# 설치 확인
python3 --version
pip3 --version