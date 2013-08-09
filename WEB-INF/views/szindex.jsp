<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<base href="<%=basePath%>">
<title>中小企业公共服务平台</title>
<link href="resources/css/szindex.css" rel="stylesheet" type="text/css" />
<script src="jsLib/jquery/jquery-1.9.1.min.js"></script>
</head>
<body>
	<div class="header">
		<div class="logo">
			<a href="#"><img width="232" height="52"
				src="resources/szimages/logo.jpg" /></a>
		</div>
		<div class="search">
			<form>
				<div class="select">
					<h6 class="choose-name">服务</h6>
					<ul class="choose-list">
						<li>服务</li>
						<li>企业</li>
					</ul>
				</div>
				<div class="query-inp">
					<input type="text"
						onblur="if (this.value == '') {this.value = '请输入搜索内容...';}"
						onfocus="if (this.value == '请输入搜索内容...') {this.value = '';}"
						value="请输入搜索内容..." />
				</div>
				<div class="query-act">
					<button>搜索</button>
				</div>
			</form>
		</div>
		<ul class="top-links pull-right">
			<li><a href="">登陆</a></li>
			<li>|</li>
			<li><a href="">注册</a></li>
		</ul>
	</div>
	<!-- /header -->
	<ul class="top-nav">
		<li><a class="on" href="">首页</a></li>
		<li><a href="">服务商城</a></li>
		<li><a href="">新闻资讯</a></li>
		<li><a href="">政企之窗</a></li>
		<li><a href="">企业百科</a></li>
		<li><a href="">企业社区</a></li>
	</ul>
	<div class="container">
		<div class="ablockl">
			<p class="plateform-icon">
				<img width="150" height="60" src="resources/szimages/icon_1.jpg" />
			</p>
			<div class="sidebar">
				<h3 class="head">服务分类导航</h3>
				<ul class="menu">
					<li><a href="">热点服务</a></li>
					<li><a href="">信息化服务</a>
						<div class="sub-menu">
							<dl>
								<dt>
									<a href="">职业技能</a>
								</dt>
								<dd>
									<em><a href="">技工培训</a></em> <em><a href="">工程师培训</a></em> <em><a
										href="">技工培训</a></em> <em><a href="">工程师培训</a></em> <em><a
										href="">技工培训</a></em> <em><a href="">工程师培训</a></em> <em><a
										href="">技工培训</a></em> <em><a href="">工程师培训</a></em> <em><a
										href="">技工培训</a></em> <em><a href="">工程师培训</a></em> <em><a
										href="">技工培训</a></em> <em><a href="">工程师培训</a></em> <em><a
										href="">技工培训</a></em> <em><a href="">工程师培训</a></em> <em><a
										href="">技工培训</a></em> <em><a href="">工程师培训</a></em>
								</dd>
							</dl>
						</div></li>
					<li><a href="">知识产权服务</a></li>
					<li><a href="">技术创新与质检</a></li>
					<li><a href="">可共用设备项目</a></li>
					<li><a href="">人才培训服务</a></li>
					<li><a href="">市场服务</a></li>
					<li><a href="">查看更多服务分类</a></li>
				</ul>
			</div>
		</div>
		<!-- /ablockl -->
		<div class="ablockc">
			<table class="call-tab">
				<tr>
					<td><a href="">服装</a></td>
					<td><a href="">珠宝</a></td>
					<td><a href="">工业设计</a></td>
					<td><a href="">家具</a></td>
					<td><a href="">LED</a></td>
					<td><a href="">新材料</a></td>
				</tr>
				<tr>
					<td><a href="">软件</a></td>
					<td><a href="">机械</a></td>
					<td><a href="">钟表</a></td>
					<td><a href="">物流</a></td>
					<td><a href="">港澳</a></td>
					<td><a href="">物联网</a></td>
				</tr>
			</table>
			<div class="window-show">
				<a href="javascript:void(0)" class="a1"><img
					src="resources/szimages/s_icon_1.jpg" /></a> <a
					href="javascript:void(0)" class="a2"><img
					src="resources/szimages/s_icon_2.jpg" /></a> <a
					href="javascript:void(0)" class="a3"><img
					src="resources/szimages/s_icon_3.jpg" /></a> <a
					href="javascript:void(0)" class="a4"><img
					src="resources/szimages/s_icon_4.jpg" /></a> <a
					href="javascript:void(0)" class="a5"><img
					src="resources/szimages/s_icon_5.jpg" /></a> <a
					href="javascript:void(0)" class="a6"><img
					src="resources/szimages/s_icon_6.jpg" /></a> <a
					href="javascript:void(0)" class="a7"><img
					src="resources/szimages/s_icon_7.jpg" /></a> <a
					href="javascript:void(0)" class="a8"><img
					src="resources/szimages/s_icon_8.jpg" /></a> <a
					href="javascript:void(0)" class="a9"><img
					src="resources/szimages/s_icon_9.jpg" /></a> <a
					href="javascript:void(0)" class="a10"><img
					src="resources/szimages/s_icon_10.jpg" /></a> <a
					href="javascript:void(0)" class="a11"><img
					src="resources/szimages/s_icon_11.jpg" /></a> <a
					href="javascript:void(0)" class="a12"><img
					src="resources/szimages/s_icon_12.jpg" /></a>
			</div>
		</div>
		<!-- /ablockc -->
		<div class="ablockr">
			<p class="sign-in-up">
				<a class="login" href="">登陆</a><a class="register" href="">注册</a>
			</p>
			<div class="acolumn">
				<h3 class="head">中小微企业认证</h3>
				<div class="body">
					<p>深圳市唯一一家由政府指定的对中小微企业认证的平台</p>
					<p class="apply">
						<a href="">申请</a>
					</p>
				</div>
			</div>
			<div class="acolumn">
				<h3 class="head">通知公告</h3>
				<div class="body">
					<ul class="plist">
						<li><a href="">平台入驻企业已突破700家</a><span class="date">07-02</span></li>
						<li><a href="">平台入驻企业已突破700家</a><span class="date">07-02</span></li>
						<li><a href="">平台入驻企业已突破700家</a><span class="date">07-02</span></li>
						<li><a href="">平台入驻企业已突破700家</a><span class="date">07-02</span></li>
						<li><a href="">平台入驻企业已突破700家</a><span class="date">07-02</span></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /ablockr -->
	</div>
	<!-- /container -->
	<div class="container" style="margin-top: 10px;">
		<div class="bblockl">
			<div class="head">
				<a href="">展会信息</a> <a class="news-more" href="">更多</a>
			</div>
			<div class="content">
				<div class="top">
					<p class="photo">
						<a target="_blank" href=""> <img width="220" height="134"
							src="resources/szimages/nopic.jpg">
						</a>
					</p>
					<h3 class="title">
						<a target="_blank" href="">第三十届国际名家具（东莞）...</a>
					</h3>
					<p style="height: 72px">
						展会规模: 270000 平方米举办时期: 2013年9月5日至2013年9月9日展会地址: 广东现代国际展览中心展会区域:
						全馆组织单位: 东莞名家具俱乐... <a target="_blank"
							href="news/article?cid=1&amp;id=197" class="read-all">
							阅读全文 </a>
					</p>

				</div>
				<ul class="list">
					<li><a target="_blank"
						href="news/article?cid=1&amp;id=203"> 2013中国国际汽车文化生活消费博览
					</a></li>
					<li><a target="_blank"
						href="news/article?cid=1&amp;id=202"> 第十五届东莞国际橡塑胶、包装、压铸和
					</a></li>
					<li><a target="_blank"
						href="news/article?cid=1&amp;id=201"> 第十五届东莞国际模具展及金属加工展
					</a></li>
					<li><a target="_blank"
						href="news/article?cid=1&amp;id=200"> 2013 中国东莞国际鞋展 • 鞋机
					</a></li>
					<li><a target="_blank"
						href="news/article?cid=1&amp;id=199"> 第十三届广东国际汽车展示交易会.秋季
					</a></li>
					<li><a target="_blank"
						href="news/article?cid=1&amp;id=198"> 2013亚太地区压铸工业展览会 </a></li>
					<li><a target="_blank"
						href="news/article?cid=1&amp;id=192"> 中国国际彩盒展 </a></li>
				</ul>
			</div>
		</div>
		<div class="bblockr">
			<div class="top">
				<div class="col pull-left">
					<div class="head">
						<a href="news/list?cid=2">最新推荐</a><a
							class="news-more pull-right" href="news/list?cid=2">更多</a>
					</div>
					<div class="top-news">
						<div class="photo pull-left">
							<a target="_blank" href="news/article?cid=2&amp;id=117">
								<img width="68" height="68"
								src="upload/1370486829393.jpg">
							</a>
						</div>
						<div class="content pull-right">
							<h3 class="title">
								<a target="_blank" href="news/article?cid=2&amp;id=117">
									商务部关于加快流通领域电子商... </a>
							</h3>
							<p style="height: 50px">
								商贸发［2009］540号各省、自治区、直辖市、计划单列市及新疆生产建设兵团商务主管部...</p>
						</div>
					</div>
					<ul class="list">
						<li><a target="_blank"
							href="news/article?cid=2&amp;id=173"> 开创新路 助推中小企业发展 </a></li>
						<li><a target="_blank"
							href="news/article?cid=2&amp;id=168"> 中小企业抛绣球 接还是不接？ </a></li>
						<li><a target="_blank"
							href="news/article?cid=2&amp;id=167"> 经济微弱回稳 中小企业经营恶化 </a>
						</li>
						<li><a target="_blank"
							href="news/article?cid=2&amp;id=159"> 商务部: 线上线下非零和竞争
								融合是趋势 </a></li>
						<li><a target="_blank"
							href="news/article?cid=2&amp;id=154"> 泰国中小企业发展前景乐观 </a></li>
						<li><a target="_blank"
							href="news/article?cid=4&amp;id=129"> 中小微企业工业团购服务指南 </a></li>
					</ul>
				</div>
				<div class="col pull-right">
					<div class="head">
						<a href="news/list?cid=1">政策法规</a><a
							href="news/list?cid=1" class="news-more pull-right">更多</a>
					</div>
					<div class="top-news">
						<div class="photo pull-left">
							<a target="_blank" href="news/article?cid=3&amp;id=138">
								<img width="68" height="68"
								src="upload/1370486629723.jpg">
							</a>
						</div>
						<div class="content pull-right">
							<h3 class="title">
								<a target="_blank" href="news/article?cid=3&amp;id=138">
									投融资服务知识 </a>
							</h3>
							<p style="height: 50px">投融资服务机构是指，为企业的投资、融资等活动提供中介或者直接服务的机构。
								&nbsp; 投融资类型&amp;...</p>
						</div>
					</div>
					<ul class="list">
						<li><a target="_blank"
							href="news/article?cid=3&amp;id=196"> 央行新增120亿再贴现额度
								支持小微企和三农信贷 </a></li>
						<li><a target="_blank"
							href="news/article?cid=3&amp;id=171"> IPO停摆堵了700家企业
								境外上市成中小企业新选择 </a></li>
						<li><a target="_blank"
							href="news/article?cid=3&amp;id=170"> 我国30%光伏企业或倒闭 </a></li>
						<li><a target="_blank"
							href="news/article?cid=3&amp;id=163">
								2013年5月中国物流业景气指数为53.2% </a></li>
						<li><a target="_blank"
							href="news/article?cid=3&amp;id=158"> 微软开启中小企业云腾计划 </a></li>
						<li><a target="_blank"
							href="news/article?cid=3&amp;id=155"> "平台金融"革新中小企业金融服务
						</a></li>
					</ul>
				</div>
			</div>
			<div class="bottom">
				<div class="enterprise-icon pull-left">
					<img src="resources/images/enterprise_icon.jpg">
				</div>
				<marquee width="200" height="150" onmouseout="this.start();"
					onmouseover="this.stop();" direction="up" scrollamount="2"
					class="enterprise-list pull-left">
					<ul>
						<li data-img="1372820988589.JPG"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=26"> 东莞市意利自动化科技有限公司 </a></li>
						<li data-img="1372747233531.JPG"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=23"> 厚街美隆酒庄 </a></li>
						<li data-img="1372747723363.png"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=24"> 东莞市鑫邦实业有限公司 </a></li>
						<li data-img="1372737537027.png"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=19"> 东莞市东方科技有限公司 </a></li>
						<li data-img="1372305870577.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=14"> 东莞市金河田实业有限公司 </a></li>
						<li data-img="1372314131324.JPG"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=15"> 东莞市景曜防静电科技有限公司 </a></li>
						<li data-img="1372822510966.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=22"> 东莞康华众邦医疗科技发展有限公司 </a></li>
						<li data-img="1372746180593.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=20"> 东莞市利拿实业有限公司 </a></li>
						<li data-img="1372746683560.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=21"> 东莞市隆威实业有限公司 </a></li>
						<li data-img="1372058458966.JPG"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=11"> 东莞市永恒食品有限公司 </a></li>
						<li data-img="1372314418538.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=16"> 东莞市凯齐建材有限公司 </a></li>
						<li data-img="1372314752825.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=17"> 东莞市辉煌龙腾机械有限公司 </a></li>
						<li data-img="1372667865291.gif"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=18"> 东莞市德宝机械设备有限公司 </a></li>
						<li data-img="1372748625417.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=27"> 东莞市厚街兴宇鞋材厂 </a></li>
						<li data-img=""><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=28"> 东莞市华艺家具有限公司 </a></li>
						<li data-img="1372758904226.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=29"> 东莞富盈雅高美爵酒店 </a></li>
						<li data-img="1372817716768.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=31"> 富盈集团有限公司 </a></li>
						<li data-img="1372820404960.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=32"> 东莞市力凯科技发展有限公司 </a></li>
						<li data-img=""><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=34"> 东莞市金叶珠宝有限公司 </a></li>
						<li data-img="1372860538295.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=37"> 东莞市威灵顿家具有限公司 </a></li>
						<li data-img="1372860574186.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=38"> 东莞市东成石材有限公司 </a></li>
						<li data-img="1372861533343.jpg"><a target="_blank"
							href="enterprise/enterpriseFeatures?eid=42"> 东莞市兆生家具实业有限公司 </a></li>
					</ul>
				</marquee>
				<div class="enterprise-special pull-right">
					<a href=""><img
						src="upload/hj_cinese_group.jpg"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
	<div class="friend-links container">
		<img src="resources/szimages/photo_4.jpg">
	</div>
	<!-- /friend-links -->
	<div class="footer">
		<p class="p1">主办 ：深圳市中小企业服务中心 | 承办：深圳市商业联合会 | 技术支持：深圳市依格欣计算机技术有限公司</p>
		<p class="p2">备案号：粤ICP备1234567 | 增值电信业务经营许可证：B2-1234567号(ICP加挂服务)</p>
		<p class="p2">&copy;2012 1234567</p>
	</div>
	<script src="resources/szjs/main.js"></script>
</body>
</html>