<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- saved from url=(0066)http://localhost/opensns-v2/index.php?s=/ucenter/member/login.html -->
<html class="screen-desktop-wide device-desktop">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户登录</title>
    <link rel="shortcut icon" type="image/x-icon" href="http://localhost/opensns-v2/favicon.ico" media="screen">
    <!-- zui -->
    <link href="./login/zui.css" rel="stylesheet">
    <link href="./login/zui-theme.css" rel="stylesheet">
    <link href="./login/simple-line-icons.min.css" rel="stylesheet">
    <link href="./login/loading.css" rel="stylesheet">
    <link href="./login/core.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="./login/magnific-popup.css">
<!--<script src="/opensns-v2/Public/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/com/com.functions.js"></script>

<script type="text/javascript" src="/opensns-v2/Public/js/core.js"></script>-->
<script src="./login/js.php"></script>


<!--Style-->
<!--合并前的js-->
<script type="text/javascript">
    var ThinkPHP = window.Think = {
        "ROOT": "/opensns-v2", //当前网站地址
        "APP": "/opensns-v2/index.php?s=", //当前项目地址
        "PUBLIC": "/opensns-v2/Public", //项目公共目录地址
        "DEEP": "/", //PATHINFO分割符
        "MODEL": ["3", "1", "html"],
        "VAR": ["m", "c", "a"],
        'URL_MODEL': "3",
        'WEIBO_ID': ""
    }
    var cookie_config={
        "prefix":"opensns_",// cookie 名称前缀
        "path" :"/", // cookie 保存路径
        "domain":"" // cookie 有效域名
    }
    var Config={
        'GET_INFORMATION':1,
        'GET_INFORMATION_INTERNAL':10*1000,
        'WEBSOCKET_ADDRESS':"127.0.0.1",
        'WEBSOCKET_PORT':8000    }
    var weibo_comment_order = "0";
</script>

<script src="./login/lang.php"></script>

<script src="./login/expression.php"></script>

<!-- Bootstrap库 -->
<!--

&lt;!&ndash; 其他库 &ndash;&gt;
<script src="/opensns-v2/Public/static/qtip/jquery.qtip.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/Core/js/ext/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/static/jquery.iframe-transport.js"></script>
-->
<!--CNZZ广告管家，可自行更改-->
<!--<script type='text/javascript' src='http://js.adm.cnzz.net/js/abase.js'></script>-->
<!--CNZZ广告管家，可自行更改end-->
<!-- 自定义js -->
<!--<script src="/opensns-v2/Public/js.php?get=%2Fstatic%2Fbootstrap%2Fjs%2Fbootstrap.min.js"></script>-->

<script>
    //全局内容的定义
    var _ROOT_ = "/opensns-v2";
    var MID = "0";
    var SIGNATURE = "3ef3bf43892b154b1f34349af91682f9";
    var TIMESTAMP = "1484139340";
    var MODULE_NAME="Ucenter";
    var ACTION_NAME="login";
    var CONTROLLER_NAME ="Member";
    var initNum = "140";
    function adjust_navbar(){
        $('#sub_nav').css('top',$('#nav_bar').height());
        $('#main-container').css('padding-top',$('#nav_bar').height()+$('#sub_nav').height()+20)
    }
</script>

</head>


<body>
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
    <script src="./login/canvas.js.下载"></script>
    <link href="./login/new-login.css" type="text/css" rel="stylesheet">


<!-- 头部 -->
    <canvas width="1366" height="613"></canvas>
<!-- /头部 -->

<!-- 主体 -->

    <link href="./login/new-login.css" type="text/css" rel="stylesheet">
<div class="main-box modal-dialog" style="position:absolute;top:15px;">
    <div class="top-banner modal-header">
        <p style="margin-top: -10px">
           <a class="navbar-brand logo" href="" style="float: none"><img src="./login/logo.png"></a>
        </p>
        <p>基于图数据库的微博系统</p>
    </div>
    <div class="login-wrap modal-body">
        <div data-role="login_info"></div>
        <div class="lg_left">
            <div class="lg_lf_top">
                <h2>欢迎回来 <a href="http://localhost/opensns-v2" title="L(&#39;_ENTER_INDEX_&#39;)"></a>！</h2>
            </div>
            <div class="clearfix"></div>
            <form action="Login.action" method="post" class="lg_lf_form">

                <div class="form-group new-form">
                    <label for="inputEmail" class=".sr-only col-xs-12" style="display: none"></label> 
                    <span class="new-icon user-icon"></span>
                        <input type="text" id="inputEmail" class="form-control new-input" placeholder="请输入邮箱" errormsg="请填写4-32位用户名" nullmsg="请填写用户名" datatype="*4-32" value="" name="username" autocomplete="off">
                    <div class="clearfix"></div>
                </div>

                <div class="form-group new-form">
                    <label for="inputPassword" class=".sr-only col-xs-12" style="display: none"></label> 
                  
                    <div id="password_block" class="input-group pull-right" style="width: 100%;">
                        <input type="password" id="inputPassword" class="form-control new-input" placeholder="请输入密码" errormsg="密码为6-20位" nullmsg="请填写密码" datatype="*6-30" name="password">
                        <div class="input-group-addon show-password add-show"> 
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

                                <div class="clearfix form-group" style="margin-top: -15px">
                    <div class="col-xs-6" style="padding-left: 0">
                        <label style="color: #848484;font-weight: normal">
                            <input type="checkbox" checked="checked" name="remember" value="1" style="cursor:pointer;">
                            记住登录                        </label>
                    </div>
                                        <div class="col-xs-6 text-right" style="padding-right: 0">
                        <div class=""><a class="" href="FindPassword.jsp" style="color: #848484;font-size: 12px;">忘记密码？</a>
                        </div>
                    </div>
                                    </div>
                <c:if test="${state =='1'}">
                <a style="color: red;font-size: 14px;">用户名或者密码错误，请重新登录！</a>
                </c:if>
                <div class="form-group">
                    <button type="submit" class="btn btn-block btn-primary green-btn">登 录</button>
                </div>
            </form>
            <div class="lg_center"></div>

         
                
<link rel="stylesheet" type="text/css" href="">            </div>
                        <script>
                var ONLY_OPEN_REGISTER = "0";
            </script>
            <a href="register.jsp">
                <div class="to-register">
                    <span> 还没有账号？</span>立即注册
                </div>
            </a>
        </div>



        <div class="clearfix"></div>

    </div>
</div>





<script type="text/javascript">
    var quickLogin = "login";
    $(document)
            .ajaxStart(function () {
                $("button:submit").addClass("log-in").attr("disabled", true);
            })
            .ajaxStop(function () {
                $("button:submit").removeClass("log-in").attr("disabled", false);
            });

    function change_show(obj) {
        if ($(obj).hasClass('icon-eye-open')) {
            var value = $('#inputPassword').val().trim();
            var html = '<input type="text" value="' + value + '" id="inputPassword" class="form-control new-input" placeholder="'+"请输入密码"+'" errormsg="'+"密码为6-20位"+'" nullmsg="'+"请填写密码"+'" datatype="*6-30" name="password">' +
                    '<div class="input-group-addon show-password add-show"><a style="width: 100%;height: 100%" href="javascript:void(0);"><i onclick="change_show(this)" class="icon-eye-close"></a></div>';
            $('#password_block').html(html);
        } else {
            var value = $('#inputPassword').val().trim();
            var html = '<input type="password" value="' + value + '" id="inputPassword" class="form-control new-input" placeholder="'+"请输入密码"+'" errormsg="'+"密码为6-20位"+'" nullmsg="'+"请填写密码"+'" datatype="*6-30" name="password">' +
                    '<div class="input-group-addon show-password add-show"><a style="width: 100%;height: 100%" href="javascript:void(0);"><i onclick="change_show(this)" class="icon-eye-open"></a></div>';
            $('#password_block').html(html);
        }
    }

    $(function () {
        $("form").submit(function () {
            toast.showLoading();
            var self = $(this);
            $.post(self.attr("action"), self.serialize(), success, "json");
            return false;
            function success(data) {
                if (data.status) {
                    if (data.url==undefined&&quickLogin == "quickLogin") {
                        toast.success("欢迎回来。"+data.info, "温馨提示");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1500);
                    } else {
                        toast.success("欢迎回来，页面正在跳转，请稍候。"+data.info, "温馨提示");
                        setTimeout(function () {
                            window.location.href = data.url;
                        }, 1500);
                    }
                } else {
                    toast.error(data.info, "温馨提示");
                    //self.find(".Validform_checktip").text(data.info);
                    //刷新验证码
                    $(".reloadverify").click();
                }
                toast.hideLoading();
            }
        });
        var verifyimg = $(".verifyimg").attr("src");
        $(".reloadverify").click(function () {
            if (verifyimg.indexOf('?') > 0) {
                $(".verifyimg").attr("src", verifyimg + '&random=' + Math.random());
            } else {
                $(".verifyimg").attr("src", verifyimg.replace(/\?.*$/, '') + '?' + Math.random());
            }
        });
    });
</script>
<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->


<!-- 为了让html5shiv生效，请将所有的CSS都添加到此处 -->
<link type="text/css" rel="stylesheet" href="./login/jquery.qtip.css">


<!--<script type="text/javascript" src="/opensns-v2/Public/js/com/com.notify.class.js"></script>-->

<!-- 其他库-->
<!--<script src="/opensns-v2/Public/static/qtip/jquery.qtip.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/ext/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/static/jquery.iframe-transport.js"></script>

<script type="text/javascript" src="/opensns-v2/Public/js/ext/magnific/jquery.magnific-popup.min.js"></script>-->

<!--<script type="text/javascript" src="/opensns-v2/Public/js/ext/placeholder/placeholder.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/ext/atwho/atwho.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/zui/js/zui.js"></script>-->
<link type="text/css" rel="stylesheet" href="./login/atwho.css">

<script src="./login/js(1).php"></script>
<script type="text/javascript" src="./login/jquery.iframe-transport.js.下载"></script>

<script src="./login/lazyload.js.下载"></script>

<script src="./login/socket.io.js.下载"></script>
<!-- /主体 -->

</body></html>
