#!/bin/bash
# 작업 디렉토리 생성
mkdir -p ~/go && cd ~/go

# Go 1.21.5 (최신 안정 버전) 다운로드
wget --no-check-certificate https://go.dev/dl/go1.21.5.linux-amd64.tar.gz

# 압축 해제 (사용자의 홈 디렉토리)
tar -xzf go1.21.5.linux-amd64.tar.gz -C $HOME

# 환경 변수 설정
echo 'export GOPATH=$HOME/go_workspace' >> ~/.bashrc
echo 'export GOROOT=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# 설치 확인
go version