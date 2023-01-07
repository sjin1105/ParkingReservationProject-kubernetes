# Kubernetes를 이용한 주차장 관리 시스템 구축
## 2022.12.16
## Proxmox와 Terraform을 사용한 인프라 구성
## Kubernetes와 Django를 사용한 웹 서비스 구성
## Jenkins와 Argo CD를 사용한 CI/CD Pipeline 구성
## MySQL Operator를 사용한 데이터 이중화 구성
## Prometheus와 Grafana를 사용한 모니터링 환경 구성
## Elasticsearch, Fluent Bit, Kibana를 사용한 EFK 로깅 환경 구성

![pipeline](https://user-images.githubusercontent.com/76959621/211154582-1379a656-ae30-4c0f-86fa-54a4d926e13a.png)

| AS-IS | TO-BE |
|-------|-------|
|번화가에 치중된 교통량으로 인해 번화가에는 주차장의 공간이 부족|입·출차 시 번호판을 인식하여 자동으로 체크해 Database에 빈 자리를 업데이트 함
|반면 상대적으로 번화 하지 않은 곳에는 주차 공간에 여유가 있음|전국 주차장 예약 및 관리 서비스
|단일 Database 사용으로 인해 재해 복구(Disaster Recovery, DR)가 어려움|Kubernetes를 사용해 HA를 보장
|트래픽 과부하에 대응하기 어려움|주차장과 지도를 연동해 주차 공간 위치를 지정해 예약 가능

|NAME|ROLE|
|----|----|
|sjin1105|PM
|KANG|WEB, DB, CI/CD
|KIM|WEB, DB, CI/CD
|PARK JU|INPRA, WEB
|SON|INPRA, CI/CD
|PARK YUN|INPRA

환경
<li>Ubuntu (Ver. 20.04 LTS focal)</li>

도구
<li>Proxmox (Ver. 7.2-11)</li>
<li>Terraform (Ver. 1.3.6)</li>
<li>Kubernetes (Ver. 1.22.8)</li>
<li>GitHub</li>
<li>Django (Ver. 4.1.1)</li>
<li>Docker</li>
<li>Visual Studio Code</li>
<li>MySQL (Ver. 8.0.31)</li>
<li>AWS RDS</li>
<li>Jenkins (Ver. 2.375.1)</li>
<li>Argo CD (Ver. 2.5.4)</li>
<li>Elasticsearch (Ver. 7.9.7)</li>
<li>Fluent Bit (Ver. 1.5)</li>
<li>Kibana (Ver. 7.9.3)</li>
<li>Prometheus (Ver. 4.8)</li>
<li>Grafana (Ver. 6.48)</li>
