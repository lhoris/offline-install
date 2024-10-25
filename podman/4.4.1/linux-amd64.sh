#!/bin/bash

# 작업 디렉토리 생성
mkdir -p ~/podman && cd ~/podman

# podman 바이너리 다운로드 (v4.4.1)
curl -L https://github.com/containers/podman/releases/download/v4.4.1/podman-remote-static-linux_amd64.tar.gz > podman-4.4.1.tar.gz

# 압축 해제
tar -xzf podman-4.4.1.tar.gz

# 파일명 변경
mv ./bin/podman-remote-static-linux_amd64 ./bin/podman

# 실행 파일을 사용자의 bin 디렉토리로 이동
mkdir -p ~/.local/bin
cp bin/podman ~/.local/bin/
chmod +x ~/.local/bin/podman

# 환경변수 설정 (.bashrc에 아직 없는 경우에만 추가)
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# podman 설정 디렉토리 생성
mkdir -p ~/.config/containers

# 기본 설정 파일 생성
cat << EOF > ~/.config/containers/registries.conf
[registries.search]
registries = ['docker.io', 'quay.io', 'registry.fedoraproject.org']
EOF

# 설치 확인
podman --version