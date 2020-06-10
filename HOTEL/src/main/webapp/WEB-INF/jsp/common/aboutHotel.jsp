<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
/*기본 설정 시작*/
:link{ text-decoration: none; color: inherit; }
:visited,p,a,div,span,ul,li,strong,em, h1, h2 ,h3, h4, h5, h6,dl,dt,dd,select,option{ color: inherit; box-sizing: border-box; font-family: inherit; }
body,html{ width:100%; height:100%; overflow-x: hidden; -webkit-overflow-scrolling: touch; font-size: 16px; word-break: break-all; font-family: 'Noto Sans', sans-serif; position: relative}
/*기본 설정 끝*/




/*메인 비주얼 시작*/
.visual_wrap{ width: calc(100% - 30px); color: #eee; height: calc(100% - 30px); float: left; position: relative; margin: 15px; overflow: hidden; background: url("../images/mainvisual.jpg") no-repeat center; background-size: cover}
.visual_wrap h1{ width: 11%; height: auto; position: absolute; left: 60px; top: 40px;}
.visual_wrap h1 img{ width: 100%;}
.visual_wrap .header_main{ width: 250px; height: auto; font-size: 1.250em; position: absolute; left: 6%; top: 32%}
.visual_wrap .header_main::after{content: ""; width: 20px; height: 1px; display: block; float: left; background: white; margin: 15px 0}
.visual_wrap .header_main li{ margin: 10px 0; width: 100%;  float: left}
.visual_wrap .header_main .main_sublist{ width: auto; height: 0; padding-top: 10px; font-size: 0.750em; overflow: hidden}
.visual_wrap .header_main .main_sublist li::after{ content: ""; width: 5px; height: 5px; display: block; border-radius: 100%; background: #eee; float: left; margin: 5px 10px 0}
.visual_wrap .header_main .main_sublist li a{ padding-bottom: 5px}
.visual_wrap .header_main .main_sublist li a:hover{ border-bottom: solid 1px #eee}
.visual_wrap .language{ position: absolute; right: 72px; top: 40px;}
.visual_wrap .language span{cursor: pointer}
.visual_wrap dl{ position: absolute; right: 75px; top: 40%;}
.visual_wrap dl dt{ font-size: 0.875em; margin-bottom: 15px;}
.visual_wrap dl dd{ font-size: 1.125em; height: 24px; line-height: 24px; margin-bottom: 5px}
.visual_wrap dl dd img{ width: 20px; vertical-align: middle; margin-top: -2px}


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
.bxslider_mainroom .txt{ width: 100%; height: auto; padding: 20px 15px; float: left; position: relative; font-size: 1em !important; }
body.en .bxslider_mainroom .txt{padding: 20px 7px;}
.bxslider_mainroom .txt p{ float: left; width: 100%; line-height: 24px;}
.bxslider_mainroom .txt p.txt_top{ margin: 10px 0; line-height: 30px; color: #919191;}
body.en .bxslider_mainroom .txt p.txt_top{ margin-top:0; line-height: 30px; color: #919191;}
.bxslider_mainroom .txt span{ color: #b3b3b3;}
.bxslider_mainroom .txt span.bold{ font-weight: bold; margin-right: 10px; color: #444}
.bxslider_mainroom .txt h3{ color: #444; font-size: 1.5em; margin-bottom: 20px;}
.bxslider_mainroom .txt span.reservation{ width: 145px; height: 35px; display: block; text-align: center; line-height: 35px; border: solid 1px #0c0b0b; color: #434343; cursor: pointer; position: absolute; right: 0; bottom: 20px; margin: 0}
.bxslider_mainroom .txt span.reservation:hover{ background: #0c0b0b; color: white;}
.custom{ position: absolute; top: 220px; left: 50%; margin-left: -700px; overflow: hidden}
/*메인 accommodation 끝*/

/*메인 about 시작*/
.about{ width: 100%; height: 400px; line-height: 400px; float: left; background: url('/images/main_about_bg.jpg') no-repeat center; background-size: cover; letter-spacing: 15px; color: white; font-size: 1.875em; text-align: center}
body.en .about{ letter-spacing:10px;}
/*메인 about 끝*/


/*about hotel 시작*/
.sub_about{ width: 100%; height: 725px; float: left; position: relative; background: url("/images/about/about_bg.jpg") no-repeat left bottom; background-size: cover; }
.sub_txt_bg{ width: 600px; height: 650px; position: absolute; right: 13%; top:50%; margin-top: -300px; background: url("/images/about/sub_txt_bg.png") no-repeat left;
    background-size: 100% 100%; color: white; font-size: 2em; text-align: left; line-height: 45px; padding: 40px; font-weight: lighter}
.sub_txt_bg strong{ font-weight: normal}
.sub_txt_bg dl{ font-size: 0.5em; line-height: 28px; margin-top: 20px;}
body.en .sub_txt_bg dl{ font-size: 14px;}
.about_bottom{ width: 100%; height: auto; float: left; padding: 100px 0 150px; text-align: center}
.about_bottom h3{ font-size: 2.5em; color: #232323; font-weight: lighter; margin-bottom: 60px}
.about_bottom h3 strong{ font-weight: normal}
.about_bottom ul{ width: 100%; height: auto; float: left; }
.about_bottom ul li{ width: 450px; margin: 10px; display: table-cell;  border: solid 10px white; }
.about_bottom ul li:first-child{ background: #e7f0f7}
.about_bottom ul li:nth-child(2){ background: #edeef3}
.about_bottom ul li:nth-child(3){ background: #efefef}
.about_bottom ul li:last-child{ background: #efefef}
.about_bottom ul li img{ width: 55%; margin: 50px auto 0;}
.about_bottom ul li .title{ width: 100%; float: left; margin: 40px 0; font-size: 1.375em; color: #5d5d5d}
.about_bottom ul li .txt{ width: 100%; padding: 0 20px 50px; float: left; font-size: 0.875em; color: #5d5d5d; text-align: justify; line-height: 26px;}
.about_bottom .location{ width: 100%; height: auto; float: left}
.about_bottom .location dl{ width: 100%; height: auto; float: left; border-top: solid 1px #242424; padding: 20px 30px 20px 180px; position: relative; line-height: 26px; color: #5b5b5b}
.about_bottom .location dl:last-child{ border-bottom: solid 1px #242424;}
.about_bottom .location dl dt{ width: 120px; word-break: keep-all; float: left; position: absolute; left: 30px; top: 50%; transform:translate(0,-50%); font-size: 1.125em; font-weight: bold}
.about_bottom .location dl dd{ width: 100%; float: left; text-align: left; margin: 5px 0}
/*about hotel 끝*/



.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: white;
background-repeat:no-repeat;
background-size:100%;
}
</style>
    </head>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<!--서브 컨텐츠 시작-->
<div class="contents_wrap sub">
   <div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>A B O U T</h1></div>
    <div class="about_bottom">
        <div class="inner">
            <h3 data-i18n="about.cont-title">호텔 시에나 <strong>소개</strong></h3>
            <ul>
                <li>
                    <img src="/images/about/about_01.png" alt="">
                    <p class="title"  data-i18n="about.cont1">시에나의 <strong>철학</strong></p>
                    <p class="txt">
                        <span data-i18n="about.cont1-text1">경기도 내 외국인 관광객 방문수 2위에 빛나는 파주시의 새로운 중심지!</span><br>
                        <span data-i18n="about.cont1-text2">운정 신도시의 랜드마크로 자리매김하고
                        자 노력하는 비즈니스 부띠크호텔 시에나입니다. 호텔 시에나는 100객실의 규모로 레스토랑, 비즈니스코너, 미팅
                        룸 등의 부대업장을 제공합니다. 고객님의 품격있는 여행을 모토로 하는 호텔 시에나는 고객 한분 한분을 내 가족처
                            럼 여기어 편안하고 친절하게 모실것을 약속드립니다.</span>
                    </p>
                </li>
                <li>
                    <img src="/images/about/about_02.png" alt="">
                    <p class="title" data-i18n="about.cont2">교통의 허브인 <strong>운정신도시</strong></p>
                    <p class="txt">
                        <span data-i18n="about.cont2-text1">파주시의 새로운 중심지로 도약하고 있는 운정신도시, 그 초입에 위치한 호텔 시에나는 파주시와 고양시를 있는 교통의 허브 그 자체입니다.</span><br>
                        <span data-i18n="about.cont2-text2">차량을 이용해 DMZ 약 30분, 임진각 30분, 통일전망대 20분, 킨텍스 약 10분, 파주 출판도시 15분, 롯데&신세계 프리미엄 아울렛 약 15분, 헤이리예술마을 약 15분
                            거리에 위치해 비즈니스고객과 관광객에게 최고의 접근성을 제공합니다.</span>
                    </p>
                </li>
                <li>
                    <img src="/images/about/about_03.png" alt="">
                    <p class="title" data-i18n="about.cont3">시에나의 <strong>장점</strong></p>
                    <p class="txt">
                        <span data-i18n="about.cont3-text1">호텔시에나는 전 객실의 디자인에 차별화를 두면서도 최고급 마감재를 사용하여 여행의 품격을 높여드리고자 합니다.</span><br>
                        <span data-i18n="about.cont3-text2">디자인 하나 하나, 서비스 하나 하나가 고객님의 편의를 최우선으로 두고 있으며 또한 다양한 부대업장은 고객님들의 다양한
                            요구에 발맞춤 하기위해 마련되어 있습니다. 고급스러운 객실내의 디자인과, 다양한 부대업장을 즐기시어 고객님의 여행의 품격을 높이시기를 바랍니다.</span>
                    </p>
                </li>
                <li>
                    <img src="/images/about/about_04.png" alt="">
                    <p class="title" data-i18n="about.cont-cont4">지역 활성화를 <strong>위해</strong></p>
                    <p class="txt">
                        <span data-i18n="about.cont4-text1">파주시가 성장할 수록 호텔시에나도 함께 성장한다고 저희는 믿고있습니다.
                            함께 상생하고 발전하는 호텔의 모범이 되고자 호텔시에나는 항상 공부하고 노력합니다.</span><br>
                        <span data-i18n="about.cont4-text2">현재 다양한 분야의 기업, 학교, 단체와 협약을 맺고있으며 또한 파주시의 크고작은 프로젝트와 축제 등에도 항상 함께합니다.</span>
                    </p>
                </li>
            </ul>
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
    