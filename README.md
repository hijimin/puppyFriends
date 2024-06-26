## PuppyFriends  
<br/>

## :dog2: 프로젝트 소개
<b>PuppyFriends : 집에 혼자 남게될 반려견을 케어해주는 애견 유치원, 호텔 서비스를 쉽게 예약 할 수 있도록 만든 플랫폼</b>

## :alarm_clock: 개발기간
- 2024.01.17 (수) ~ 2024.03.25 (금)
- 2024.01.17 (수) ~ 2024.01.23 (화) : kickoff 미팅

- 2024.01.23 (화) ~ 2024.01.30 (화) : 분석 및 기획

- 2024.01.30 (화) ~ 2024.02.13 (화) : 화면 설계

- 2024.02.13 (화) ~ 2024.02.19 (월) : DB 설계

- 2024.02.19 (월) ~ 2024.02.23 (금) : 최종보고서 및 DB 스크립트 제출

- 2024.02.23 (금) ~ 2024.03.11 (월) : 구현 및 디버깅

- 2024.03.12 (화) ~ 2024.03.22 (금) : 베타 테스트

- 2024.03.25 (월) : 최종 발표

<br/>
<br/>

## :family: 멤버 : 윤상연(Leader), 박민규, 박지민, 류은송, 이상용
:boy: 윤상연 
<br/>

-관리자 페이지
- 공지사항 조회
- 회원조회, 삭제
- 상품조회, 삭제
- 호텔, 유치원 조회 삭제
<br/>

-채팅(웹소켓)
- 단체채팅
- 귓속말
<br/>

:boy: 박민규
<br/>
- 메인페이지 <br/>
- 출석부 등록, 조회, 수정<br/>
- 갤러리 등록, 삭제<br/>
- 회원과 관리자 1대1 채팅
 <br/>
<br/>

:girl: 박지민
<br/>

-토스페이,카카오페이 API
<br/>

-상품
- 판매를 위한 등록, 수정
- 상세 페이지를 통한 조회
- 결제 전 상품조회, 추가, 삭제 가능한 장바구니 기능
- 인기, 조회, 최신순서를 통한 조회
- 상품 리뷰 등록, 수정, 삭제
- 키워드 검색
<br/>

:girl: 류은송
<br/>

-유치원(클래스)
- 유치원 정보 등록 / 삭제
- 예약하기 페이지에서 예약
- 상세 페이지에서 반려견 사이즈와 일치시 예약 가능
<br/>

- 호텔
- 호텔 정보 등록 / 삭제
- 상세 페이지에서 반려견 사이즈와 일치시 예약 가능

<br/>

:boy: 이상용
<br/>

-회원
- 로그인, 회원가입
- 마이페이지를 이용한 회원 정보 수정 및 탈퇴
- 비밀번호 변경
<br/>

-게시판
- 공지사항 작성, 수정, 삭제
<br/>
<br/>
<br/>

## :wrench: 개발환경
- OS : Windows10
- IDE : Eclipse, , VSCode
- Server : Apach Tomcat 9.0
- DBMS : Oracle
- Languages : Java, HTML, CSS, JavaScript, JQuery, JSP, SQL
- Management : Git, GitHub, SourceTree
<br/>
<br/>

## :pushpin: 기술스택
- FrontEnd : HTML5, CSS3, JavaScripts, JQuery, Ajax
- BackEnd : Java 11, JSP & Servlet
<br/>
<br/>

## :floppy_disk: 설계
ERD:
<br/>
![image](https://github.com/hijimin/puppyFriends/assets/147786615/25de1f20-27f5-42ef-a991-7316584da368)
<br/>
<br/>

## :mag: 프로젝트 Q&A
:question: **프로젝트 기획 의도**
<br/>

현재 반려견에 대한 인식의 변화와 반려견과 함께하는 1인 가구가 많이 증가했습니다.
혼자 반려견을 키우기 때문에 출근, 외출 시 반려견이 혼자 남게됨으로 반려견이 외롭지 않게 반려견과 교류하고 내가 집을 비운 시간 동안 나의 반려견을 케어 해주는 애견 유치원이 많이 생겨 났습니다.
애견사업의 규모가 커지면서 유치원 내에서 수업 외에도 호텔, 상품구매 등을 해결 할 수 있는 업체들이 등장 했습니다.
위 업체의 특징은 100% 예약제로 운영되면서 여러가지 사업을 한번에 관리 하는데 이를 효율적으로 관리 할 수 있도록 사이트를 개발하게 되었습니다.
<br/>
<br/>

## :hatched_chick: 프로젝트 특징
<br/>

-실시간 유치원 클래스&호텔 다른 사이트들과는 다르게 온라인으로 직접적인 예약가능 (타 사이트 경우 전화 or 카톡 상담을 통한 오프라인 예약) <br/>
-상품 구매, 배송, 카카오 또는 토스 결제가 되고, 관리자와의 1:1 채팅 등 고객에게 편리함을 제공 할 수 있는 PuppyFriends 입니다.<br/>
-일반 회원가입과 카카오 회원가입을 제공하며 로그인 후 회원이라면 누구나 단체채팅 이용이 가능합니다.<br/>
-<br/>
<br/>
<br/>

## :heavy_exclamation_mark: 프로젝트를 통해 느낀점
<br/>
:boy: 윤상연
<br/>
<br/>
-처음 진행해본 프로젝트라 주제선정부터 시작해서 많은 것에 미숙 했습니다.  기능구현을 할 때에도 당연히 혼자 할 수 있다고 생각하는것에 많은 어려움을 느꼈지만 하나하나 해결해가며 기능이 완성되가는것에 큰 즐거움을 느꼈고 처음 시작 할 때와 달리 조금은 성장했다고 생각 했습니다. 하지만 구현한 기능에 아쉬운 부분이 많았습니다. 이번 프로젝트가 아쉬운 만큼 다음 프로젝트에는 만족 할 수 있는 결과물을 만들고 싶어졌습니다.
<br/>

:boy: 박민규
<br/>
- 처음에 기능을 분배했을땐 뭐 어떻게든 되겠지라는 생각이 강했습니다.
   하지만 프로젝트를 진행하면서 제가 잘못 생각했다는 것을 알게되었습니다.
   생각지도 못한 에러들도 겪어보고 쉬울거라 생각했던 기능들도 간단히 해결되지 않아서
   내가 너무 자만했구나라는 생각이 들었습니다.
   마음가짐을 새로이하고 처음부터 천천히 시작해보니 결국엔 잘 해결되었습니다.
   이번 세미를 통해 한단계 성장했다는 느낌을 받았고 마지막 남은 파이널 프로젝트는 세미보다 더 나은
   결과물을 만들어내고 싶어졌습니다.

:girl: 박지민
<br/>
<br/>
-이 프로젝트는 그동안 배웠던것을 토대로 처음으로 시작한 프로젝트 였기에 처음에는 약간의 방황이 있었지만, 하나씩 맞춰지는 퍼즐조각처럼 점점 구색을 갖춰가는 과정을 보면서 뿌듯함과 성취감을 느꼈습니다. 그동안 배웠던 것들이 제가 구현할 기능의 한 부분 부분에 사용되는 과정을 보면서 짜릿함을 느꼈고 즐거웠습니다. 물론, 즐거운 과정 속에서도 어려움은 있었습니다. 여러 에러와 맞닥뜨리고 해결이 어려운 문제에 며칠을 고민하기도 했지만 이를 통해 값진 경험을 쌓을 수 있었습니다. 아쉬웠던 새로운 기능을 스스로 구현하려고 할 때 그 기능에만 집중을 하다보니 다른 디테일한 부분들을 간과한 것입니다.
발표전 구현했던 기능들을 테스트 해보면서 사용자의 시각으로  바라보았을 때 부족한 점이 드러났습니다. 이 과정에서 느낀 점은 많은 기능에 치중 하기보다는 하나의 기능을 완성할 때도 놓치고 지나치는 부분이 없는지 한번 더 꼼꼼히 체크해야겠다고 깨달았습니다.

<br/>
:girl: 류은송
<br/>
- 처음에는 불안함도 많았고, 잘 이해되지 않는 점도 많아 스스로 할 수 있을까 굉장히 막막했으나 
프로젝트를 통해 스스로 해봄으로써 수업 때 배웠던 것들을 사용하고, 새로운 기능들도 구현해보며 
많은 것들을 다시 배우게 되었고, 하나하나 해결될 때마다 성취감과 즐거움을 느꼈습니다.<br/>
지금까지는 막막하고 불안했었지만 세미프로젝트를 통해 자신감을 얻었고, 부족한 점을 보완해서 더 나은 결과를 낼 수 있도록 성장하고 싶습니다.


:boy: 이상용
<br/>
<br/>
- 학원에서 강사님과 함께 기능들을 배웠을때는 할만 하다 생각했습니다. 하지만 막상 프로젝트를 시작하니 배운 기능들을 조금만 꼬았을 뿐인데도 굉장히 난이도가 올라가고 생각해야될게 많구나라고 느꼈습니다. <br/>
  혼자 계속해서 생각해보고, 팀원 뿐만 아니라 수강생들과 같이 어떻게 하면 주제에 더 잘 어울리게 만들고, 새로운 기능들에 대해서도 여기저기 찾아보며, 학원에서 배운 기능들이라곤 해도 어떻게 하면 코드를 더 간략하게 줄일 수 있을까 생각해봤습니다. <br/>
  이러한 과정을 통해 재미를 느끼기도 했지만, 페이지 하나에 굉장히 많은 기능이 들어가는 것에 놀랐으며, 개발자란 끊임없이 생각을 하며 사이트를 조금이라도 더 빠르게 돌리기 위해 왜? 라는 질문을 계속해서 던져야 하는 직업이라는 말을 다시금 상기시키는 계기가 되었습니다. <br/>
  처음 해보는 프로젝트다 보니 어려움을 많이 느꼈지만, 팀원들과 많이 대화를 하면서 좌절하지 않고 잘 마무리를 할 수 있었던것 같습니다. 이제 겨우 한걸음 뗐다고 생각하지만 이 한걸음이 헛되지 않도록 더욱 노력해서 다음 프로젝트에는 많은 기능들을 넣어보고 싶습니다.

## :blue_heart: 프로젝트 구현
### :girl: 박지민
#### :smile: 상품 등록 및 수정

-상품등록
<br/>

![Honeycam 2024-03-27 21-30-32](https://github.com/hijimin/puppyFriends/assets/147786615/97967a26-495a-4449-9bf5-9edce2f7c3ba)

-상품수정
<br/>

![상품수정1](https://github.com/hijimin/puppyFriends/assets/147786615/73611dc7-5dfc-45cb-ac93-e7ff15e30a5f)

#### :smile: 상품 키워드 검색

-상품검색
<br/>

![상품검색1](https://github.com/hijimin/puppyFriends/assets/147786615/415666e3-8f80-48db-a43c-104257cae2f7)

#### :smile: 상품 인기순, 최신순, 조회순 조회

-상품조회
<br/>

![상품조회](https://github.com/hijimin/puppyFriends/assets/147786615/dea4284c-2dbe-48a7-af5e-8f326f3ab972)

#### :smile: 장바구니 등록, 조회, 삭제

-장바구니 등록(담기)
<br/>

![Honeycam 2024-03-28 08-34-00](https://github.com/hijimin/puppyFriends/assets/147786615/676df89e-2a4d-4efa-8fc8-03784d0e5a77)

-장바구니 조회
<br/>

![Honeycam 2024-03-28 13-44-26](https://github.com/hijimin/puppyFriends/assets/147786615/cbb9649b-b900-4d96-8646-c7d4bd10ebad)

-장바구니 삭제
<br/>

![장바구니삭제](https://github.com/hijimin/puppyFriends/assets/147786615/baf33c7d-2c7e-411f-855a-19b8a918b5bd)

#### :smile: 상품결제(토스페이, 카카오페이)

-토스페이결제
<br/>

![토스결제](https://github.com/hijimin/puppyFriends/assets/147786615/e2ca2312-af0a-4853-82a8-9b276ac80160)

-카카오페이결제
<br/>

![KakaoTalk_20240329_001202091](https://github.com/hijimin/puppyFriends/assets/147786615/67ef8820-19d9-4d62-bd5c-43973a801d3c)

#### :smile: 상품 리뷰 등록, 수정, 삭제

-리뷰 등록
<br/>

![리뷰등록](https://github.com/hijimin/puppyFriends/assets/147786615/05d76c62-c598-40ba-977e-285c34d51a42)

-리뷰 수정
<br/>

![리뷰수정](https://github.com/hijimin/puppyFriends/assets/147786615/9fac21ee-5ddc-4e36-bbc8-1aaadf7d420e)

-리뷰 삭제
<br/>

![리뷰삭제](https://github.com/hijimin/puppyFriends/assets/147786615/a868fba2-9b19-44ec-b066-df57687bd2a3)

<br/>


### :boy: 박민규

#### : 메인페이지
![메인페이지](https://github.com/hijimin/puppyFriends/assets/151510050/7bce4156-17c6-4155-a1df-ef46865635dd)

- 오시는길
  ![오시는길](https://github.com/hijimin/puppyFriends/assets/151510050/d180d184-0962-4650-8fd7-d87b366ea7c2)


#### : 출석부
- 출석부 등록
![출석부 등록](https://github.com/hijimin/puppyFriends/assets/151510050/c73840e5-8f38-4d8f-8d1a-ef97059b2c66)

- 회원 출석부 조회
  ![회원 출석부 조회](https://github.com/hijimin/puppyFriends/assets/151510050/80a70ce5-7f11-4664-a037-1214be0c1ef0)

  
- 관리자 출석부 조회
![출석부 조회](https://github.com/hijimin/puppyFriends/assets/151510050/1030c281-4972-49ad-a977-2b7fb4a4169b)

- 출석부 수정 
![출석부 변경](https://github.com/hijimin/puppyFriends/assets/151510050/680da669-fffd-4a81-9da0-fb64a4c7e50c)

#### : 갤러리
- 갤러리 조회
![갤러리 조회](https://github.com/hijimin/puppyFriends/assets/151510050/74c89229-566b-423f-957e-0f6d4b58f6df)

- 갤러리 등록
 ![갤러리등록](https://github.com/hijimin/puppyFriends/assets/151510050/08ada5fb-2bb5-462d-a19e-a2bda3a484be)

- 갤러리 검색
   ![갤러리 검색](https://github.com/hijimin/puppyFriends/assets/151510050/7945393c-9c22-4bae-89f3-4a731bda6971)

#### : 채팅
- 회원 채팅 조회
  ![회원 채팅 조회](https://github.com/hijimin/puppyFriends/assets/151510050/b64276b0-00cb-426e-a1e6-c19b408e0234)

- 관리자 채팅 조회
  ![관리자 회원 채팅 조회](https://github.com/hijimin/puppyFriends/assets/151510050/d956d5ba-616d-4152-b400-586a55ce5234)

- 1대1 채팅
 ![관리자 회원 1대1 채팅](https://github.com/hijimin/puppyFriends/assets/151510050/8e4a372a-c498-4304-ae1d-1a3c3d01cb8a)

<br/>

 ### :boy: 윤상연
 - 관리자 메인 페이지
   ![Honeycam 2024-03-29 13-45-59](https://github.com/hijimin/puppyFriends/assets/151510176/1776ae9f-5b17-44d6-b060-b0a977d361d3)
   
 - 관리자 회원조회 및 삭제
   ![Honeycam 2024-03-29 13-50-04](https://github.com/hijimin/puppyFriends/assets/151510176/b9e86a42-f9db-4780-a752-a724e89d32cc)
   <br/>
   ![Honeycam 2024-03-29 13-55-46](https://github.com/hijimin/puppyFriends/assets/151510176/696ede69-f46c-4f77-b1a7-02199a053476)

 - 관리자 회원복구
   ![Honeycam 2024-03-29 13-52-32](https://github.com/hijimin/puppyFriends/assets/151510176/caf9afea-7399-4145-8b64-586245162b54)

  - 상품리스트
    ![Honeycam 2024-03-29 13-58-23](https://github.com/hijimin/puppyFriends/assets/151510176/e01e299c-ad35-4e19-9f9a-58a5449b5703)

 - 주문
   ![Honeycam 2024-03-29 14-00-29](https://github.com/hijimin/puppyFriends/assets/151510176/070457aa-9045-4748-9ca4-c01e128c4d53)
    <br/>
   ![Honeycam 2024-03-29 14-06-08](https://github.com/hijimin/puppyFriends/assets/151510176/ee280346-9f65-4bfd-b0bd-34eff16c0e2b)
   <br/>
   ![Honeycam 2024-03-29 14-01-46](https://github.com/hijimin/puppyFriends/assets/151510176/85a14408-5cc5-4af2-803a-4b6b2f9e965f)

 - 예약확인
   ![Honeycam 2024-03-29 14-08-07](https://github.com/hijimin/puppyFriends/assets/151510176/e2dfcd83-776b-4a57-a336-8d7ded343301)
    <br/>
    ![Honeycam 2024-03-29 14-18-39](https://github.com/hijimin/puppyFriends/assets/151510176/9d2bc17d-c72d-4c27-93c8-290a2dcaf673)

 - 단체채팅
   ![Honeycam 2024-03-29 14-42-36](https://github.com/hijimin/puppyFriends/assets/151510176/6b045a71-1049-4de9-a87b-333e879a865c)
   <br/>
 - 단체채팅(귓속말)
  ![Honeycam 2024-03-29 15-07-57](https://github.com/hijimin/puppyFriends/assets/151510176/ab45c664-3687-43bd-9cf1-26854c007861)

### :boy: 이상용

### : 로그인, 회원가입
- 일반 로그인, 회원가입
  ![일반로그인](https://github.com/hijimin/puppyFriends/assets/151510137/3da7158b-92d2-402f-9ac8-3cd6c8aadeae)
  ![회원가입](https://github.com/hijimin/puppyFriends/assets/151510137/30db4bdc-3257-4ecb-9993-c96d287e15f1)

- 카카오(API) 회원가입
  ![카카오_회원가입](https://github.com/hijimin/puppyFriends/assets/151510137/f0af0633-6fbc-4618-afb9-0d84a295aefc)

### : 마이페이지
- 회원정보수정
  ![회원정보수정](https://github.com/hijimin/puppyFriends/assets/151510137/39776cd2-decf-403f-95b3-75ce7c6f697a)

- 비밀번호변경
  ![비밀번호변경](https://github.com/hijimin/puppyFriends/assets/151510137/8348c2c0-e579-4116-ad5d-5444672a05f8)

- 회원탈퇴
  ![회원탈퇴](https://github.com/hijimin/puppyFriends/assets/151510137/52b956ee-9861-416b-9822-a51bade83cde)

### : 공지사항
- 공지사항 등록, 수정, 삭제
  ![공지작성](https://github.com/hijimin/puppyFriends/assets/151510137/8c1da559-ed2b-4211-98d5-77820129a7a6)
  ![공지수정](https://github.com/hijimin/puppyFriends/assets/151510137/1ead4e89-5960-4ed8-91f0-91fb1075824e)
  ![공지삭제](https://github.com/hijimin/puppyFriends/assets/151510137/bf716667-8a03-4820-9109-1895e9a8bad8)

### :girl: 류은송

### : 유치원
<br/>
- 유치원 등록,리셋,삭제

  
  ![유치원등록](https://github.com/hijimin/puppyFriends/assets/151510137/bbdafdc2-de37-464b-ba37-bf8aabe9f0fa)

  ![유치원리셋](https://github.com/hijimin/puppyFriends/assets/151510137/0c859e48-d321-4247-b9ab-2c222c8593ec)

  ![유치원삭제](https://github.com/hijimin/puppyFriends/assets/151510137/51c67f2b-092d-4bf8-adae-1a7f4d01bc31)

  


- 유치원 예약

  
  ![유치원예약](https://github.com/hijimin/puppyFriends/assets/151510137/38bba44a-116b-4f6d-bdd1-008e88310846)

  

### : 홈 메뉴
- 탑버튼, 메뉴바
  
  ![탑버튼_메뉴바](https://github.com/hijimin/puppyFriends/assets/151510137/e7e2439f-d2c0-441b-8785-9d40569b8abb)

  

### : 호텔
- 호텔 등록,리셋,삭제
  
  ![호텔등록](https://github.com/hijimin/puppyFriends/assets/151510137/7a661bb8-3bfa-4359-94cd-754eb04b1f9d)


  ![호텔리셋](https://github.com/hijimin/puppyFriends/assets/151510137/a47117e5-1d74-418d-8746-60b7fd4abd5e)


  ![호텔삭제](https://github.com/hijimin/puppyFriends/assets/151510137/3670e84e-cbf6-4a2c-8a62-9f8d551339df)


  

- 호텔 예약

  
  ![호텔예약](https://github.com/hijimin/puppyFriends/assets/151510137/6b9362dc-b484-4978-a428-aead090438ed)




