<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- saved from url=(0070)file:///Users/corwin/Desktop/%E6%89%BE%E5%9B%9E%E5%AF%86%E7%A0%81.html -->
<html class="screen-desktop-wide device-desktop"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>OpenSNS v3开源社群系统</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/opensns-v2/favicon.ico" media="screen">

<!-- zui -->
<link href="./FindPassword/zui.css" rel="stylesheet">

<link href="./FindPassword/zui-theme.css" rel="stylesheet">
<link href="./FindPassword/simple-line-icons.min.css" rel="stylesheet">
<link href="./FindPassword/loading.css" rel="stylesheet">
<link href="./FindPassword/core.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="./FindPassword/magnific-popup.css">
<!--<script src="/opensns-v2/Public/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/com/com.functions.js"></script>

<script type="text/javascript" src="/opensns-v2/Public/js/core.js"></script>-->
<script src="./FindPassword/js.php"></script>



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

<script src="./FindPassword/lang.php"></script>

<script src="./FindPassword/expression.php"></script>

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
    var SIGNATURE = "77424df7c262fcde657e9ed23aa23ec2";
    var TIMESTAMP = "1484139865";
    var MODULE_NAME="Ucenter";
    var ACTION_NAME="mi";
    var CONTROLLER_NAME ="Member";
    var initNum = "140";
    function adjust_navbar(){
        $('#sub_nav').css('top',$('#nav_bar').height());
        $('#main-container').css('padding-top',$('#nav_bar').height()+$('#sub_nav').height()+20)
    }
</script>

</head><body><audio id="music" src="" autoplay="autoplay"></audio>
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->


	<!-- 头部 -->
	<script src="./FindPassword/com.talker.class.js"></script>

<!--[if lt IE 8]>
<div class="alert alert-danger" style="margin-bottom: 0">您正在使用 <strong>过时的</strong>
    浏览器. 是时候 <a target="_blank"
                                          href="http://browsehappy.com/">更换一个更好的浏览器</a>
    来提升用户体验.</div>
<![endif]-->
<script src="./FindPassword/canvas.js"></script>
<script>
    $(document).ready(function () {
        $('[data-role="show_hide"]').click(function () {
            $("#search_box").slideToggle("slow");
        });
        $('[data-role="close"]').click(function () {
            $("#search_box").slideToggle("slow");
        });
        });

</script>
<div class="container-fluid topp-box">
    <div class="col-xs-2 box">
        <div class="img-wrap">
                        <a class="navbar-brand logo" href="http://localhost/opensns-v2/index.php?s=/home/index/index.html"><img src="./FindPassword/logo.png"></a>
        </div>
    </div>
    <div class="col-xs-7 box ">
        <div id="nav_bar" class="nav_bar" style="left: 0px;">
            <div class=" sat-nav">
                <ul class="first-ul">
                                                                            <li class="">
                                <a class="first-a" title="微博" href="" target="_self">
                                    <i class="os-icon-quote-left app-icon "></i>
                                    <span>微博</span>
                                    <span class="label label-badge rank-label" title="" style="background: #000000 !important;color:white !important;"></span>
                                </a>
                            </li>                            <li class="">
                                <a class="first-a" title="搜索" href="" target="_self">
                                    <i class="os-icon-group app-icon "></i>
                                    <span>搜索</span>
                                    <span class="label label-badge rank-label" title="" style="background: #000000 !important;color:white !important;"></span>
                                </a>
                            </li>                </ul>
            </div>
        </div>
    </div>
    <div class="col-xs-3 box c-b-right" style="text-align: right">
                                <script>
                var OPEN_QUICK_LOGIN = "0";
                var ONLY_OPEN_REGISTER = "0";
            </script>
                <a class="top-btn" data-login="do_login">登录</a>
                <a class="top-btn" data-role="do_register" data-url="/opensns-v2/index.php?s=/ucenter/member/register.html">注册</a>    </div>
    <div class="container-fluid search-box" id="search_box" style="display: none">
        <canvas width="1440" height="782"></canvas>
        <div class="text-wrap">
            <div class="container text-box" style="margin: 0 auto!important;">
                <h1>无处不在,搜你所想</h1>
                <form class="navbar-form " action="http://localhost/opensns-v2/index.php?s=/home/index/search.html" method="post" role="search" id="search">
                    <div class="search">
                        <span class="pull-left"><input type="text" name="keywords" class="input" placeholder="全站搜索"></span>
                        <a data-role="search"><i class="icon icon-search pull-right"></i></a>
                    </div>

                    
                </form>

            </div>
            <div class="close-box" data-role="close">X</div>
        </div>
    </div>
</div>








<script>
    $(function() {
        $('[data-role="search"]').click(function() {
            $("#search").submit();
        })
    })

    function displaySubMenu(li) {
        var subMenu = li.getElementsByTagName("ul")[0];
        subMenu.style.display = "block";
    }
    function hideSubMenu(li) {
        var subMenu = li.getElementsByTagName("ul")[0];
        subMenu.style.display = "none";
    }
</script>
	<!-- /头部 -->
	
	<!-- 主体 -->
	<div class="main-wrapper">
    
    <!--顶部导航之后的钩子，调用公告等-->
<!--顶部导航之后的钩子，调用公告等 end-->
    <div id="main-container" class="container">
        <div class="row">
            
    <section>


        <div class="common_block_border login-form-inbox " style="margin-top: 100px">
            <div class="login-text"><strong><h1>邮箱密码找回</h1></strong></div>
            <form class="login-form" id="J_findpwd_form" action="file:///Users/corwin/Desktop/%E6%89%BE%E5%9B%9E%E5%AF%86%E7%A0%81_files/%E6%89%BE%E5%9B%9E%E5%AF%86%E7%A0%81.html" method="post">

                <div class="control-group login-input">


                    <div class="controls">
                        <input type="text" id="inputEmail" class="form-control" placeholder="请输入电子邮件" ajaxurl="/member/checkUserEmailUnique.html" errormsg="请填写正确格式的邮箱" nullmsg="请填写邮箱" datatype="e" value="" name="email">
                    </div>
                </div>
                    <div class="control-group login-input">
                        <div class="controls">
                            <input type="text" id="inputPassword" class="form-control" placeholder="请输入验证码" errormsg="请填写5位验证码" nullmsg="请填写验证码" datatype="*5-5" name="verify">
                        </div>
                    </div>
                    <div class="control-group login-input">
                        <div class="controls">
                            <img class="verifyimg reloadverify" alt="点击切换" src="./FindPassword/index.php" style="cursor:pointer;">
                        </div>
                        <div class="controls Validform_checktip text-warning"></div>
                    </div>
                <a class="btn btn-default" href="http://localhost/opensns-v2/index.php?s=/ucenter/member/login.html">再去登录</a>
                                <button type="submit" class="btn btn-primary pull-right" style="float: right">找 回</button>
            </form>
        </div>
    </section>

        </div>
    </div>
</div>
	<!-- /主体 -->

	<!-- 底部 -->
	<div class="next-box">
    <div class="container">
        <div class="row">
            <div class="col-xs-4 about-us">
                <p class="p-head">关于我们</p>
                <p>lxq: 1601214729</p>        
                <p>lzq: 1601214730</p>     
                <p>mn: 1601214716</p> 
            </div>
            <div class="col-xs-4 text-center">
                <p style="margin-top: 5px">
                    <img src="./SNS_files/code.png" alt="">
                </p>
            </div>
            <div class="col-xs-2 friend">
                <p class="p-head">友情链接</p>
                <li><a target="_blank" title="" href="http://bbs.pku.edu.cn/">北大BBS</a></li><li><a target="_blank" title="" href="http://www.pku.edu.cn/">北京大学</a></li>            </div>
            <div class="col-xs-2 comp">
                <p class="p-head">联系我们</p>
                
                <p><i class="icon icon-phone-sign"></i>010-00000000</p>
                <p><i class="icon icon-envelope-alt"></i>lucien@pku.edu.cn</p>
            </div>
        </div>
        
    </div>
</div>

<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->


<!-- 为了让html5shiv生效，请将所有的CSS都添加到此处 -->
<link type="text/css" rel="stylesheet" href="./FindPassword/jquery.qtip.css">


<!--<script type="text/javascript" src="/opensns-v2/Public/js/com/com.notify.class.js"></script>-->

<!-- 其他库-->
<!--<script src="/opensns-v2/Public/static/qtip/jquery.qtip.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/ext/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/static/jquery.iframe-transport.js"></script>

<script type="text/javascript" src="/opensns-v2/Public/js/ext/magnific/jquery.magnific-popup.min.js"></script>-->

<!--<script type="text/javascript" src="/opensns-v2/Public/js/ext/placeholder/placeholder.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/ext/atwho/atwho.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/zui/js/zui.js"></script>-->
<link type="text/css" rel="stylesheet" href="./FindPassword/atwho.css">

<script src="./FindPassword/js(1).php"></script>
<script type="text/javascript" src="./FindPassword/jquery.iframe-transport.js"></script>

<script src="./FindPassword/lazyload.js"></script>

<script src="./FindPassword/socket.io.js"></script>


    <script type="text/javascript">

        $(document)
                .ajaxStart(function () {
                    $("button:submit").addClass("log-in").attr("disabled", true);
                })
                .ajaxStop(function () {
                    $("button:submit").removeClass("log-in").attr("disabled", false);
                });


        $(function () {
            $("form").submit(function () {
                var self = $(this);
                $.post(self.attr("action"), self.serialize(), success, "json");
                return false;

                function success(data) {
                    handleAjax(data);
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

<script>
    $(document).ready(function () {
        $('[data-role="add_more"]').click(function () {
            $(".footer-bar").fadeToggle();
            $("#add_more").hide();
        });
        $('[data-role="close_more"]').click(function () {
            $(".footer-bar").fadeToggle();
            $("#add_more").show("slow");
        });
    });
</script>
<!-- 页面footer钩子，一般用于加载插件JS文件和JS代码 -->
<!-- 调用全站公告部件-->

<!-- 调用消息部件-->
<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
        
</div>

<script>
    // VERSION_NAME 替换为项目的版本，VERSION_CODE 替换为项目的子版本
  //  new Bugtags('d6023daa6c7467634636c87b3f16213e','8.12','VERSION_CODE');
</script>

	<!-- /底部 -->

</body></html>
