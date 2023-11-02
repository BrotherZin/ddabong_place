![전체로고](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/337a7dba-2b29-4341-9486-90ee3fcd9d8e)


# ☕ 카페 예약 / 웨이팅 플랫폼 따봉플레이스(DDABONG_PLACE)
따봉플레이스는 JAVA 와 Sping MVC 를 기반으로 제작한 프로젝트입니다.


이용자는 손님 측 / 업체 측으로 나뉘며, Q&A를 관리하는 관리자 계정(admin)을 갖습니다.


## 🗓️ 프로젝트 제작 기간
기간 : 2023/10/02 ~ 2023/11/03 (약 1개월)



## 👨‍👩‍👧‍👦 프로젝트 팀 소개

|   Name   | 허민영                               | 박정빈                                            | 안형진                             | 표가은                                                       |
| :------: | ------------------------------------ | ------------------------------------------------- | ---------------------------------- | ------------------------------------------------------------ |
| Profile  | ![민영](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/5f054793-0368-4fc1-83c0-4ef9b8f10415)| ![정빈](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/b1f7c261-8a21-4002-aa5f-7361ad23f2d5) | ![형진](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/ac9a7fa6-b0a8-486f-ad3d-bb92f5fd3d75)|![가은](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/75f72e50-e2dd-46f8-820d-7c6358a61c87) | 
| Position | 팀장 & Front/Backend Develop  | Backend Develop                                  | Front/Backend Develop                   | Front/Backend Develop                              |
|   Git    | [@Minyoung-Heo](https://github.com/Minyoung-Heo) | [@JbPark1199](https://github.com/JbPark1199)            | [@BrotherZin](https://github.com/BrotherZin) | [@gaeunpyo](https://github.com/gaeunpyo)                 |

### 역할 
**허민영**

DB설계 및 ERD 제작 / 메인화면 / 이달의 따봉왕 / 따봉어워드 / 예약HOT랭킹 / Q&A / 웨이팅 / 카페 리스트 / 업체 측 회원 정보 관리 / 리뷰 삭제 /
전반적인 CSS 및 코드 관리 담당


**박정빈**

유저용 주 기능 전반 (통합 검색 / 맞춤형 카페 추천 / 매장 상세 페이지 / 예약 / 즐겨찾기 / 리뷰) 및 CSS 담당  


**안형진**

UI/UX 설계 / 회원 및 업체 관련 기능 전반 (로그인 / 회원 가입 / 아이디,비밀번호 찾기 / 손님 측 회원정보관리 / 예약 현황), 메인화면 팝업창, 메인화면 배너 제작, 이벤트 기능 및 CSS 담당


**표가은**

UI/UX 설계 / 업체 측 매장 CRUD / 즐겨찾기 목록 / 카페 추천 결과 / 따봉 어워드 및 CSS / PPT 담당


# 📝 프로젝트 구성 및 설계

### 📌  유스케이스 다이어그램 (Use Case Diagram)

![다이어그램](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/50d1e0b3-89b0-4849-aca8-18443bb178a3)


### 📌  Database ERD (Entity Relation Diagram)


![ERD](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/8f275ee0-89b9-458b-a5cb-d5b90a931c46)



### 📌 사용 기술

**백앤드**

- Java 11<svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>JavaScript</title><path d="M0 0h24v24H0V0zm22.034 18.276c-.175-1.095-.888-2.015-3.003-2.873-.736-.345-1.554-.585-1.797-1.14-.091-.33-.105-.51-.046-.705.15-.646.915-.84 1.515-.66.39.12.75.42.976.9 1.034-.676 1.034-.676 1.755-1.125-.27-.42-.404-.601-.586-.78-.63-.705-1.469-1.065-2.834-1.034l-.705.089c-.676.165-1.32.525-1.71 1.005-1.14 1.291-.811 3.541.569 4.471 1.365 1.02 3.361 1.244 3.616 2.205.24 1.17-.87 1.545-1.966 1.41-.811-.18-1.26-.586-1.755-1.336l-1.83 1.051c.21.48.45.689.81 1.109 1.74 1.756 6.09 1.666 6.871-1.004.029-.09.24-.705.074-1.65l.046.067zm-8.983-7.245h-2.248c0 1.938-.009 3.864-.009 5.805 0 1.232.063 2.363-.138 2.711-.33.689-1.18.601-1.566.48-.396-.196-.597-.466-.83-.855-.063-.105-.11-.196-.127-.196l-1.825 1.125c.305.63.75 1.172 1.324 1.517.855.51 2.004.675 3.207.405.783-.226 1.458-.691 1.811-1.411.51-.93.402-2.07.397-3.346.012-2.054 0-4.109 0-6.179l.004-.056z"/></svg>
- Spring MVC
- JSP
- MyBatis
- AJAX

**DB & WAS**

- Oracle(Oracle Database 11g Express Edition Release 11.2.0.2.0)
- Tomcat 9(9.0.64)

**프론트**

- HTML/CSS
- JavaScript
- JQuery

**Environment & Tool**

- Windows 11
- Eclipse(2022-12)
- GitHub
- Fork
- Oracle SQL Developer

  
# 📌 주 기능 소개
**메인화면**

![메인화면](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/11c809e4-4457-4b8d-bacd-aa6563f70b9a)


**예약**

- 카페 예약

![카페예약](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/9323067a-1957-4493-ade0-b75cdd047c77)


- 예약 취소

![카페예약취소](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/592cf959-b226-4d54-b049-e58d5770706f)


- 업체 측 예약 확인

![업체예약현황](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/3b677a0a-16f9-4a4f-b3a0-7562b51be5ea)


- 업체 측 예약 취소하기

![업체측예약취소](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/defcb77b-19ea-4af0-9c80-35630d8b9e8f)

  
**웨이팅**

- 웨이팅

![웨이팅](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/1f27ba1e-d3a3-4609-9981-7e5b47c296b4)

- 웨이팅 취소

![웨이팅취소](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/fbf30495-e160-4ee6-b544-262551e98087)

- 업체 측 웨이팅 호출

![웨이팅호출](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/fc51b875-53a5-44ab-a16c-801475ca1814)


- 손님 측 웨이팅 입장하기

![손님입장하기](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/08b6dd14-2326-4682-a97b-a03002168f50)


**리뷰**

- 로그인 전

![로그인전리뷰](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/49980a44-ca2c-4b0e-b692-090cc3ac775e)


- 로그인 후 리뷰 달기


![리뷰달기](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/b61e2803-af7d-429d-97c1-fb44d31f97c6)


- 리뷰 삭제

![리뷰삭제](https://github.com/Minyoung-Heo/ddabong_place/assets/143155386/e7299acc-5367-49b7-a6ce-d3681348c3f3)




## 📌 [다른 기능 더 보기](https://plant-decision-6e3.notion.site/DDABONG_PLACE-873f879a889944158439a8ec38fb319d?pvs=4)
