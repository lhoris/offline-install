# 오프라인 설치

dist 폴더가 있는 위치에서 실행

```powershell
python -m pip install --no-index --find-links=./dist specify-cli
```

옵션 설명

| 옵션           | 설명              |
| ------------ | --------------- |
| --no-index   | 인터넷(PyPI) 접근 금지 |
| --find-links | 로컬 wheel 파일만 사용 |

---

# 설치 확인

```powershell
specify version
```

버전이 출력되면 정상 설치이다.

Path 환경변수가 등록이 필요한 경우 등록
C:\Users\lhori\AppData\Local\Python\pythoncore-3.14-64\Scripts