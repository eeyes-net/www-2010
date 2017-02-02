var eeyes_header="";
eeyes_header+="<!--eeyes_header -->";
eeyes_header+="<style>#eeyes_header {margin:0;padding:0;z-index:9999;width:100%;background: url('http://www.eeyes.net/public/bg_white60.png');top: 0; height: 24px;line-height: 24px;font-size:12px;font-family:'Microsoft Yahei','WenQuanYi Micro Hei','宋体';color:#333;list-style:none;}#eeyes_ico{display:block;float:left;width:16px;height:16px;margin:4px;margin-left:30px;background:url('http://www.eeyes.net/public/eeyes_ico.png');}#eeyes_header li{float:left;padding: 0 5px;}#eeyes_header a{color:#333;text-decoration:none;}#eeyes_header a:hover{color:#184592;}#eeyes_header span{float:right;padding-right: 30px;}</style>";
eeyes_header+="<ul id='eeyes_header'>";
eeyes_header+="	<a id='eeyes_ico' href='http://www.eeyes.net/' target='_blank'></a>";
eeyes_header+="	<li><a href='http://www.eeyes.net/' target='_blank'>首页</a></li>";
eeyes_header+="	<li><a href='http://news.eeyes.net/' target='_blank'>e瞳新闻</a></li>";
eeyes_header+="	<li><a href='http://idv.eeyes.net/' target='_blank'>爱影视</a></li>";
eeyes_header+="	<li><a href='http://zhidao.eeyes.net/' target='_blank'>交大知道</a></li>";
eeyes_header+="	<li><a href='http://music.eeyes.net/' target='_blank'>悦酷电台</a></li>";
eeyes_header+="	<li><a href='http://qing.eeyes.net/' target='_blank'>胭脂坡上</a></li>";
eeyes_header+="	<li><a href='http://piao.eeyes.net/' target='_blank'>在线订票</a></li>";
eeyes_header+="	<li><a href='http://upan.eeyes.net/' target='_blank'>易云U盘</a></li>";
eeyes_header+="	<li><a href='http://go.eeyes.net/' target='_blank'>交大导航</a></li>";
eeyes_header+="	<li><a href='http://join.eeyes.net/' target='_blank'>加入我们</a></li>";
eeyes_header+="	<span>精彩有e瞳，美妙无异同！</span>";
eeyes_header+="</ul>";
eeyes_header+="<!--eeyes_header end-->";
var eeyes_footer="";
eeyes_footer+="<!--eeyes_footer -->";
eeyes_footer+="<style>#eeyes_footer {margin:0;padding:0;z-index:9999;width:100%;background: url('http://www.eeyes.net/public/bg_white60.png');;bottom: 0; border-top: 4px #ccc solid;padding:10px 0; text-align:center; font-size:12px; font-family:'Microsoft Yahei', 'WenQuanYi Micro Hei', '宋体';color:#333;}</style>";
eeyes_footer+="<div id='eeyes_footer'>";
eeyes_footer+="? 2012-2017 e瞳网 eeYes .Net 版权所有";
eeyes_footer+="</div>";
eeyes_footer+="<!--eeyes_footer end-->";
function eeyesLoad(element, type, position, analytic){
	if(analytic==null)
	{
		//Baidu
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
		document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F2b48204fe5fc74209e567ac3ff5d3a9e' type='text/javascript'%3E%3C/script%3E"));
		
		//Google
		/*
		 var _gaq = _gaq || [];
		 _gaq.push(['_setAccount', 'UA-34550452-1']);
		 _gaq.push(['_setDomainName', 'eeyes.net']);
		 _gaq.push(['_trackPageview']);

		 (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		 })();*/
	 }
	 
	if(element!="hide") {
		if(element==null) element='body';
		if(type==null) type='HF';
		if(position==null) position='static';
		if(type=='H') {
			$(element).prepend(eeyes_header);
			$('#eeyes_header').css("position", position);
		}else if(type=='F') {
			$(element).append(eeyes_footer);
			$('#eeyes_footer').css("position", position);
		}else if(type=='HF') {
			$(element).prepend(eeyes_header);
			$(element).append(eeyes_footer);
			$('#eeyes_header').css("position", position);
			$('#eeyes_footer').css("position", position);
		}
	}
}