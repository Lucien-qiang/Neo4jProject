<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- saved from url=(0039)file:///Users/corwin/Downloads/SNS.html -->
<html class="screen-desktop-wide device-desktop"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<title></title>
    <meta name="keywords" content="微博"><meta name="description" content="微博首页">
    <!--  <meta http-equiv="refresh" content="30"> -->
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/opensns-v2/favicon.ico" media="screen">

<!-- zui -->
<link href="./MainPage/zui.css" rel="stylesheet">

<link href="./MainPage/zui-theme.css" rel="stylesheet">
<link href="./MainPage/simple-line-icons.min.css" rel="stylesheet">
<link href="./MainPage/loading.css" rel="stylesheet">
<link href="./MainPage/core.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="./MainPage/magnific-popup.css">
<!--<script src="/opensns-v2/Public/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/com/com.functions.js"></script>

<script type="text/javascript" src="/opensns-v2/Public/js/core.js"></script>-->
<script src="./MainPage/js.php"></script>



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

<script src="./MainPage/lang.php"></script>

<script src="./MainPage/expression.php"></script>

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
    var MID = "100";
    var SIGNATURE = "d87980e910bad10f2f8092ce5d461ce8";
    var TIMESTAMP = "1484138655";
    var MODULE_NAME="Weibo";
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
	<script src="./MainPage/com.talker.class.js.下载"></script>
<div id="talker">

    </div>
<!--[if lt IE 8]>
<div class="alert alert-danger" style="margin-bottom: 0">您正在使用 <strong>过时的</strong>
    浏览器. 是时候 <a target="_blank"
                                          href="http://browsehappy.com/">更换一个更好的浏览器</a>
    来提升用户体验.</div>
<![endif]-->
<script src="./MainPage/canvas.js.下载"></script>
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
                        <a class="navbar-brand logo" href="http://localhost/opensns-v2/index.php?s=/home/index/index.html"><img src="./MainPage/logo.png"></a>
        </div>
    </div>
    <div class="col-xs-7 box ">
        <div id="nav_bar" class="nav_bar" style="left: 0px;">
            <div class=" sat-nav">
                <ul class="first-ul">
                                                                            <li class="active">
                                <a class="first-a" title="微博" href="MainPage.action" target="_self">
                                    <i class="os-icon-quote-left app-icon "></i>
                                    <span>微博</span>
                                    <span class="label label-badge rank-label" title="" style="background: #000000 !important;color:white !important;"></span>
                                </a>
                            </li>                            <li class="">
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
            
    <style>
        #main-container {
            width: 1000px;
            margin-top: 70px;
        }
    </style>
    <script type="text/javascript" src="./MainPage/ajaxfileupload.js.下载"></script>
    <link href="./MainPage/weibo.css" type="text/css" rel="stylesheet">
    <link href="./MainPage/font_1476260577_5684297.css" type="text/css" rel="stylesheet">

    <!--微博内容列表部分-->
    <div class="weibo_middle pull-left">
        <div style="display: none" class="weibo_content weibo-content-post weibo_post_box" id="send_box">
        <div class="weibo_content_p">
            <div class="send-top  row" id="input_tip">
                <p class="pull-right limit-num">
                    <span>140</span> / <span>140</span>
                </p>
            </div>
            <div class="tare">
                 <textarea class="form-control weibo-word" id="weibo_content" placeholder=" 有什么新鲜事想告诉大家?" onfocus="startCheckNum_quick($(this))" onblur="endCheckNum_quick()"></textarea>
            </div>
            <div class="op-wrap">
                <!--插件-->
                <div class="pull-left row addons-wrap">
                    <a title="插入表情" href="javascript:" onclick="insertFace($(this))" data-role="insert_face">
                        <i class="iconfont icon-biaoqing i-bq"></i>
                    </a>
                    <a title="插入图片" href="javascript:" id="insert_image" onclick="insert_image.insertImage(this)" data-role="hook_show">
                            <i class="iconfont icon-tupian i-tp"></i>
                        </a>                    <a title="插入话题" href="javascript:" onclick="insert_topic.InsertTopic(this)">
                            <i class="iconfont icon-tianjiahuati i-ht"></i>
                        </a>                                        <div id="emot_content" class="emot_content"></div>
                    <div id="hook_show" class="emot_content"></div>
                </div>

                <div class="pull-right right-wrong">
                    <a href="javascript:" class="send-right" data-role="send_weibo" data-url="/opensns-v2/index.php?s=/weibo/index/dosend.html"><i class="iconfont icon-dui"></i></a>
                    <a href="javascript:" class="send-wrong" data-role="change_back"><i class="iconfont icon-cuo"></i></a>
                </div>
                <!--话题-->
                <div class="pull-right"></div>
            </div>
        </div>
    </div>
    <script>
        var ID_setInterval;
        function checkNum_quick(obj) {
            var value = obj.val();
            var value_length = value.length;
            var can_in_num = initNum - value_length;
            if (can_in_num < 0) {
                value = value.substr(0, initNum);
                obj.val(value);
                can_in_num = 0;
            }
            var html =  can_in_num + " / "+initNum;
            $('.limit-num').html(html);
        }
        function startCheckNum_quick(obj) {
            ID_setInterval = setInterval(function () {
                checkNum_quick(obj);
            }, 250);
        }
        function endCheckNum_quick() {
            clearInterval(ID_setInterval);
        }

        $('[data-role="insert_face"]').click(function() {
            $("#hook_show").css("display", "none");
            $("#emot_content").css("display", "block");
        });
        $('[data-role="hook_show"]').click(function() {
            $("#emot_content").css("display", "none");
            $("#hook_show").css("display", "block");
        });
        $('[data-role="change_back"]').click(function() {
           $("#send_box").hide();
           $(".black-filter").show();
           $.cookie("wb_type","");
        })
    </script>
    <script type="text/javascript" charset="utf-8" src="./MainPage/webuploader.js.下载"></script>
    <link href="./MainPage/webuploader.css" type="text/css" rel="stylesheet">


        <!--  筛选部分-->
        <div class="black-filter row">
            <div class="s-wb-box" data-role="show-sendBox">
                <div class="s-wb-icon">
                    <i class="icon-zs"></i>
                </div>
                <p>发动态</p>
            </div>
        </div>
        
        <div class="weibo-filter-wrap">
        <form action="postMoment.action" method="post" id="postForm" name="postForm">
             <div class="tare">
     <textarea class="form-control weibo-word" id="weibo_content1" name="weibo_content1" placeholder=" 有什么新鲜事想告诉大家? 最多不超过140字"></textarea>
              <button type="button" class="btn btn-primary green-btn" onclick="sendMoment()">发送</button>
              <input id='postInput' name="weibo_content" type="hidden"/>
            </div>
           </form>
                        <div id="weibo_filter">
                <div class="weibo_icon">
                       <li data-weibo-id="" title="显示全部置顶微博" data-role="show_all_top_weibo" style="display: none;">
                        <i class="icon icon-eye-open"></i>
                    </li>
                                    </div>
                <li class="a-wrap">
                        <a id="all" href="<s:url action='MainPage'><s:param name='momentType' value='0'></s:param></s:url>" <s:if test="momentType==0">class="active"</s:if>>
                        <i class="icon icon-all"></i>
                                <span>全站微博</span>                       </a>
                    </li><li class="a-wrap">
                        <a id="concerned" href="<s:url action='MainPage'><s:param name='momentType' value='1'></s:param></s:url>" <s:if test="momentType==1">class="active"</s:if>>
                        <i class="icon icon-flow"></i>
                                <span>我的关注</span>                        </a>
                    </li><li class="a-wrap">
                        <a id="hot" href="<s:url action='MainPage'><s:param name='momentType' value='2'></s:param></s:url>" <s:if test="momentType==2">class="active"</s:if>>
                        <i class="icon icon-hot"></i>
                                <span>热门微博</span>                        </a>
                    </li><li class="a-wrap" >
                        <a id="fav" href="<s:url action='MainPage'><s:param name='momentType' value='3'></s:param></s:url>" <s:if test="momentType==3">class="active"</s:if>>
                        <i class="icon icon-my"></i>
                                <span>我的微博</span>                        </a>
                    </li>            </div>
            <script>
                $('#weibo_filter #all').addClass('active');
            </script>
            <script>
            function sendMoment(){
var text = document.getElementById('weibo_content1').value;
if(text!=''){
var form = document.getElementById('postForm');
var input = document.getElementById('postInput');
input.value = text;
form.submit();
}
else {
alert("微博内容不能为空");
}


}
            </script>
        </div>
        <input type="hidden" value="all_" id="smallnav">
        
        <!--筛选部分结束-->
        <div id="top_list">
                    </div>
        <div id="weibo_list">
  

<script>
    $(function(){
        $('[data-role="id_weibo"]').mouseover(function(){
            var id = $(this).attr('id');
            $(this).find(".follow-btn").css("display", "inline-block");
        })
        $('[data-role="id_weibo"]').mouseout(function(){
            $(".follow-btn").css("display", "none");
        })
    });
    // alert($('.weibo-comment-container').text());
</script>
<s:iterator value="momentlist">
<div style="max-width: 680px;margin-bottom: 10px;" data-role="id_weibo" id="weibo_2" class="">
    <div class="all-wrap">
                    <div class="new-user-first-weibo"></div>        <div class="weibo-content">
            <div class="content-head">
                <div class="avat-box pull-left">
                    <a href="" ucard="1" data-hasqtip="20">
                        <img src="./MainPage/default_avatar_128_128.jpg" class="avatar-img">
                        <%-- <img src="./MainPage/<s:property value='portrait'/>" class="avatar-img"> --%>
                    </a>
                   
                </div>
                <div class="op-box pull-right">
                    <div class="op-tb op-top">
                        <a ucard="1" href="<s:url action='ObtainUserMoment'>
                        <s:param name='userId' value='author.Id'/><s:param name='username' value='author.username'/>
                        </s:url>" class="user_name" data-hasqtip="21">
                                                          <s:property value = "author.username"/>                     </a>
                        <small class="font_grey">Lv1</small>                        &nbsp;
                        <!--隐藏操作列表-->
                        <s:if test="author.Id==person.Id">
                        <div class="pull-right show-operate-wrap">
                            <a href="<s:url action='deleteMoment.action'><s:param name='momentId' value='Id'></s:param></s:url>" class="pull-right">删除</a>
                        </div>
                        </s:if>
                    </div>
                    <div class="op-tb op-bottom">
                        <a data-hover="查看详情" class="wb-time" href="">
                                                            <s:property value="timestamp"/>                      </a>
                    </div>
                </div>
                            </div>
            <div class="content-info row">
                <p class="word-wrap"><s:property value="content"/> </p>                 <div class="form-where">
                    <div class="where w-left">
                        <span>来自 网站端 </span>
                        <span></span>
                    </div>
                    <div class="where w-right  bottom-operate" data-weibo-id="2">
                                                <div class="col-xs-3" style="min-height: 1px"></div>
<div class="col-xs-3 operate-color">
     <a title="喜欢" class="support_btn" table="weibo" row="2" uid="1" jump="" 
     onclick="like('<s:property value = "Id"/>','<s:property value="likeCount"/>')">
       赞
    <span id="support_Weibo_weibo_2<s:property value = "Id"/>"><s:property value="likeCount"/> </span>
</a>
<script>
function like(id,count){

var likecount = document.getElementById('support_Weibo_weibo_2'+id);
count1 = likecount.innerHTML; 
var data = 'momentId='+id;
    var xhr = new XMLHttpRequest();        //创建一个ajax对象
    xhr.onreadystatechange = function(event){    //对ajax对象进行监听
        if(xhr.readyState == 4){    //4表示解析完毕
            if(xhr.status == 200){    //200为正常返回
                likecount.innerHTML = parseInt(count1)+1;
            }
        }
    };
    xhr.open('POST','likeMoment.action',true);    //建立连接，参数一：发送方式，二：请求地址，三：是否异步，true为异步
    xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');    //可有可无
    xhr.send(data);  
}
</script>
<script>
    bind_support();
</script></div>
<div class=" col-xs-3 operate-color" data-role="weibo_comment_btn" data-weibo-id="2">
   评论<s:property value="commentCount"/></div>
<div class="col-xs-3 operate-color">
        <a title="转发" data-role="send_repost" href="">转发<s:property value="repostCount"/></a>
</div>
                    </div>
                </div>
            </div>
        </div>

        </div>
    <div class="weibo-comment-list row" style="display: block;margin:0;" data-weibo-id="2">
    <div class=" weibo-comment-block">
            <div class="weibo-comment-container">
            <form action="commentMoment.action" method="post" id="sendCommentForm" name="sendCommentForm">
                <div class="weibo_post_box">
            <p class="comment-area">
                <input type="hidden" name="momentId" value="<s:property value="Id"/>">
                <input type="text"  name="comment" placeholder="评论（Ctrl+Enter）" id="text_2" rows="2" data-weibo-id="2" class="comment-input  weibo-comment-content comment_text_inputor">
                  <button class="btn btn-primary green-btn" type="submit" data-role="do_comment" id="btn_2" data-weibo-id="2" >发送</button>
            </p>

    <div id="emot_content" class="emot_content" style="position: absolute;    right: 425px;
    top: 45px;"></div>
    <!--评论列表-->
</div></form>
<s:iterator value="commentList" id="c">
<div id="show_comment_2" class="weibo_comment_list" data-comment-count="1">
    <div>
        <div id="comment_1" class="row weibo_comment" data-weibo-id="2" data-comment-id="1">
    <div class="clearfix">
        <div class="col-xs-1" style="width: 8%">
            <div class="" style="overflow: hidden;  padding-top: 5px;">
                <a href="http:" ucard="1" data-hasqtip="22">
                    <img src="./MainPage/default_avatar_64_64.jpg" class="avatar-img"></a>
            </div>
        </div>
        <div class="col-xs-11  comment-content" style="width: 92%;padding-left: 5px;padding-right: 0">
            <div> <a href="" ucard="1" data-hasqtip="23">
     
            <s:property value="#c.get('from_name')"/>
            <s:if test="#c.get('to_name')!=''">回复 <s:property value="#c.get('to_name')"/></s:if>
            </a>：  <span class="weibo-comment text-muted">  <s:property value="#c.get('content')"/></span></div>

           <div class="clearfix text-muted">
               <div class="pull-left ctime">
                    <s:property value="#c.get('timestamp')"/> 
                    
               </div>
               <div class="pull-right operate-buttons text-muted">&nbsp;&nbsp;&nbsp;
                   <a title="喜欢" data-role="support_btn" table="weibo_comment" row="1" uid="1" jump="weibo/index/weibodetail" weibo_id="2">

                    
</a>                   &nbsp;
<s:if test="#c.get('from_id')==person.Id"><a href="javascript:" data-role="comment_del">删除</a> </s:if>                 
&nbsp;
<s:if test="#c.get('to_id')!=person.Id"><a href="javascript:" data-role="weibo_reply" data-user-nickname="admin">回复</a></s:if>

               </div>
           </div>
        </div>

    </div>


</div>        </div><div class="pager" style="display: none!important;">
    </div>
</div>
</s:iterator>

<script>
    $(function () {
        var weiboid = '2';
        $('#text_' + weiboid + '').keypress(function (e) {
            if (e.ctrlKey && e.which == 13 || e.which == 10) {
                $('#btn_' + weiboid + '').click();
            }
        });
    });
</script>            </div>
        </div>    </div>
    </div>
</s:iterator>
<style>
    .suofang {MARGIN: auto;WIDTH: 200px;}
    .suofang img{MAX-WIDTH: 100%!important;HEIGHT: auto!important;width:expression(this.width > 300 ? "300px" :this.width)!important;}
</style>
<script>
    $(function(){
        $('[data-role="id_weibo"]').mouseover(function(){
            var id = $(this).attr('id');
            $(this).find(".follow-btn").css("display", "inline-block");
        })
        $('[data-role="id_weibo"]').mouseout(function(){
            $(".follow-btn").css("display", "none");
        })
    });
    // alert($('.weibo-comment-container').text());
</script><script>
        weibo.lastId = '2';
    </script></div>
        <div id="load_more" class="text-center text-muted">
        <div id="load_more_text"><div class="sk-cube-grid"> <div class="sk-cube sk-cube1"></div> <div class="sk-cube sk-cube2"></div> <div class="sk-cube sk-cube3"></div> <div class="sk-cube sk-cube4"></div> <div class="sk-cube sk-cube5"></div> <div class="sk-cube sk-cube6"></div> <div class="sk-cube sk-cube7"></div> <div class="sk-cube sk-cube8"></div> <div class="sk-cube sk-cube9"></div> </div></div>
    </div>

    <!--分页-->
    <div id="index_weibo_page" style="">
        <div class="text-right">
                    </div>
    </div>
    </div>

    <!--微博内容列表部分结束-->
    <!--首页右侧部分-->
    <div class="weibo_right">
    
        
    
    
    
    <!--热门话题排行start-->
    <div class="wb-topic">
        <p class="topic-head">话题排行</p>
        <div class="topic-content">
        <%int index = 0; %>
        <s:iterator value="topics" id="t">
        <%index++; %>
        <form action="ObtainTopicMoment.action" method="post" >
            <ul>
                     <li><a  title="<s:property value="#t"></s:property>">
                        <div class="num num-top"><%=index%></div>
                        <input type="hidden" name="hotTopic" value="<s:property value='#t'/>">
                        <div><s:property value="#t"></s:property></div>
                        <div ><button type="submit" class="btn-sm btn-primary green-btn">详情</button></div>
                    </a></li> </ul>
            </form>
         </s:iterator>       
        </div>
    </div>
    <!--热门话题排行end-->
        <div style="position: relative">
                <!--广告位-->
                <!--广告位end-->
            </div>
</div>
    <!--首页右侧部分结束-->

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
<link type="text/css" rel="stylesheet" href="./MainPage/jquery.qtip.css">


<!--<script type="text/javascript" src="/opensns-v2/Public/js/com/com.notify.class.js"></script>-->

<!-- 其他库-->
<!--<script src="/opensns-v2/Public/static/qtip/jquery.qtip.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/ext/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/static/jquery.iframe-transport.js"></script>

<script type="text/javascript" src="/opensns-v2/Public/js/ext/magnific/jquery.magnific-popup.min.js"></script>-->

<!--<script type="text/javascript" src="/opensns-v2/Public/js/ext/placeholder/placeholder.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/js/ext/atwho/atwho.js"></script>
<script type="text/javascript" src="/opensns-v2/Public/zui/js/zui.js"></script>-->
<link type="text/css" rel="stylesheet" href="./MainPage/atwho.css">

<script src="./MainPage/js(1).php"></script>
<script type="text/javascript" src="./MainPage/jquery.iframe-transport.js.下载"></script>

<script src="./MainPage/lazyload.js.下载"></script>

<script src="./MainPage/socket.io.js.下载"></script>


    <script src="./MainPage/weibo.js.下载"></script>
    <script>
        var tag_id="all_";
        $('.list-type').removeClass('select');
        $('#'+tag_id).parents('li').addClass('select');

        var SUPPORT_URL = "/opensns-v2/index.php?s=/home/addons/execute/_addons/support/_controller/support/_action/dosupport.html";
        weibo.page = '1';
        weibo.loadCount = 0;
        weibo.lastId = parseInt('3') + 1;
        weibo.url = "/opensns-v2/index.php?s=/weibo/index/loadweibo/uid/0.html";
        weibo.type = "all";
        $(function () {
            weibo_bind();
            //当屏幕滚动到底部时
            if (weibo.page == 1) {
                $(window).on('scroll', function () {
                    if (weibo.noMoreNextPage) {
                        return;
                    }
                    if (weibo.isLoadingWeibo) {
                        return;
                    }
                    if (weibo.isLoadMoreVisible()) {
                        weibo.loadNextPage();
                    }
                });
                $(window).trigger('scroll');
            }
        });
        $(document).ready(function () {
            $('[data-role="switch_sendBox"]').click(function () {
                if (is_login()) {
                    var wb_cookie = $.cookie("wb_type");
                    $(".add-weibo").hide();
                    if (wb_cookie == 'tp_value'){
                        $("#send_box").show();
                    }
                    else{
                        $(".black-filter").slideToggle();
                    }
                } else {
                    toast.error('请先登录！');
                }
            });
            $('[data-role="show-sendBox"]').click(function () {
                $("#send_box").show();
                $("#weibo_content").focus();
                $(".black-filter").hide();
                $.cookie('wb_type', 'tp_value',{ expires: 7 });
            });
            $('[data-role="open_checkBox"]').click(function () {
                $(".hide-check-box").fadeToggle("slow");
            });
            $('[data-role="close_checkBox"]').click(function () {
                $(".hide-check-box").fadeToggle("slow");
            });

            var divNum = $(".c-box").size();
            if(divNum>4){
                $('.show-more').css('display','block');
            }
            $('[data-role="show_more_link"]').click(function () {
                $('.gg-check').addClass('c-class');
                $('.show-more').hide();
                $('.close-more').show()
            });
            $('[data-role="close_more_link"]').click(function () {
                $('.gg-check').removeClass('c-class');
                $('.show-more').show();
                $('.close-more').hide()
            });
        });
    </script>
    <link rel="stylesheet" href="./MainPage/photoswipe.css">
    <link rel="stylesheet" href="./MainPage/default-skin.css">
    <script src="./MainPage/photoswipe.min.js.下载"></script>
    <script src="./MainPage/photoswipe-ui-default.min.js.下载"></script>

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
    // VERSION_NAME 替换为项目的版本，VERSION_CODE 替换为项目的子版本
  //  new Bugtags('d6023daa6c7467634636c87b3f16213e','8.12','VERSION_CODE');
</script>

	<!-- /底部 -->

<div id="atwho-container"><div id="atwho-ground-weibo_content"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-text_3"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div><div id="atwho-ground-text_2"><div class="atwho-view" id="at-view-64"><ul class="atwho-view-ul"></ul></div></div></div></body></html>
