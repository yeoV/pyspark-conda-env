# pyspark-conda-env

- conda container image *(Linux/amd64)*
- 생성된 Conda env 이미지 (.tar.gz) 을 HDFS / local 에 업로드 후, pyspark archives 에 등록하여 사용
# Install
### Default Python Version
- python 3.8.18

- Dockerfile
```
docker build -t conda_env .

docker run -it --name conda_container conda_env bash

# env.tar.gz 파일 복사 (local terminal)
docker cp conda_container:/root/pyspark_env.tar.gz .
```


# Custom 가상환경 생성 법

```
conda activate [가상환경 명]

conda install [패키지명-]
```
### Conda env > tar.gz

```
conda pack -n [가상환경 명]

# output name
conda pack -n [가상환경 명] -o output.tar.gz
```

- Docker Container -> local 복사
```
# in local terminal
docker cp my_env://path .
```

### Conda env > .yaml

- Conda 환경을 YAML 파일로 관리
	- 이후 yaml 파일을 바탕으로 conda env create 가능
```bash
conda activate [env]

conda env export > environement.yaml
```



이슈)
-   아래 에러 발생 시, OS 간 호환성으로 인해 발생
Solving environment: failed
ResolvePackageNotFound:

# Conda env 가상 환경 생성

###  tar.gz > Conda env (네트워크 연결 필요 x)

- Conda env 폴더 경로 확인
```
conda info --env
```

- 해당 폴더 경로 아래, tar.gz 압축 풀기
```
mkdir -p my_env
tar -zxf my_env.tar.gz -C my_env
```

- conda 확인
```
conda info --env

# 없을 경우
source my_env/bin/activate
```

### yaml > Conda env

- 가상환경 생성 시, **(네트워크 연결 필요)**
```
conda env create --file environment.yaml
```


### 별첨)
- Default 환경 변경하고 싶은 경우,
	- `config/pyspark_env.yaml` 파일 변경 하면 됨
	- 해당 파일로 Docker 컨테이너 내 환경 build 됨
