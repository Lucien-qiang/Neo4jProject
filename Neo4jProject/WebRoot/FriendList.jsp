<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0064)http://localhost/opensns-v2/index.php?s=/people/index/index.html -->
<html class="screen-desktop-wide device-desktop"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<title>会员展示</title>
    <meta name="keywords" content="会员展示"><meta name="description" content="会员展示">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/opensns-v2/favicon.ico" media="screen">

<!-- zui -->
<link href="./friendList/zui.css" rel="stylesheet">

<link href="./friendList/zui-theme.css" rel="stylesheet">
<link href="./friendList/simple-line-icons.min.css" rel="stylesheet">
<link href="./friendList/loading.css" rel="stylesheet">
<link href="./friendList/core.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="./friendList/magnific-popup.css">
<!--<script src="/opensns-v2/Public/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/com/com.functions.js"></script>

<script type="text/javascript" src="/opensns-v2/Public/js/core.js"></script>-->
<script src="./friendList/js.php"></script>



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

<script>
    //全局内容的定义
    var _ROOT_ = "/opensns-v2";
    var MID = "1";
    var SIGNATURE = "f89b308ea24d2aadd98e4716ffbf1028";
    var TIMESTAMP = "1484140416";
    var MODULE_NAME="People";
    var ACTION_NAME="index";
    var CONTROLLER_NAME ="Index";
    var initNum = "140";
    function adjust_navbar(){
        $('#sub_nav').css('top',$('#nav_bar').height());
        $('#main-container').css('padding-top',$('#nav_bar').height()+$('#sub_nav').height()+20)
    }
</script>

</head><body><audio id="music" src="" autoplay="autoplay"></audio>
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->


	<!-- 头部 -->
	<script src="./friendList/com.talker.class.js"></script>
<div id="talker">

    </div>
<!--[if lt IE 8]>
<div class="alert alert-danger" style="margin-bottom: 0">您正在使用 <strong>过时的</strong>
    浏览器. 是时候 <a target="_blank"
                                          href="http://browsehappy.com/">更换一个更好的浏览器</a>
    来提升用户体验.</div>
<![endif]-->
<script src="./friendList/canvas.js"></script>
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
                        <a class="navbar-brand logo" href=""><img src="./MainPage/logo.png"></a>
        </div>
    </div>
    <div class="col-xs-7 box ">
        <div id="nav_bar" class="nav_bar" style="left: 0px;">
            <div class=" sat-nav">
                <ul class="first-ul">
                                                                            <li >
                                <a class="first-a" title="微博" href="MainPage.action" target="_self">
                                    <i class="os-icon-quote-left app-icon "></i>
                                    <span>微博</span>
                                    <span class="label label-badge rank-label" title="" style="background: #000000 !important;color:white !important;"></span>
                                </a>
                            </li>                            <li class="active">
                                <a class="first-a" title="用户搜索" href="<s:url action='ObtainOwnFollowers.action'></s:url>" target="_self">
                                    <i class="os-icon-group app-icon "></i>
                                    <span>用户搜索</span>
                                    <span class="label label-badge rank-label" title="" style="background: #000000 !important;color:white !important;"></span>
                                </a>
                            </li>                </ul>
            </div>
        </div>
    </div>
    <div class="col-xs-3 box c-b-right" style="text-align: right">
        <li class="dropdown li-hover self-info">
                                <a role="button" class="dropdown-toggle dropdown-toggle-avatar" data-toggle="dropdown">
                    <span><img src="./MainPage/default_avatar_32_32.jpg" class="avatar-img nav-img"></span>
                    <span><s:property value="person.username"/></span>
                </a>
                <ul class="dropdown-menu user-card" role="menu">
                    <div class="bg-wrap">
                                                    <img class="cover uc_top_img_bg_weibo" src="./MainPage/bg.jpg">                        <div class="change_cover"><a data-type="ajax" data-url="/opensns-v2/index.php?s=/ucenter/public/changecover.html" data-toggle="modal" data-title="上传个人封面" style="color: white;"><img class="img-responsive" src="./MainPage/fractional.png" style="width: 25px;"></a>
                            </div>                    </div>

                    <div class="my-bg-info">
                        <div class="bg-avatar">
                            <a class="link-change-avatar" href="" title="更换头像">
                                <img src="./MainPage/default_avatar_128_128.jpg" class="avatar-img ">
                            </a>
                        </div>
                    <span class="nickname">
                        <a ucard="100" href="" class="user_name" data-hasqtip="16"><s:property value="person.username"/></a>
                    </span>

                        <div class="bg-numb row ">
                            <a href="MainPage.action?momentType=3">
                                <div class="col-xs-4 num">
                                    <span>微博</span>
                                    <span><s:property value='person.momentCount'/></span>
                                </div>
                            </a>
                            <a href="ObtainOwnFans.action?personType=1" title="粉丝数">
                                <div class="col-xs-4 num">
                                    <span>粉丝</span>
                                    <span><s:property value='person.fanCount'/></span>
                                </div>
                            </a>
                            <a href="ObtainOwnFollowers.action?personType=0" title="关注数">
                                <div class="col-xs-4 num" style="border: none">
                                    <span>关注</span>
                                    <span><s:property value='person.followCount'/></span>
                                </div>
                            </a>
                        </div>

                    </div>

                    <div class="row grade-box">
                                                <script>
                            $(function () {
                                $('#upgrade').tooltip({
                                            html: true,
                                            title: '当前阶段：Lv1  <br/>下一阶段：Lv2 <br/>现有：10<br/>需要：50<br/>剩余需要： 40<br/>升级进度：20.0% <br/> '
                                        }
                                );
                            })
                        </script>
                        <div class="col-xs-2 l-box"><span>微博</span></div>
                        <div class="col-xs-10 r-box">
                            <div id="upgrade" class="upgrade" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="">
                                <div class="grade-bottom"></div>
                                <div class="grade-top" style="width:10.0%;"></div>
                            </div>
                        </div>
                        <p class="pull-right"><span><s:property value='person.momentCount'/></span>/<span style="color: #ccc">100</span></p>
                    </div>
<div class="link-wrap">
                        <div class="link-box row">
                            <a href="">
                                <div class="col-xs-6 l-p0">
                                    
                                  修改资料  
                                </div>
                            </a>
                            <a href="Logout.action">
                                <div class="col-xs-6 r-p0">
                                    
                                    注销登录
                                </div>
                            </a>
                        </div>
                      
                    </div>
                </ul>
            </li>

            

            
            
                </div>
    
</div>



<!--换肤插件钩子-->
<!--换肤插件钩子 end-->
<div id="tool" class="tool ">
        <!--  <a href="javascript:;" class="admin-view"></a>-->    <a id="go-top" href="javascript:;" class="go-top " style="display: none;"></a>

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
    
    <link href="./friendList/findpeople.css" rel="stylesheet" type="text/css">
    <div id="sub_nav" style="left: 0px;">
    
    <nav class="navbar navbar-default">
        <div class="container" style="width:1180px;">
            
            <ul class="nav navbar-nav navbar-left">
                <li id="tab_index" <s:if test="personType==0">class="active"</s:if> >
                    <a href="<s:url action='ObtainOwnFollowers.action'></s:url>">我的关注</a>
                </li>
                <li id="tab_area"  <s:if test="personType==1">class="active"</s:if>>
                    <a href="<s:url action='ObtainOwnFans.action'></s:url>">我的粉丝</a>
                </li>
                <li id="tab_area" <s:if test="personType==2">class="active"</s:if> >
                    <a href="<s:url action='ObtainPopularUsers.action'></s:url>">热门用户</a>
                </li>
                 <li id="tab_area" <s:if test="personType==3">class="active"</s:if> >
                    <a href="<s:url action='recommendFriends.action'></s:url>">推荐用户</a>
                </li>
                
            </ul>
            <script>
                $('#tab_index').addClass('active');
                var follower = {
                    'bind_follow': function () {
                        $('[data-role="follow"]').unbind('click')
                        $('[data-role="follow"]').click(function () {
                            var $this = $(this);
                            var uid = $this.attr('data-follow-who');
                            $.post(U('Core/Public/follow'), {uid: uid}, function (msg) {
                                if (msg.status) {

                                    $this.attr('class', $this.attr('data-before'));
                                    $this.attr('data-role', 'unfollow');
                                    $this.html('已关注');
                                    follower.bind_follow();
                                    toast.success(msg.info, 温馨提示);
                                } else {
                                    toast.error(msg.info,温馨提示);
                                }
                            }, 'json');
                        })

                        $('[data-role="unfollow"]').unbind('click')
                        $('[data-role="unfollow"]').click(function () {
                            var $this = $(this);
                            var uid = $this.attr('data-follow-who');
                            $.post(U('Core/Public/unfollow'), {uid: uid}, function (msg) {
                                if (msg.status) {
                                    $this.attr('class', $this.attr('data-after'));
                                    $this.attr('data-role', 'follow');
                                    $this.html('关注');
                                    follower.bind_follow();
                                    toast.success(msg.info,温馨提示);
                                } else {
                                    toast.error(msg.info, 温馨提示);
                                }
                            }, 'json');
                        })
                    }
                }
            </script>
          
            <form style="margin: 5px 0" class="navbar-form navbar-right" action="SearchByName.action" method="post" role="search">
                
                <div class="search-input-group new-search-group">
                    <button class="input-btn" type="submit">
                        <i class="">搜索</i></button>
                    <input name="searchName" type="text" class="input new-search" placeholder="昵称" name="keywords" value="">
                </div>
                
            </form>


        </div>
    </nav>
</div>

    <!--顶部导航之后的钩子，调用公告等-->
<!--顶部导航之后的钩子，调用公告等 end-->
    <div id="main-container" class="container">
        <div class="row">
            
    <div class="find">
    
        <div class="find-left">
            <div class="containt">
            <s:iterator value="persons">
                <div class="find-pannel">
                        <div class="pannel-1">
                            <div class="img">
                                <a ucard="100" href="" data-hasqtip="5">
                                    <img src="./friendList/default_avatar_128_128.jpg" alt="" style="width:80px;border-radius: 100%;">
                                </a>
                            </div>
                            <div class="name">
                                <a ucard="100" href="<s:url action='ObtainUserMoment'>
                        <s:param name='userId' value='Id'/><s:param name='username' value='username'/>
                        </s:url>" data-hasqtip="6"><s:property value="username"></s:property></a>
                            </div>
                            <div class="find-wrap">
                                <div class="jifen">微博  <span><s:property value="momentCount"/></span></div>
                                <!-- <div class="zantong">赞同 <span>2</span></div>-->
                            </div>
                        </div>
                        <div class="pannel-2">
                            <div class="fans" ><a href="<s:url action='ObtainUserFans'>
                        <s:param name='userId' value='Id'/><s:param name='username' value='username'/>
                        </s:url>" >
                                <div class="f1">粉丝</div>
                                <div class="f2"><s:property value="fanCount"/></div></a>
                            </div>
                            <div class="focus"><a href="<s:url action='ObtainUserFallows'>
                        <s:param name='userId' value='Id'/><s:param name='username' value='username'/>
                        </s:url>" >
                                <div class="fo1">关注</div>
                                <div class="fo2"><s:property value="followCount"/></div>
                           </a> </div>
                        </div>
                         <s:if test="Id==person.Id">
                        <div class="pannel-3" >                                                                
                       </div>
                       </s:if>
                       <s:else>
                        <s:if test="personType==0">
                        <div class="pannel-3" >
                        <button onclick="deleteF('<s:property value='Id'></s:property>')" class="box" data-role="follow" data-follow-who="100" style="color:orange;">取消关注</button>
                                                                    
                       </div>
                       </s:if>
                         <s:if test="personType!=0">
                        <div class="pannel-3">
                        <button onclick="follow('<s:property value='Id'></s:property>')" class="box" data-role="follow" data-follow-who="100"><span>+</span>关注</button>
                                                                    
                       </div>
                       </s:if></s:else>
                    </div>
             </s:iterator>
                <div class="pull-right">
                                    </div>
            </div>
                    </div>
        <div class="find-right">
    <div class="friend-fous">
        <div class="friend-head">好友推荐</div>
        <div class="friend-box">
         
        
        </div>
    </div>
</div>

    </div>


        </div>
    </div>
</div>
	<!-- /主体 -->
<script>
function follow(url){
ul = "createFollow.action?followerId="+url;
location.href = ul;
}
function deleteF(url){
ul = "deleteFollow.action?followerId="+url;
location.href = ul;
}
</script>
	<!-- 底部 -->
	<div class="next-box">
    <div class="container">
        <div class="row">
            <div class="col-xs-4 about-us">
                <p class="p-head">关于我们</p>
                <p>lxq: 1601214729@pku.edu.cn</p>        
                <p>lzq: 1601214730@pku.edu.cn</p>     
                <p>mn:  1601214716@pku.edu.cn</p> 
            </div>
            <div class="col-xs-4 text-center">
                <p style="margin-top: 5px">
                    <img src="./MainPage/code.jpg" alt="" width="120px" height="120px">
                </p>
            </div>
            <div class="col-xs-2 friend">
                <p class="p-head">友情链接</p>
                <li><a target="_blank" title="" href="http://bbs.pku.edu.cn/">北大BBS</a></li><li><a target="_blank" title="" href="http://www.pku.edu.cn/">北京大学</a></li>            </div>
            <div class="col-xs-2 comp">
                <p class="p-head">联系我们</p>
                
                <p>010-00000000</p>
                <p>lucien@pku.edu.cn</p>
            </div>
        </div>
        
    </div>
</div>

<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->


<!-- 为了让html5shiv生效，请将所有的CSS都添加到此处 -->
<link type="text/css" rel="stylesheet" href="./friendList/jquery.qtip.css">


<!--<script type="text/javascript" src="/opensns-v2/Public/js/com/com.notify.class.js"></script>-->

<!-- 其他库-->
<!--<script src="/opensns-v2/Public/static/qtip/jquery.qtip.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/ext/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/static/jquery.iframe-transport.js"></script>

<script type="text/javascript" src="/opensns-v2/Public/js/ext/magnific/jquery.magnific-popup.min.js"></script>-->

<!--<script type="text/javascript" src="/opensns-v2/Public/js/ext/placeholder/placeholder.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/ext/atwho/atwho.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/zui/js/zui.js"></script>-->
<link type="text/css" rel="stylesheet" href="./friendList/atwho.css">

<script src="./friendList/js(1).php"></script>
<script type="text/javascript" src="./friendList/jquery.iframe-transport.js"></script>

<script src="./friendList/lazyload.js"></script>

<script src="./friendList/socket.io.js"></script>


    <script src="./friendList/follow.js"></script>

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
<!-- 对话框HTML -->
<div class="modal fade message-box" id="message-box">
    <div class="modal-dialog" style="width: 900px;">
        <div class="modal-content" style="width: 900px;height: 700px;">

            <div id="message-content-box" class="message-content">
                <div class="top">
                    通知
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                </div>
                <div class="content-list">
                    <ul class="session-list"><!--类型列表-->
                        <div class="os-loading5 os-loading spinner">
                            <div class="dot1" style="background-color:#19bca1"></div>
                            <div class="dot2" style="background-color:#19bca1"></div>
                        </div>
                    </ul>
                    <div class="message-list"><!--消息列表--></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        message_session.init_message();
    });
</script><div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
        
</div>

<script>
</script>

	<!-- /底部 -->

</body></html>
