<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!-- 하단정보 시작 -->

<div id="footer">
	<div class="location_wrap">
    <div class="inner">
        <div id="location">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3156.1728692632273!2d126.75977795134064!3d37.71561997967086!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c8e36465ba97b%3A0x424f30e483c23c9!2z7Zi47YWUIOyLnOyXkOuCmA!5e0!3m2!1sko!2skr!4v1562812123519!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
        <div class="left">
            <span class="logo"><a href="/index.php"><img src="/images/logo_white.png" alt=""></a></span>
            <p data-i18n="footer.post">우편번호: 10908</p>
            <p data-i18n="footer.addr">주소: 경기도 파주시 야당동 소리천로 31 (야당동 1081-2번지) </p>
            <p data-i18n="footer.ceo">대표자:홍길동</p>
            <p><span data-i18n="footer.res">객실예약문의번호 :031-943-7260/031.943.7260
            <p><span data-i18n="footer.partner">기업체제휴문의 :031-943-7255</p>
            <p data-i18n="footer.fax">FAX : 031 943 7277</p>
            
        </div>
    </div>
</div>
<!--메인 location 끝-->
<footer>
    <p data-i18n="footer.copy">Copyright  © 2017 HOTEL SIENNA. All rights reserved.</p>
</footer>
<!--
<script type="text/javascript">
    var map = null;
    function initMap() {
        var mapOptions = {
            zoom: 14,
            center: new google.maps.LatLng(37.715968, 126.761983),
            gestureHandling: 'cooperative'
        }
        var map = new google.maps.Map(document.getElementById('location'),
            mapOptions);
        var image = '/images/marker.png';
        var myLatLng = new google.maps.LatLng(37.715968, 126.761983);
        var beachMarker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            icon: image,
            animation: google.maps.Animation.BOUNCE
        });
    }
    //google.maps.event.addDomListener(window, 'load', initialize);
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqSgBj-NkFHyKWNYG8H4Z8pERZDT_rJ7E&callback=initMap"></script>
-->
<!--푸터 끝-->
<script>
    $(document).ready(function(){
        headerMain();
    })
</script>
</div><!--// 라인업 끝 -->    

 