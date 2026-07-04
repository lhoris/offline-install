# BMad Method 오프라인 설치

이 디렉터리에는 `bmad-method-6.9.0.tgz` 패키지와 추출된 소스가 있습니다.
완전 오프라인 환경에서는 `npx`보다, 패키지를 풀어서 CLI를 직접 실행하는 방식이 가장 안정적입니다.

## 1. 패키지 추출

```powershell
cd .\npm\bmad-method\claude
tar -xzf .\bmad-method-6.9.0.tgz
```

추출하면 `package\` 폴더가 생깁니다.

필요하면 이름을 바꿀 수 있습니다.

```powershell
Rename-Item .\package bmad-method
```

## 2. 오프라인 설치

가장 확실한 방법은 추출한 폴더에서 설치 CLI를 직접 실행하는 것입니다.

```powershell
cd .\package
node .\tools\installer\bmad-cli.js install --directory C:\path\to\your-project --modules bmm --tools claude-code --yes
```

예시:

```powershell
cd .\package
node .\tools\installer\bmad-cli.js install --directory C:\work\my-app --modules bmm --tools claude-code --yes
```

## 3. npm 모듈로 다루는 방법

추출된 폴더를 로컬 npm 패키지처럼 쓸 수 있습니다.

```powershell
cd .\package
npm install
npm link
```

그 다음에는:

```powershell
bmad-method install --directory C:\work\my-app --modules bmm --tools claude-code --yes
```

주의:

- `npm install`은 네트워크가 필요할 수 있습니다.
- 완전 오프라인이라면 `node tools/installer/bmad-cli.js ...` 방식이 더 안전합니다.

## 4. `npx`로 오프라인 실행 가능하나?

`npx`는 설치기가 아니라 실행기입니다.
이 환경의 `npx --help` 기준으로는 `--offline` 옵션이 문서화되어 있지 않습니다.

오프라인에서 `npx`를 쓰려면 결국 아래 전제가 필요합니다.

- 패키지와 의존성이 이미 npm 캐시에 있어야 함
- 또는 로컬에서 풀어둔 디렉터리의 실행 파일을 직접 호출해야 함

그래서 실무적으로는 다음 순서를 권장합니다.

1. 온라인 환경에서 `npm pack` 또는 제공된 `.tgz`를 확보
2. 오프라인 환경에서 `tar -xzf`로 풀기
3. `node tools/installer/bmad-cli.js install ...`로 직접 실행

`npx`는 캐시가 준비된 경우에만 보조적으로 고려하세요.

## 5. 한 줄 요약

- 추출: `tar -xzf .\bmad-method-6.9.0.tgz`
- 설치: `node .\tools\installer\bmad-cli.js install --directory <프로젝트 경로>`
- `npx` 오프라인: 캐시가 있을 때만 가능, 없으면 실패
