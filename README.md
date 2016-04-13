KPI Dashboard project
=====================
> 포맷에 맞춰진 엑셀 파일을 업로드 하면 자동으로 맵트리와 KPI 가 표시되는 서비스.
> 샘플 엑셀 파일은 [여기](http://google.com) 에서 받을수 있다.
> 
> nodejs 와 highchart 로 구성됨.
> #### 동작방식
> * 사용자가 KPI 엑셀 파일을 업로드한다. (현재는 서버의 로컬폴더에 저장함. todo: s3에 올리기)
> * node가 업로드된 파일을 json으로 파싱한 후, 파싱된 json 객체와 관련 정보를 mongodb 에 write 한다.
> * browser 는 json 을 분석하여 맵 화면을 draw 하고, 관련 KPI 들도 표시한다.
> * 
> * 인증은 Meteor.loginToken 값을 서로 전달하여, 기존 "C 서비스"와 인증 연계를 한다.
> * 사용자 관리 페이지, admin 페이지 등은 "C 서비스" 로 라우팅하여 사용한다.
> * "C 서비스" 에서는 사용자가 만든 사이트가 C펨플릿으로 만든 사이트인지, KPI템플릿으로 만든사이트인지 구분한후, 'Live' 버튼에 대한 라우팅을 '/player' 또는 '/kpi' 로 가게 한다.
> * KPI템플릿으로 만든 사이트일 경우 Editor Mode 로 가면, 'Editor', 'Object', 'Publish'등의 C템플릿 관련 버튼은 숨긴다.

[TOC]

# 디렉토리 구조 
* /src - 개발소스
* /html - 퍼블리싱 소스
* /design - 디자인
* /document - 개발 문서

# 서버 실행하기
## 개발용으로 로컬에서 실행하기

    $ cd src
    $ npm install
    $ sudo ./run_server.sh

## 브라우저에서 접속하기
http://localhost:5000/kpi 로 연결

# 배포하기

## AWS Elastic Beanstalk 에 구축하기

### Elastic Beanstalk 환경 및 주의사항

> Beanstalk 에 연결된 ELB 를 사용하려면 ELB의 Port Configuration을 HTTP가 아닌 TCP로 바꿔주어야 함.
"C 서비스"의 reverse proxy 에서 접근해야 하기 때문
> 프록시 프로토콜을 활성화 시켜야 함. 참조 : http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/enable-proxy-protocol.html
>
> 참고 : 사용자가 메인으로 진입하는 ELB 에는 Proxy Protocol 을 설정하여야, 내부 서버에서 ELB의 주소가 아닌 실제 접속한 remote_address 를 파악할 수 있음
> http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/enable-proxy-protocol.html
> https://gist.github.com/obolton/071be4c926f9cf0b6fd8

### 준비 사항 (Mac)

[Install the EB Command Line Interface (CLI)](http://docs.aws.amazon.com/ko_kr/elasticbeanstalk/latest/dg/eb-cli3-install.html)

    $ cd src
    $ eb init
    Select a default region
    ...
    9)  ap-northeast-2 : Asia Pacific (Seoul)
    ...
    (default is 3): 9

    Select an application to use
    1) kpi
    2) [ Create new Application ]
    (default is 3): 1

    It appears you are using Node.js. Is this correct?
    (y/n): y
    Do you want to set up SSH for your instances?
    (y/n): y

    Select a keypair.
    1) c-project-dev
    2) [ Create new KeyPair ]
    (default is 2): 1

### 서버에 deploy 하기

#### 개발 서버에 배포하기
    $ ./deploy-dev.sh 

> To deploy changes without committing. ([doc 참조](http://docs.aws.amazon.com/ko_kr/elasticbeanstalk/latest/dg/eb3-cli-git.html))
>   $ git add .
>   $ eb use dev-env
>   $ eb deploy --staged

#### stage 서버에 배포하기 
  운영서버에 올릴때는 branch 를 나누거나 git tag 등을 달아서 구분할수 있게 하는게 좋음.
    $ $ ./deploy-stage.sh

#### 운영 서버에 배포하기 
  운영서버에 올릴때는 branch 를 나누거나 git tag 등을 달아서 구분할수 있게 하는게 좋음.
    $ $ ./deploy-prod.sh


## EC2 서버에 구축하기 (experimental)
### 환경 설정
node 설치 (ubuntu 14.04)

    $ curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    $ sudo apt-get install -y nodejs npm

pm2 및 pm2-logrotate 모듈 설치 (ubuntu 14.04) : 자세한 건 [pm2 문서](https://github.com/Unitech/pm2) 참조

    $ sudo npm install pm2 -g
    $ pm2 install pm2-logrotate
    $ pm2 set pm2-logrotate:retain 100  # 100 일치 저장 

pm2 는 node 0.12.x 이상 버전의 cluster 만 지원함. 여기서는 node lts 버전인 v4.3.2 사용하게 함
    
    $ sudo npm install n -g
    $ sudo n 4.3.2

### 서버에서 실행하기
처음이라면 git clone 또는 git pull 하기 

    $ git clone https://bitbucket.org/n3n_c/kpidashboard.git
    $ cd kpidashboard
    $ git pull

pm2 로 cluster 모드로 실행하기
    
    $ cd src
    $ pm2 start server.js -i 0
