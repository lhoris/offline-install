# BMad Method 오프라인 설치 가이드

이 문서는 `bmad-method-6.9.0.tgz`를 기준으로, 패키지를 어떻게 추출하고 오프라인 환경에서 어떻게 설치하는지 정리합니다.

이 패키지는 `BMAD Method` 본체이고, `--tools claude-code`는 설치 대상 도구/IDE 선택입니다. 즉, 이 문서는 "BMAD를 Claude Code용으로 설치하는 경우"를 예시로 든 것이지, 패키지 자체가 Claude Code 전용이라는 뜻은 아닙니다.

## 1. 이 아카이브의 구조

이 저장소의 `.tgz` 내부는 npm 패키지 관례대로 `package/` 루트로 시작합니다.

확인 예시:

```powershell
tar -tf .\bmad-method-6.9.0.tgz
```

출력은 보통 `package/package.json`, `package/tools/installer/...` 같은 형태입니다.

## 2. 추출 방법

### Windows PowerShell

```powershell
tar -xzf .\bmad-method-6.9.0.tgz
```

### macOS / Linux

```bash
tar -xzf bmad-method-6.9.0.tgz
```

추출이 끝나면 같은 위치에 `package/` 폴더가 생깁니다.

원하면 이름을 바꿔서 관리할 수 있습니다.

```powershell
Rename-Item .\package bmad-method
```

## 3. 오프라인 설치 방법

이 패키지는 `package/` 안의 소스 코드로 실행됩니다. 즉, 설치의 핵심은 “압축을 푼 폴더를 기준으로 CLI를 실행하는 것”입니다.

### 방법 A. 추출한 소스에서 직접 실행

가장 단순한 방법입니다.

```powershell
cd .\package
node .\tools\installer\bmad-cli.js install --directory C:\path\to\your-project
```

예시:

```powershell
cd .\package
node .\tools\installer\bmad-cli.js install --directory C:\work\my-app --modules bmm --tools claude-code --yes
```

여기서 `--modules bmm`은 BMAD 코어 모듈, `--tools claude-code`는 Claude Code용 설치를 뜻합니다.

이 방식은 `bmad-method`를 별도로 전역 설치하지 않아도 됩니다.

### 방법 B. 로컬 폴더를 전역 CLI처럼 사용

오프라인 머신에서 `bmad-method` 명령을 직접 쓰고 싶다면, 먼저 필요한 의존성이 설치되어 있어야 합니다.

```powershell
cd .\package
npm install
npm link
```

이후:

```powershell
bmad-method install --directory C:\work\my-app --modules bmm --tools claude-code
```

주의:

- 완전한 오프라인 환경에서는 `npm install`이 레지스트리에 접근하려고 할 수 있습니다.
- 따라서 사전에 npm 캐시가 준비되어 있거나, 사내 미러/프록시 레지스트리가 있어야 합니다.

### 방법 C. `.tgz`를 그대로 설치

npm 캐시가 준비된 환경이라면 다음도 가능합니다.

```powershell
npm install -g .\bmad-method-6.9.0.tgz
```

그 다음:

```powershell
bmad-method install --directory C:\work\my-app
```

이 방식도 결국 의존성 설치가 필요하므로, 캐시 없는 완전 오프라인에서는 실패할 수 있습니다.

## 4. 오프라인 설치 시 전제 조건

완전히 네트워크가 끊긴 환경에서는 패키지 본체만으로는 부족할 수 있습니다.

필요한 것:

- `bmad-method` 패키지 파일 또는 추출된 `package/`
- npm 의존성 캐시 또는 사내 미러 레지스트리
- Node.js 20.12 이상
- Python 3.10 이상
- `uv`

`package/package.json` 기준으로 이 도구는 Node와 Python을 함께 사용합니다.

## 5. 추천 절차

1. 인터넷이 되는 머신에서 `bmad-method-6.9.0.tgz`와 npm 의존성을 준비한다.
2. 오프라인 머신으로 `.tgz` 또는 추출된 `package/`를 옮긴다.
3. `package/`로 이동한 뒤 `node tools/installer/bmad-cli.js install`을 실행한다.
4. 설치 대상 프로젝트 경로를 `--directory`로 지정한다.

## 6. 자주 쓰는 명령

```powershell
# 압축 내용 확인
tar -tf .\bmad-method-6.9.0.tgz

# 추출
tar -xzf .\bmad-method-6.9.0.tgz

# 추출한 소스에서 바로 설치 실행
cd .\package
node .\tools\installer\bmad-cli.js install --directory C:\work\my-app
```

## 7. 한 줄 요약

- 추출: `tar -xzf bmad-method-6.9.0.tgz`
- 실행: `cd package && node tools/installer/bmad-cli.js install --directory <프로젝트>`
- 전역 CLI로 쓰려면 `npm link` 또는 `npm install -g <tgz>`를 사용하지만, 의존성 캐시가 있어야 진짜 오프라인에서 동작합니다.
- Claude Code용으로 설치하려면 `--tools claude-code`를 붙입니다.
