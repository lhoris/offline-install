#!/bin/bash
# 작업 디렉토리 생성
mkdir -p ~/python && cd ~/python

# Python 3.11.7 다운로드 (최신 안정 버전)
wget --no-check-certificate https://www.python.org/ftp/python/3.11.7/Python-3.11.7.tgz

# 압축 해제
tar -xzf Python-3.11.7.tgz

# 설치 디렉토리 생성
mkdir -p ~/.local/python3.11

# 설정 및 설치
cd Python-3.11.7
./configure --prefix=$HOME/.local/python3.11
make
make install

# 환경변수 설정
echo 'export PATH=$HOME/.local/python3.11/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$HOME/.local/python3.11/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

# 설치 확인
python3 --version
pip3 --version