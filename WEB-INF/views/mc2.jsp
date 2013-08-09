<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="max-age=0" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-store">
<meta http-equiv="Pragma" CONTENT="no-cache">
<link href="resources/css/olcall.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.comments {
	width: 100%; /*自动适应父布局宽度*/
	overflow: auto;
	word-break: break-all;
	/*在ie中解决断行问题(防止自动变为在一行显示，主要解决ie兼容问题，ie8中当设宽度为100%时，文本域类容超过一行时，  
当我们双击文本内容就会自动变为一行显示，所以只能用ie的专有断行属性“word-break或word-wrap”控制其断行)*/
}
</style>
<script src="jsLib/jquery/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
	//签入签出切换
	$(function() {
		$("#loginxx").click();
	});
	//签入签出切换
	$(function() {
		$("#sig").click(function() {
			if ($(this).val() == "签入") {
				AgentLogin();
			} else {
				AgentLogout();
			}
		});
	});
	//开始停止录音
	$(function() {
		$("#record").click(function() {
			if ($(this).val() == "开始录音") {
				StartRecord();
			} else {
				StopRecord();
			}
		});
	});
	//保持恢复通话
	$(function() {
		$("#keep").click(function() {
			if ($(this).val() == "保持通话") {
				AgentHold();
			} else {
				AgentRetrieve();
			}
		});
	});
	//示闲离席
	$(function() {
		$("#busy").click(function() {
			if ($(this).val() == "示闲") {
				AgentIdle();
			} else {
				AgentBusy();
			}
		});
	});
	var callid = 0;//确定一次通话的唯一标识
	var loginrst = false;//是否登陆成功
	var loginfram = false;//验证用户名，密码，端口是否符合要求格式
	var agentloginrst;//坐席状态
	var recordrt = false;
	var mc2;
	//登录
	function login() {
		document.ThisApplet.begin();
		var accountno = document.form1.P01.value;
		var extno = document.form1.P02.value;
		var password = document.form1.P03.value;
		//alert("accountno = "+accountno+" extno = "+extno+" password = "+password);
		loginfram = document.ThisApplet.Login(accountno, extno, password);
		if (accountno != null && extno != null && password != null) {
			if (loginfram) {
				document.form1.P10.value = "账号密码信息格式正确";
			} else {
				document.form1.P10.value = "账号密码信息格式错误";
			}
		} else {
			document.form1.P10.value = "账号密码均不能为空";
		}
		//javascript:window.open("http://localhost:8080/MC2Test.jsp?Action=LoginResult&Result=0&Balance=21000&mc2=999753930");
	}
	//查看是否登录成功
	function isLogin() {
		if (loginfram) {
			loginrst = false;
			loginrst = document.ThisApplet.isLogin();
			if (loginrst) {
				$("#sig").val("签入");
				$("#sig").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//签入
				document.form1.P10.value = "登录成功";
			} else {
				document.form1.P10.value = "未登录成功";
			}
		} else {
			document.form1.P10.value = "请先登录";
		}
	}
	//外呼
	function dialout() {
		if (loginrst) {
			var caller = document.form1.P04.value;
			var callee = document.form1.P05.value;
			if (caller != null && callee != null) {
				callid = document.ThisApplet.DialOut(caller, callee);
				if (callid > 0) {
					document.form1.P10.value = "外呼成功，callid为" + callid;
				} else {
					document.form1.P10.value = "外呼失败";
				}
			} else {
				alert("主被叫号码不能为空");
				return;
			}
		} else {
			document.form1.P10.value = "未登录成功";
		}
	}

	//发短信
	function SendShortMsg() {
		if (loginrst) {
			var sendno = document.form1.P08.value;
			var sendcontent = document.form1.P09.value;
			var sendrst;
			if (document.form1.sendchk.checked) {
				sendrst = document.ThisApplet.SendShortMsg(false, sendno,
						sendcontent);
				if (sendrst > 0) {
					document.form1.P10.value = "号码池短信发送成功";
				} else {
					document.form1.P10.value = "号码池短信发送失败";
				}
			} else {
				sendrst = document.ThisApplet.SendShortMsg(true, sendno,
						sendcontent);
				if (sendrst > 0) {
					document.form1.P10.value = "账号短信发送成功" + sendrst;
				} else {
					document.form1.P10.value = "账号短信发送失败" + sendrst;
				}
			}

		} else {
			document.form1.P10.value = "请先登录";
		}
	}
	//摘机
	function HangOff() {
		var hangoffrst;
		if (callid > 0) {
			hangoffrst = document.ThisApplet.HangOff(callid);
			if (hangoffrst == 0) {

				$("#sig").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//签入
				$("#busy").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//示闲
				$("#fax").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//传真
				$("#meet").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//会议
				$("#keep").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//保持通话
				$("#record").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//录音
				$("#hangon").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//挂机
				$("#transfer").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//转接

				document.form1.P10.value = "摘机成功";
			} else {
				document.form1.P10.value = "摘机失败";
			}

		} else {
			document.form1.P10.value = "没有外呼记录，无法摘机";
		}
	}
	//挂机拆线
	function HangOn() {
		var hangonrst;
		if (callid > 0) {
			hangonrst = document.ThisApplet.HangOn(callid);
			if (hangonrst == 0) {

				$("#sig").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//签入
				$("#busy").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//示闲
				$("#fax").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//传真
				$("#meet").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//会议
				$("#keep").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//保持通话
				$("#record").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//录音
				$("#hangon").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//挂机
				$("#transfer").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//转接

				document.form1.P10.value = "挂机成功";
			} else {
				document.form1.P10.value = "挂机失败";
			}

		} else {
			document.form1.P10.value = "没有外呼记录，无法挂机";
		}
	}

	//呼叫转移
	function TransferCall() {
		var transfercallee = document.form1.P06.value;
		if (transfercallee != null && transfercallee != '') {
			if (callid > 0) {
				if (document.ThisApplet.TransferCall(callid, transfercallee) == 0) {

					document.form1.P10.value = "呼叫转接成功";
				} else {
					document.form1.P10.value = "呼叫转接失败";
				}
			} else {
				document.form1.P10.value = "没有外呼记录，无法转接";
			}
		} else {
			document.form1.P10.value = "转接号码不能为空";
		}
	}

	//加第三方
	function AddNumber() {
		var addcallee = document.form1.P07.value;
		if (addcallee != null && addcallee != '') {
			if (callid > 0) {
				if (document.ThisApplet.AddNumber(callid, addcallee) == 0) {
					document.form1.P10.value = "加第三方成功";
				} else {
					document.form1.P10.value = "加第三方失败";
				}
			} else {
				document.form1.P10.value = "没有外呼记录，无法加第三方";
			}
		} else {
			document.form1.P10.value = "第三方号码不能为空";
		}
	}
	//退出
	function stop() {
		window.opener = null;
		window.open('', '_self');
		window.close();
		/* document.ThisApplet.stop();
		callid=0;
		loginrst = false;
		loginfram = false;
		document.form1.P10.value = "已经退出"; */
	}

	//坐席签入
	function AgentLogin() {
		if (loginrst) {
			var agenttel = document.form1.P11.value;
			if (agenttel != null) {
				agentloginrst = document.ThisApplet.AgentLogin(agenttel);
				if (agentloginrst == 0) {
					$("#sig").val("签出");
					$("#busy").val("离席");
					$("#busy").attr("disabled", false).removeClass(
							"secondary button").addClass("button");//示闲
					document.form1.P10.value = "请求坐席签入成功";
				} else {
					document.form1.P10.value = "请求坐席签入失败";
				}
			} else {
				document.form1.P10.value = "坐席号码不能为空";
			}
		} else {
			document.form1.P10.value = "请先登录";
		}
	}

	//坐席签出
	function AgentLogout() {
		if (agentloginrst == 0) {
			if (document.ThisApplet.AgentLogout() == 0) {
				$("#sig").val("签入");

				$("#sig").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//签入
				$("#busy").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//示闲
				$("#fax").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//传真
				$("#meet").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//会议
				$("#keep").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//保持通话
				$("#record").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//录音
				$("#hangon").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//挂机
				$("#transfer").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//转接

				document.form1.P10.value = "请求坐席签出成功";
				agentloginrst = -1;
			} else {
				document.form1.P10.value = "请求坐席签出失败";
			}
		} else {
			document.form1.P10.value = "坐席未签入";
		}
	}

	// 坐席离席
	function AgentBusy() {

		if (agentloginrst == 0) {
			var busytime = document.form1.P12.value;
			var reason = document.form1.P13.value;
			if (busytime != null && reason != null) {
				if (document.ThisApplet.AgentBusy(busytime, reason) == 0) {
					$("#busy").val("示闲");
					//  $("#busy").attr("disabled",false).removeClass("secondary button").addClass("button");//示闲
					//alert("busytime="+busytime+",reason="+reason);
					document.form1.P10.value = "请求离席成功";

				} else {
					document.form1.P10.value = "请求离席失败";
				}
			} else {
				document.form1.P10.value = "离席时长和离席原因不能为空";
			}
		} else {
			document.form1.P10.value = "坐席未就绪，请先签入";
		}
	}
	//坐席示闲
	function AgentIdle() {
		if (agentloginrst == 0) {
			var reason = document.form1.P13.value;
			if (reason != null) {
				if (document.ThisApplet.AgentIdle(reason) == 0) {
					$("#busy").val("离席");
					document.form1.P10.value = "请求示闲成功";
				} else {
					document.form1.P10.value = "请求示闲失败";
				}
			} else {
				document.form1.P10.value = "请求示闲原因不能为空";
			}
		} else {
			document.form1.P10.value = "坐席未就绪，请先签入";
		}
	}
	// 坐席状态
	function getAgentState() {

		//if(agentloginrst == 0){
		document.ThisApplet.AgentState();
		var agentstate = document.ThisApplet.getAgentState();
		if (agentstate == 4) {
			document.form1.P10.value = "坐席状态为离席agentstate=" + agentstate;
		} else if (agentstate == 0) {
			document.form1.P10.value = "坐席状态为示闲agentstate=" + agentstate;
		} else {
			document.form1.P10.value = "坐席状态为agentstate=" + agentstate;
		}
	}

	//设置CRM的url，有事件返回时回按格式返回到该url上
	function setCrmUrl() {

		document.ThisApplet.setCrmURL(document.form1.P24.value);
	}
	//查询设置的CRM的url，有事件返回时回按格式返回到该url上	
	function getCrmUrl() {
		var crmurl = document.ThisApplet.getCrmURL();
		document.form1.P24.value = crmurl + "  OK";
	}
	//设置是：1调用servlet；0调用js
	function setJSObjectType() {

		document.ThisApplet.setJSObjectType(document.form1.P25.value);
	}

	//请求开始通话中录音
	function StartRecord() {

		if (callid > 0) {
			recordrt = document.ThisApplet.StartRecord(callid);
			if (hangoffrst == 0) {

				document.form1.P10.value = "请求录音成功callid=" + callid;
			} else {
				document.form1.P10.value = "请求录音失败callid=" + callid;
			}

		} else {
			document.form1.P10.value = "没有外呼记录，无法录音callid=" + callid;
		}
	}
	//请求停止通话中录音
	function StopRecord() {
		if (callid > 0 && recordrt == 0) {
			document.ThisApplet.StopRecord(callid);

			document.form1.P10.value = "请求停止录音callid=" + callid;
		} else {
			document.form1.P10.value = "没有录音，无需停止录音callid=" + callid;
		}
	}

	//请求通话保持
	function AgentHold() {
		if (callid > 0) {
			document.ThisApplet.AgentHold(callid);
			$("#keep").val("恢复通话");
			document.form1.P10.value = "已提交保持callid =" + callid;
		} else {
			document.form1.P10.value = "没有通话，无需保持callid =" + callid;
		}
	}

	//请求通话保持恢复
	function AgentRetrieve() {
		if (callid > 0) {
			$("#keep").val("保持通话");
			document.ThisApplet.AgentRetrieve(callid);
		} else {
			document.form1.P10.value = "没有保持，无需恢复";
		}
	}
	//转传真
	function TransferFax() {
		if (callid > 0) {
			document.ThisApplet.TransferFax(callid);
		} else {
			document.form1.P10.value = "没有外呼记录，无法转传真";
		}
	}

	// applet调用js函数，函数名和参数个数顺序类型不得变动

	//登录结果：结果，余额，mc2号
	function LoginResult(result, balance, mc2) {
		this.mc2 = mc2;

		isLogin();
		//document.form1.P10.value = "result=" + result + "&balance=" + balance
		//		+ "&mc2=" + mc2;
		//document.form1.P1100.value =mc2;
		//alert("result="+result+"&balance="+balance+"&mc2="+mc2);
	}
	//强制退出
	function ForceLoginOut(result) {
		document.form1.P10.value = "强制退出=" + result;
		//alert("result="+result);
	}
	//来电：来电ID，主叫，被叫，原被叫
	function CallIn(CallID, Caller, Callee, OriCallee) {
		this.callid = CallID;
		document.form1.P10.value = "CallID=" + CallID + "&Caller=" + Caller
				+ "&Callee=" + Callee + "&OriCallee=" + OriCallee;
		//alert("CallID="+CallID+"&Caller="+Caller+"&Callee="+Callee+"&OriCallee="+OriCallee);
	}
	//呼叫状态：呼叫ID，呼叫状态
	//istate：0:有来电，1：挂机，2：等待接听，3：空号，4用户忙，5无应答，6：其他错误。9- 正在通话。
	function CallState(CallID, iState) {
		if (9 == iState) {
			$("#sig").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//签入
			$("#busy").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//示闲
			$("#fax").attr("disabled", false).removeClass("secondary button")
					.addClass("button");//传真
			$("#meet").attr("disabled", false).removeClass("secondary button")
					.addClass("button");//会议
			$("#keep").attr("disabled", false).removeClass("secondary button")
					.addClass("button");//保持通话
			$("#record").attr("disabled", false)
					.removeClass("secondary button").addClass("button");//录音
			$("#hangon").attr("disabled", false)
					.removeClass("secondary button").addClass("button");//挂机
			$("#transfer").attr("disabled", false).removeClass(
					"secondary button").addClass("button");//转接
		} else if (0 == iState) {

			$("#sig").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//签入
			$("#busy").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//示闲
			$("#fax").attr("disabled", false).removeClass("secondary button")
					.addClass("button");//传真
			$("#meet").attr("disabled", false).removeClass("secondary button")
					.addClass("button");//会议
			$("#keep").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//保持通话
			$("#record").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//录音
			$("#hangon").attr("disabled", false)
					.removeClass("secondary button").addClass("button");//挂机
			$("#transfer").attr("disabled", false).removeClass(
					"secondary button").addClass("button");//转接

		} else if (2 == iState) {

			$("#sig").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//签入
			$("#busy").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//示闲
			$("#fax").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//传真
			$("#meet").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//会议
			$("#keep").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//保持通话
			$("#record").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//录音
			$("#hangon").attr("disabled", true).removeClass("button").addClass(
					"secondary button");//挂机
			$("#transfer").attr("disabled", true).removeClass("button")
					.addClass("secondary button");//转接

		} else {
			if ($("#sig").val() == "签入") {
				$("#sig").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//签入
				$("#busy").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//示闲
				$("#fax").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//传真
				$("#meet").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//会议
				$("#keep").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//保持通话
				$("#record").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//录音
				$("#hangon").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//挂机
				$("#transfer").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//转接
			} else {
				$("#sig").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//签入
				$("#busy").attr("disabled", false).removeClass(
						"secondary button").addClass("button");//示闲
				$("#fax").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//传真
				$("#meet").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//会议
				$("#keep").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//保持通话
				$("#record").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//录音
				$("#hangon").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//挂机
				$("#transfer").attr("disabled", true).removeClass("button")
						.addClass("secondary button");//转接
			}
		}
		document.form1.P10.value = "CallID=" + CallID + "&iState=" + iState;
		//alert("CallID="+CallID+"&iState="+iState);
	}
	//短信发送结果：短信ID，发送结果，发送号码
	function SendSMSResult(iSMID, iResult, Number) {
		document.form1.P10.value = "iSMID=" + iSMID + "&iResult=" + iResult
				+ "&Number=" + Number;
	}
	//接收短信：发送号码，短信内容
	function RecvSMS(Caller, Content) {
		document.form1.P10.value = "Caller=" + Caller + "&Content=" + Content;
		//alert("Caller="+Caller+"&Content="+Content);
	}
	//坐席状态
	function AgentState(iState) {
		if (iState == 0x24) {
			document.form1.P10.value = "保持成功" + iState;
		} else if (iState == 0x02) {
			document.form1.P10.value = "签入成功" + iState;
		} else if (iState == 0x04) {
			document.form1.P10.value = "签出成功" + iState;
		} else if (iState == 0x06) {
			document.form1.P10.value = "离席成功" + iState;
		} else if (iState == 0x26) {
			document.form1.P10.value = "恢复保持成功" + iState;
		} else if (iState == 19) {
			document.form1.P10.value = "事后处理" + iState;
		} else if (iState == 0x00) {
			document.form1.P10.value = "签入成功" + iState;
		} else {
			//alert("iState="+iState);
		}
		//0x02签入RES_AGENT_LOGIN，0x04坐席签出RES_AGENT_LOGOUT: ,
		//19事后处理,0x6离席，0x08示闲，0x24坐席保持，0x26坐席保持恢复
	}
	//请求开始通话中录音结果
	function StartRecordResult(result) {
		if (result == 0) {
			$("#record").val("停止录音");//录音
			document.form1.P10.value = "开始录音成功result=" + result;
		} else {
			document.form1.P10.value = "开始录音失败result=" + result;
		}

		//alert("result="+result);
	}
	//请求停止通话中录音结果
	function StopRecordResult(result) {
		if (result == 0) {
			$("#record").val("开始录音");//录音
			document.form1.P10.value = "停止录音成功result=" + result;
		} else {
			document.form1.P10.value = "停止录音失败result=" + result;
		}
		//alert("result="+result);
	}
	//转传真
	function TransferFaxResult(result) {
		if (result == 0) {
			document.form1.P10.value = "转传真成功";
		} else {
			document.form1.P10.value = "转传真失败";
		}
		//alert("result="+result);
	}

	//好友认证CHAT_FUNC(String szVoipNo_D,String szReason)
	function CHAT_FUNC() {
		document.ThisApplet.CHAT_FUNC(document.form1.P17.value,
				document.form1.P18.value);
	}

	//好友认证Req_CHAT_FUNC(String szVoipNo_D,String szReason)
	function Req_CHAT_FUNC(szVoipNo_D, szReason) {
		document.form1.P17.value = szVoipNo_D;
		document.form1.P18.value = szReason;
	}

	//好友认证回复CHAT_FUNC_RESULT(String szVoipNo_D,String szReason,int iResult)
	//szReason  :array[0..49]of char;			//拒绝原因
	//iResult   :integer;		//认证结果 0：通过， 1：拒绝  9:对方删除该好友
	function CHAT_FUNC_RESULT() {
		document.ThisApplet.CHAT_FUNC_RESULT(document.form1.P19.value,
				document.form1.P20.value, document.form1.P21.value);
	}
	//好友认证对方回复结果Req_CHAT_FUNC_RESULT
	function Req_CHAT_FUNC_RESULT(VoipNo_D, Reason, iResult) {
		document.form1.P19.value = VoipNo_D;
		document.form1.P20.value = Reason;
		document.form1.P21.value = iResult;
	}
	//接收文本消息
	function Rev_MSG_TXT(VoipNo_Send, VoipNo_Rec, SendTime, Content) {
		//document.form1.P10.value ="发送方="+VoipNo_Send+",接收方="+VoipNo_Rec+",发送时间="+SendTime+",内容="+Content;
		document.form1.P14.value = VoipNo_Send;
		document.form1.P15.value = SendTime;
		document.form1.P16.value = Content;
	}
	//发送文本消息Send_MSG_TXT(String szVoipNo_Rec,String szSendTime,String szContent){
	function Send_MSG_TXT() {
		document.ThisApplet.Send_MSG_TXT(document.form1.P14.value,
				document.form1.P15.value, document.form1.P16.value);
	}

	//查询联系人列表QUERY_ADDRLIST()
	function QUERY_ADDRLIST() {
		document.ThisApplet.QUERY_ADDRLIST();
	}
	//返回联系人数据QueryAddrListResult
	function QueryAddrListResult(ID, NiCheng, FullName, Age, Sex, TelCode,
			MobileTel, FamilyTel, Department, Occupation, Company, Address, QQ,
			Email, ImageFile, Group, InBlackList, IsEnterPrice, IsMeetGroup,
			voipNo, verifyPassed, verifysel, duty, uc, pp) {
		document.form1.P22.value = document.form1.P22.value + "ID=" + ID
				+ "&NiCheng=" + NiCheng + "&FullName=" + FullName + "&Age="
				+ Age + "&Sex=" + Sex + "&TelCode=" + TelCode + "&MobileTel="
				+ MobileTel + "&FamilyTel=" + FamilyTel + "&Department="
				+ Department + "&Occupation=" + Occupation + "&Company="
				+ Company + "&Address=" + Address + "&QQ=" + QQ + "&Email="
				+ Email + "&ImageFile=" + ImageFile + "&Group=" + Group
				+ "&InBlackList=" + InBlackList + "&IsEnterPrice="
				+ IsEnterPrice + "&IsMeetGroup=" + IsMeetGroup + "&voipNo="
				+ voipNo + "&verifyPassed=" + verifyPassed + "&verifysel="
				+ verifysel + "&duty=" + duty + "&uc=" + uc + "&pp=" + pp;
	}

	//查询个人资料
	function QUERY_PERSONINFO() {
		document.ThisApplet.QUERY_PERSONINFO(document.form1.P23.value);
	}
	//返回个人资料QueryAddrListResult
	function qryPersonInfoResult(NiCheng, FullName, Age, Department,
			Occupation, Company, Address, Email, ImageFile, voipNo) {
		// 		document.form1.P22.value = document.form1.P22.value + "NiCheng="
		// 				+ NiCheng + "&FullName=" + FullName + "&Age=" + Age
		// 				+ "&Department=" + Department + "&Occupation=" + Occupation
		// 				+ "&Company=" + Company + "&Address=" + Address + "&Email="
		// 				+ Email + "&ImageFile=" + ImageFile + "&voipNo=" + voipNo;
		$("#L1").val(NiCheng);
		$("#L2").val(FullName);
		$("#L3").val(Age);
		$("#L4").val(Department);
		$("#L5").val(Occupation);
		$("#L6").val(Company);
		$("#L7").val(Address);
		$("#L8").val(Email);
		$("#L9").val(ImageFile);
		$("#L0").val(voipNo);
		// 昵称      全名   年龄   部门  职业   公司  地址   邮件  ImageFile voipNo
	}
</script>

</head>

<body>

	<jsp:include page="head.jsp" flush="true" />
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
			<li class="active"><a href="olcall">在线客服</a></li>
		</ul>
	</div>
	<!-- /container -->
	<div class="container">
		<div class="olcall-wrap">
			<form name="form1">
				<div id="validate" style="display: none">
					帐号 :<input type="text" name="P01" value='61190007' /> 分机号 :<input
						type="text" name="P02" value='30' /> 密码 :<input type="password"
						name="P03" value='123456' /><br /> <input id="loginxx"
						type="button" onclick="login();" value='登陆' />
				</div>
				<!-- <input type="button" onclick="isLogin();" value='查看是否登陆成功' /> 
			<input type="button" onclick="stop();" disabled="true" value='退出' /><br> 
			<input type="button" onclick="getAgentState();" value='坐席状态' />  -->
				<input class="secondary button" type="button" id="busy"
					disabled="disabled" value='示闲' /> <input class="secondary button"
					type="button" id="sig" disabled="disabled" value='签入' />
				<div id="putthrough">
					<input class="secondary button" type="button" id="hangon"
						onclick="HangOn();" disabled="disabled" value='挂机' /> <input
						class="secondary button" type="button" id="transfer"
						onclick="TransferCall();" disabled="disabled" value='转接' />
					<!-- 			  <input type="secondary button" id="record" ="StartRecord();" disabled="true" value='开始录音' /> -->
					<input class="secondary button" type="button" id="keep"
						disabled="disabled" value='保持通话' /> <input
						class="secondary button" type="button" id="meet"
						onclick="AddNumber();" disabled="disabled" value='会议' /> <input
						class="secondary button" type="button" id="fax"
						onclick="TransferFax();" disabled="disabled" value='传真' />
				</div>
				<div class="control-group">
					<label class="control-label">各种操作的 处理结果 :</label>
					<div class="controls">
						<input type="text" name="P10" value='' size="50"
							style="font-weight: bold; font-style: italic; color: red" />
					</div>
				</div>
				<!-- 			 本机的mc2号 :<input type="text"  name="P1100" value='' size="50" style="font-weight:bold;font-style:italic;color:red"/><br/><br/> -->
				<div class="control-group">
					<label class="control-label">转接号码 :</label>
					<div class="controls">
						<input type="text" name="P06" value='013617231948' />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">加入号码 :</label>
					<div class="controls">
						<input type="text" name="P07" value='018218816833' />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">坐席号码 :</label>
					<div class="controls">
						<input type="text" name="P11" value='075582404189' />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">离席时间（分钟）:</label>
					<div class="controls">
						<input type="text" name="P12" value='5' size="3" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">离席示闲原因 （数字）:</label>
					<div class="controls">
						<input type="text" name="P13" value='160' size="3" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">主叫号码 :</label>
					<div class="controls">
						<input type="text" name="P04" value='013617231948' />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">被叫号码 :</label>
					<div class="controls">
						<input type="text" name="P05" value='018218816833' />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"></label>
					<div class="controls">
						<input class="button" type="button" onclick="dialout();"
							value='发起呼叫' />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">短信号码 :</label>
					<div class="controls">
						<input type="text" name="P08" value='013617231948' />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">短信内容 :</label>
					<div class="controls">
						<input type="text" name="P09" value='短信内容' />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">是否号码池发送 :</label>
					<div class="controls">
						<input type="checkbox" name="sendchk" value='是号码池发送' />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input class="button" type="button" onclick="SendShortMsg();"
							value="发送短信" />
					</div>
				</div>


				<!-- CRM对应的URL:<input type="text"  name="P24" value='http://127.0.0.1:8080/1.jsp' size="50" style="font-weight:bold;font-style:italic;color:red"/><br/>
			 <input type="button" onclick="setCrmUrl();" value="设置CRM的URL" />
			 <input type="button" onclick="getCrmUrl();" value="获取CRM的URL" /><br/>
			 设置是调用servlet还是调用js:<input type="text"  name="P25" value='0' size="50" style="font-weight:bold;font-style:italic;color:red"/><br/>
			 <input type="button" onclick="setJSObjectType();" value="设置事件返回方式" /> -->
			</form>
			

		</div>

	</div>
	<applet name="ThisApplet" code="com.yunhan.mc2.class" archive=jsLib/mc2.jar WIDTH=600 height=60 MAYSCRIPT>
			</applet>
	<!-- /container -->
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>