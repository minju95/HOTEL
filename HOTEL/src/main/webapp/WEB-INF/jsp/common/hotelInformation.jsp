<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<style type="text/css">

/*메인 비주얼 시작*/
.visual_wrap{ width: calc(100% - 30px); color: #eee; height: calc(100% - 30px); margin: 0 auto; position: relative; margin: 15px; overflow: hidden; background: url("../images/mainvisual.jpg") no-repeat center; background-size: cover}

.visual_wrap .reservation{width:170px; height: 70px; border: solid 1px #fff;background-color:rgba(0,0,0,.45);
    text-align: center; line-height: 70px; font-size: 1.125em; position: absolute; left: 50%; transform:translateX(-50%); bottom:30%; cursor: pointer}
.visual_wrap .reservation:hover{background-color: #000; border: solid 1px #000; color: #fff;}
.visual_text{ width: 100%; height: 200px; background: url("/images/visual_txt.png") no-repeat top center; background-size: 23%; text-align: center;
    padding-top: 140px; position: absolute; left: 50%; color: white; font-size: 2em; top: 50%; transform: translate(-50% , -40%)}
/*메인 비주얼 끝*/

/*메인 accommodation 시작*/
.accommodation{ width: 100%; height: auto; float: left; padding: 100px 0 ; position: relative}
.accommodation h2{ text-align: center; font-size: 2.188em; color: #1e365f; font-weight: normal;}
.accommodation h2::after{ content: ""; width: 85px; height: 1px; background: black; display: block; margin: 30px auto 50px;}
.accommodation .inner{ padding-top: 237px; width: 1000px}

.custom{ position: absolute; top: 220px; left: 50%; margin-left: -700px; overflow: hidden}
/*메인 accommodation 끝*/

/*about hotel 시작*/
.sub_about{ width: 100%; height: 725px; float: left; position: relative; background: url("/images/about/about_bg.jpg") no-repeat left bottom; background-size: cover; }
.sub_txt_bg{ width: 600px; height: 650px; position: absolute; right: 13%; top:50%; margin-top: -300px; background: url("/images/about/sub_txt_bg.png") no-repeat left;
    background-size: 100% 100%; color: white; font-size: 2em; text-align: left; line-height: 45px; padding: 40px; font-weight: lighter}
.sub_txt_bg strong{ font-weight: normal}

.sub_txt_bg dl{ font-size: 0.5em; line-height: 28px; margin-top: 20px;}
body.en .sub_txt_bg dl{ font-size: 14px;}

.about_bottom{ width: 100%; height: auto; padding: 100px 0 150px; text-align: center; margin: 0 auto;}
.about_bottom h3{ font-size: 2.5em; color: #232323; font-weight: lighter; margin-bottom: 60px}
.about_bottom h3 strong{ font-weight: normal}
.about_bottom .location{ width: 1920px; height: 800px; margin: 0 auto; border: 1px solid red; }
.about_bottom .location dl{ width: 100%; height: auto; float: left; border-top: solid 1px #242424; padding: 20px 30px 20px 180px; position: relative; line-height: 26px; color: #5b5b5b}
.about_bottom .location dl:last-child{ border-bottom: solid 1px #242424;}
.about_bottom .location dl dt{ width: 120px; word-break: keep-all; float: left; position: absolute; left: 30px; top: 50%; transform:translate(0,-50%); font-size: 1.125em; font-weight: bold}
.about_bottom .location dl dd{ width: 100%; float: left; text-align: left; margin: 5px 0}
.about_bottom{font-size:16px;}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false">
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<!--서브 컨텐츠 시작-->
<div class="contents_wrap sub">
    <div class="about_bottom">
        <div class="inner">
            <h3 data-i18n="about.cont-title"><strong>라떼 호텔 소개</strong></h3>
            <p>
           	국내 최고의 럭셔리 비즈니스 호텔인 롯데호텔 서울은 1,015실 규모를 자랑하며 서울 소공동에 자리잡고 있습니다.
           	명동, 을지로, 청계천 등 서울의 중심 관광지들로의 접근성이 뛰어나 서울 관광을 위한 최적의 위치를 자랑합니다.
           	네 개의 세계적인 인테리어 회사들이 참가하여 설계한 독창적인 인테리어의 객실은 최신 트렌드를 반영하고 있으며,
           	성공적인 비즈니스를 위한 클럽 플로어에서는 품위와 정교함을 느끼실 수 있습니다.
           	또한, 롯데호텔 서울에서는 따뜻하고 고급의 가족모임과 럭셔리 웨딩,
           	대규모 국제회의 진행 등의 비즈니스 행사를 위한 최상의 시설을 제공하고 있으며, 최고급 레스토랑 또한 국빈 등 VIP고객을 모시기에 최적의 선택입니다.
            </p>
            
            <div class="location">
                <h3 data-i18n="about.loc-title">오시는 길</h3>
                <dl>
                    <dt data-i18n="about.subway">지하철 이용시</dt>
                    <dd data-i18n="about.subway1">경의 중앙선 야당역 하차</dd>
                    <dd data-i18n="about.subway2">도보 3분 거리 (1번출구)</dd>
                </dl>
                <dl>
                    <dt data-i18n="about.bus">버스 이용 시 (간선, 지선 등)</dt>
                    <dd>
                        <span data-i18n="about.bus1">한빛마을 4.5단지 앞 하차 (30-173)</span><br>
                        <span data-i18n="about.bus2">- 일반 버스 : 567 (신촌기차역), 600 (강선마을)</span><br>
                        <span data-i18n="about.bus3">- 마을 버스 : 081B, 083</span><br>
                        <span data-i18n="about.bus4">- 광역 버스 : M7426 (강남,양재역)</span><br>
                        <span data-i18n="about.bus5">- 공항 : 5600 (인천공항 8B)</span><br>
                    </dd>
                    <dd>
                        <span data-i18n="about.bus6">한빛마을 4.5단지 맞은편 하차 (30-174)</span><br>
                        <span data-i18n="about.bus7">- 일반 버스 : 567 (신성터미널), 600 (갈곡리)</span><br>
                        <span data-i18n="about.bus8">- 마을 버스 : 083</span><br>
                        <span data-i18n="about.bus9">- 광역 버스 : M7426 (가람마을 3.4.6.단지)</span><br>
                        <span data-i18n="about.bus10">- 공항 : 5600 (문산터미널)</span><br>
                    </dd>
                </dl>
                <dl>
                    <dt data-i18n="about.airport">공항 출발 시</dt>
                    <dd>
                        <span data-i18n="about.airport1">인천국제공항</span><br>
                        <span data-i18n="about.airport2">- 공항 : 5600 (인천공항 8B 터미널 -> 한빛마을 4.5.단지 맞은편 하차)</span>
                    </dd>
                    <dd>
                        <span data-i18n="about.airport3">김포국제공항</span><br>
                        <span data-i18n="about.airport4">- 일반 : 56 (김포공항 국내선 10번홈 -> 한빛마을 8단지 하차)</span>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>
<!--서브 컨텐츠 끝-->
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>
    