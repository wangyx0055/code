<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
	<base href="<%=basePath%>">
	<title>参赛资讯-中小企业公共服务平台</title>
	<link href="resources/industrial/css/industrial_design.css" rel="stylesheet" type="text/css" />
	<!--[if IE]>
	<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
	<![endif]-->
</head>
<body>
	<jsp:include page="../../head.jsp" flush="true"/>
	<div class="id-container">
		<div class="ic-content">
			<ul class="sidebar pull-left">
				<li><a href="act/industrial/intro"><i></i><em>活动介绍</em></a></li>
				<li><a href="act/industrial/about"><i></i><em>关于大赛</em></a></li>
				<li><a href="act/industrial/subject"><i></i><em>大赛主题</em></a></li>
				<li class="current"><a href="act/industrial/news"><i></i><em>参赛资讯</em></a></li>
				<li><a href="act/industrial/works"><i></i><em>往界作品欣赏</em></a></li>
				<li><a href="act/industrial/photo"><i></i><em>往界花絮</em></a></li>
				<li><a href="act/industrial/download"><i></i><em>相关下载</em></a></li>
			</ul>
			<div class="news pull-left">
				<h2 class="subject-title-l1">参赛资讯</h2>
				<div class="news-content">
					<h3 class="subject-title-l2">参赛对象</h3>
					<div class="nop">
					<p>根据参赛对象不同分为两组，以设计师个人名义参赛的为公开组，以企业名义参赛的为企业组。</p>
					<p>公开组参赛对象为：</p>
					<ul class="news-list">
						<li class="s1">国内外高校设计专业的教师和学生；</li>
						<li class="s2">设计公司或企业的设计人员；</li>
						<li class="s3">其他工业设计爱好者。</li>
					</ul>
					<p>企业组参赛对象为：东莞企业。</p>
					</div>
					<div class="nop">
					<h3 class="subject-title-l2">参赛作品征集内容</h3>
					<h4 class="subject-title-l3">公开组</h4>
					<ul class="news-list-l">
						<li class="s1">电子信息类产品设计</li>
						<li class="s2">家居类产品设计</li>
						<li class="s3">玩具类产品设计</li>
						<li class="s4">LED类产品设计</li>
						<li class="s5">其他</li>
					</ul>
					<h4 class="subject-title-l3">企业组</h4>
					<p>企业组参赛内容不做具体限制，电子信息、机械、家具、玩具、医疗、交通工具等工业产品均可。</p>
					</div>
					<div class="nop">
					<h3 class="subject-title-l2">活动日程</h3>
					</div>
					<ul class="news-list">
						<li class="s1">作品提交截止：<span class="fspecial">2013年9月22日</span></li>
						<li class="s2">初评：<span class="fspecial">2013年9月28日</span></li>
						<li class="s3">复评：<span class="fspecial">2013年10月8日</span></li>
						<li class="s4">终评：<span class="fspecial">2013年11月11日</span></li>
						<li class="s5">优秀作品展、颁奖典礼、设计创新高峰论坛：<span class="fspecial">2013年11月12-15日</span></li>
					</ul>
					<div class="nop">
					<h3 class="subject-title-l2">奖项设置</h3>
					</div>
					<h4 class="subject-title-l3">公开组</h4>
					<p>至尊金奖<span class="fspecial">1</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 20</span><span class="fred fbold">万元</span><span class="fred">人民币 + </span><span class="f16 fred  fbold">奖杯</span><span class="fred"> + 证书</span></p>
					<p>金奖<span class="fspecial">4</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 5</span><span class="fred fbold">万元</span><span class="fred">人民币 + </span><span class="f16 fred  fbold">奖杯</span><span class="fred"> + 证书</span></p>
					<p>银奖<span class="fspecial">6</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 2</span><span class="fred fbold">万元</span><span class="fred">人民币 + </span><span class="f16 fred  fbold">奖杯</span> <span class="fred">+ 证书</span></p>
					<p>铜奖<span class="fspecial">8</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 1</span><span class="fred fbold">万元</span><span class="fred">人民币 + </span><span class="f16 fred  fbold">奖杯</span><span class="fred"> + 证书</span></p>
					<p>优秀奖<span class="fspecial">20</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 0.25</span><span class="fred fbold">万元</span><span class="fred">人民币 + 证书</span></p>
					<p>入围奖若干名：<span class="fred">证书</span></p>
					<h4 class="subject-title-l3">企业组</h4>
					<p>一等奖<span class="fspecial">1</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 5</span><span class="fred fbold">万元</span><span class="fred">人民币 + </span><span class="f16 fred  fbold">牌匾</span><span class="fred"> + 证书</span></p>
					<p>二等奖<span class="fspecial">4</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 3</span><span class="fred fbold">万元</span><span class="fred">人民币 + </span><span class="f16 fred  fbold">牌匾</span><span class="fred"> + 证书</span></p>
					<p>三等奖<span class="fspecial">8</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 1</span><span class="fred fbold">万元</span><span class="fred">人民币 + </span><span class="f16 fred  fbold">牌匾</span><span class="fred"> + 证书</span></p>
					<p>优秀奖<span class="fspecial">20</span>名：<span class="fspecial">奖金</span><span class="f24 fred fbold"> 0.5</span><span class="fred fbold">万元</span><span class="fred">人民币 + </span><span class="f16 fred  fbold">牌匾</span><span class="fred"> + 证书</span></p>
					<p class="f12">注：  大赛最终奖项评定数量视参赛作品质量而定，允许部分奖项空缺。至尊金奖获奖作品的知识产权归大赛主办方所有。</p>
					<div class="nop">
					<h3 class="subject-title-l2">参赛作品要求</h3>
					</div>
					<ul class="news-list">
						<li class="s1">公开组参赛作品须确保为本人或本团队原创，跟已发表的作品相同或近似的作品、曾经参加过其他设计竞赛的作品不得参赛。如因参赛者的剽窃作品、窃取商业秘密等行为所引起的法律责任由参赛者自负，且主办方有权在大赛的任何阶段单方面取消其参赛及获奖资格。</li>
						<li class="s2">企业组参赛作品须是近三年来已被产品化的或即将产业化的，无知识产权纠纷的，且从未获得过本赛事奖项的工业产品。</li>
						<li class="s3">设计作品效果图两张，内容应包含产品主题、彩色效果、基本外观尺寸等，以及用简短的文字描述产品的创新重点、制作工艺、材质等（文字描述要求中文、英文同步）；文件格式为<span class="fspecial">JPG</span>；版面为<span class="fspecial">A2</span>幅面<span class="fspecial">(420mm×594mm )</span>，竖向排版；分辨率为200dpi。作品效果图版面上不得出现作者所在单位、姓名（包括英文或拼音缩写）或与作者身份有关的任何图标、图形及其他信息提示，否则视为无效作品。</li>
					</ul>
					<div class="nop">
					<h3 class="subject-title-l2">报名及交稿方式</h3>
					</div>
					<p>详见<a class="funderline" href="act/industrial/download">相关下载</a></p>
					<div class="nop">
					<h3 class="subject-title-l2">评审流程</h3>
					</div>
					<p><span class="fspecial">初评：</span>评选出大赛入围作品。</p>
					<p><span class="fspecial">复评：</span>从初评入围作品中评选出优秀奖作品及终评入围作品。公开组终评入围作品将由大赛组委会统一制作模型；企业组终评入围作品将由大赛组委会根据产品具体情况考虑是否制作模型。</p>
					<p><span class="fspecial">终评：</span>入围终评作品的主创设计师/企业单位将获邀参加答辩活动，评委就参赛作品的设计图、模型和参赛者现场陈述说明进行评审，最终评选出大赛各个奖项。</p>
					<div class="nop">
					<h3 class="subject-title-l2">评审标准</h3>
					</div>
					<p>创新性<span class="fspecial">（40％）</span>：具备前瞻性、新颖性、独创性，符合现代社会的审美趋势；</p>
					<p>可行性<span class="fspecial">（30％）</span>：符合本届大赛的主题和宗旨，充分考虑市场价值，在现代制造技术与合理成本的条件下，具有批量生产的可行性；</p>
					<p>完整性<span class="fspecial">（20％）</span>：符合节能降耗、绿色环保理念，考虑使用人群及环境、用户体验等；专题作品还需考虑企业文化及品牌形象；</p>
					<p>作品表现形式<span class="fspecial">（10％）</span>：作品具有较强的综合表现能力，能充分表现参赛者的设计意图。</p>
					<p>企业组</p>
					<p>创新性<span class="fspecial">（20％）</span>：具备前瞻性、新颖性、独创性，符合现代社会的审美趋势；</p>
					<p>经济性<span class="fspecial">（30％）</span>：符合市场需求，达到国家质量标准，适合批量生产制造，能够提升产品品牌价值；获得较高效益，或可获得预计的良好经济效益；</p>
					<p>美观性<span class="fspecial">（30％）</span>：外观造型设计适度，体现产品风格和品牌价值，色彩设计协调；</p>
					<p>功能性<span class="fspecial">（20％）</span>：满足在操作、可使用性、安全和维护方面的要求，以及符合节能降耗、绿色环保理念。</p>
					<div class="text-panel">
						<h2>关于参赛作品的知识产权  </h2>
						<p>为营造一个公开、公平、公正的竞赛环境，尊重及保护参赛者的知识产权，大赛参赛作品的知识产权除特别注明外全部归作者所有。公开组优秀入围作品将获得大赛组委会免费为之申请专利的权利。大赛组委会对于本次大赛的参赛作品拥有展览权、印刷权、宣传权和推广对接的权利，任何单位及个人都不得抄袭，且未经作者同意，不得将其作品作公开展示或其他宣传之用。同时，作者也有义务维护其作品的知识产权。</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /ic-content -->
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
	
	<script src="jsLib/bootstrap-master/js/bootstrap-dropdown.js"></script>
	<script src="jsLib/bootstrap-master/js/bootstrap-button.js"></script>
	<script src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script type="text/javascript" src="resources/js/ajax-tab.js"></script>
	<script type="text/javascript" src="resources/js/index.js"></script>
	<script type="text/javascript" src="resources/industrial/js/industrial.js"></script>
</body>
</html>