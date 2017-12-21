<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="Web.Management.ThreeStrokes.Subject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>实习</title>
  <link href="/css/common.css" rel="stylesheet" type="text/css">
  <link href="/css/student.css" rel="stylesheet" type="text/css">
  <script src="/js/jquery.js"></script>
  <script src="./js/artTemplate/es5-shim.min.js"></script>
  <script src="./js/artTemplate/es5-sham.min.js"></script>
  <script src="./js/artTemplate/json3.min.js"></script>
  <script src="./js/artTemplate/template-web.js"></script>

  <script src="./js/business/temp.js"></script>

</head>

<body>
  <form id="form1" runat="server">
    <!-- headerlogined -->
    <header>
      <img class="logo" src="/images/logo.png" width="283" alt="">
      <nav>
        <a href="/student/news/">通知</a>
        <a href="/student/">
          <div class="nav-new">1</div>活动</a>
        <a href="/student/yunpan/">云盘</a>
        <a href="/student/weige/wgkb.aspx">微格</a>
        <div class="clearfix"></div>
      </nav>
      <div class="header-right">
        <div class="user-info">
          <img class="user-img" src="/images/user-img.png" width="34" alt="">
          <p class="user-name">诸葛垚</p>
          <div class="clearfix"></div>
          <ul class="user-manu">
            <li>
              <a href="/student/grzx/MyInfo.aspx">基本资料</a>
            </li>
            <li>
              <a href="/student/grzx/MyGrowth.aspx">成长时间线</a>
            </li>
            <li>
              <a href="/student/grzx/MyAbility.aspx">能力雷达图</a>
            </li>
            <li>
              <a href="/student/grzx/MyComment.aspx">他评模块</a>
            </li>
            <li>
              <a href="/">退出</a>
            </li>
          </ul>
        </div>
        <button class="search-submit">
          <img src="/images/search.png" width="13" alt="">
        </button>
        <input class="search" value="搜索" onFocus="if(value=='搜索'){value='';style.color='black'}" onBlur="if(!value){value=defaultValue;style.color='#999'}">
        <div class="clearfix"></div>
      </div>
      <script>
        //搜索框
        $(".search").focus(function () {
          $(this).css("width", "125px").animate({ "width": "150" }, 250);
        }).blur(function () {
          $(this).css("width", "175px").animate({ "width": "100" }, 250)
        });

        //用户菜单
        $(".user-info").mouseenter(function () {
          if (!$(".user-manu").is(':animated')) {
            $(".user-manu").slideDown();
          }
        }).mouseleave(function () {

          $(".user-manu").slideUp();

        });
      </script>
    </header>
    <!-- headerlogined -->
    <div class="top-manu">
        <a href="###" class="current" onclick="window.history.go(-1)">返回</a>
    </div>

    <div class="white-box">
      <div class="activity-infomation-left" style=" width:100%;">
        <img class="activity-img" src="/images/banner.jpg">
        <div class="activity-info-text">
          <h3>三笔字书画专题</h3>
          <p>
            创建者：学校管理员　参与人数：1268人
            <br> 起止时间：2017-07-19 ~ 2017-09-19
            <br> 活动地点：工作室成员各自学校及学习场所
          </p>
        </div>
        <div class="clearfix"></div>
        <div class="wg-sjsc-title">
          <span>&diams;</span> 活动描述</div>
        <p class="activity-describe">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017年的教育技术专业的三笔字书画专题，请大家及时报名。无论是培训、演讲，还是大小活动，UMU企业版都能让您的活动效果升级，更有效率！在知识共享的时代，每个人的知识和经验都可以经过萃取和提炼分享给他人。使用
          UMU 提供的创新混合式互动学习方式，可以非常容易的制作图文音视频各类互动课程，同时还可以在活动学习培训现场发起调研、提问，激发相互分享，甚至使用手机进行直播。
        </p>
        <div class="wg-sjsc-title">
          <span>&diams;</span> 活动资源</div>
        <div class="activity-file">
          <a href="#">
            <img class="activity-file-icon" src="/images/word.png">
            <p>如何讲好一次说课.doc</p>
            <div class="clearfix"></div>
          </a>
          <a href="#">
            <img class="activity-file-icon" src="/images/ppt.png">
            <p>如何讲好一次说课.ppt</p>
            <div class="clearfix"></div>
          </a>
          <a href="#">
            <img class="activity-file-icon" src="/images/mp4.png">
            <p>如何讲好一次说课.mp4</p>
            <div class="clearfix"></div>
          </a>
          <a href="#">
            <img class="activity-file-icon" src="/images/mp4.png">
            <p>如何讲好一次说课.mp4</p>
            <div class="clearfix"></div>
          </a>
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="clearfix"></div>
      <ul class="activity-tesk-list">
        <div class="wg-sjsc-title">
          <span>&diams;</span> 指定任务</div>
        <li>
          <a class="activity-tesk-enter" href="SbzVideo.aspx">
            <img class="activity-tesk-icon" src="/images/activity-interaction-icon04.png">
            <p class="acitivity-tesk-type">视频</p>
            <p class="activity-tesk-name">三笔字必修视频课程</p>
            <div class="clearfix"></div>
          </a>
          <div class="acitivity-tesk-tip">
            <span>共上传10份材料</span>
            <span>已完成</span>
            <span>100积分</span>
          </div>
          <div class="clearfix"></div>
        </li>
        <li>
          <a class="activity-tesk-enter" href="SbzZuopin.aspx">
            <img class="activity-tesk-icon" src="/images/activity-tesk.png">
            <p class="acitivity-tesk-type">任务</p>
            <p class="activity-tesk-name">参赛作品上传</p>
            <div class="clearfix"></div>
          </a>
          <div class="acitivity-tesk-tip">
            <span>共上传10份材料</span>
            <span>已完成</span>
            <span>100积分</span>
          </div>
          <div class="clearfix"></div>
        </li>
        <li>
          <a class="activity-tesk-enter" href="SbzHuping.aspx">
            <img class="activity-tesk-icon" src="/images/activity-tesk.png">
            <p class="acitivity-tesk-type">任务</p>
            <p class="activity-tesk-name">同学互评</p>
            <div class="clearfix"></div>
          </a>
          <div class="acitivity-tesk-tip">
            <span>共上传10份材料</span>
            <span>已完成</span>
            <span>100积分</span>
          </div>
          <div class="clearfix"></div>
        </li>
      </ul>
    </div>

    <div class="white-box white-box-fix activity-summary">
      <div class="new-title">

        <h1>活动总结</h1>
        <div class="clearfix"></div>
      </div>
      <p>活动很圆满，同学很努力！</p>
    </div>

    <div class="white-box white-box-fix activity-analysis">
      <div class="new-title">

        <h1>作品赏析</h1>
        <div class="clearfix"></div>
      </div>
      <ul class="sbzsh-zuopin">
        <a class="zuopin-pic" href="SbzShangxi.aspx">
          <img src="/images/index-notice.png " width="240" alt="">
        </a>
        <a class="zuopin-name" href="SbzShangxi.aspx">王建业</a>
      </ul>
      <ul class="sbzsh-zuopin">
        <a class="zuopin-pic" href="SbzShangxi.aspx">
          <img src="/images/index-notice.png " width="240" alt="">
        </a>
        <a class="zuopin-name" href="SbzShangxi.aspx">王建业</a>
      </ul>
      <ul class="sbzsh-zuopin">
        <a class="zuopin-pic" href="SbzShangxi.aspx">
          <img src="/images/index-notice.png " width="240" alt="">
        </a>
        <a class="zuopin-name" href="SbzShangxi.aspx">王建业</a>
      </ul>
      <ul class="sbzsh-zuopin">
        <a class="zuopin-pic" href="SbzShangxi.aspx">
          <img src="/images/index-notice.png " width="240" alt="">
        </a>
        <a class="zuopin-name" href="SbzShangxi.aspx">王建业</a>
      </ul>
      <ul class="sbzsh-zuopin">
        <a class="zuopin-pic" href="SbzShangxi.aspx">
          <img src="/images/index-notice.png " width="240" alt="">
        </a>
        <a class="zuopin-name" href="SbzShangxi.aspx">王建业</a>
      </ul>
      <ul class="sbzsh-zuopin">
        <a class="zuopin-pic" href="SbzShangxi.aspx">
          <img src="/images/index-notice.png " width="240" alt="">
        </a>
        <a class="zuopin-name" href="SbzShangxi.aspx">王建业</a>
      </ul>
      <ul class="sbzsh-zuopin">
        <a class="zuopin-pic" href="SbzShangxi.aspx">
          <img src="/images/index-notice.png " width="240" alt="">
        </a>
        <a class="zuopin-name" href="SbzShangxi.aspx">王建业</a>
      </ul>
      <ul class="sbzsh-zuopin">
        <a class="zuopin-pic" href="SbzShangxi.aspx">
          <img src="/images/index-notice.png " width="240" alt="">
        </a>
        <a class="zuopin-name" href="SbzShangxi.aspx">王建业</a>
      </ul>
      <div class="clearfix"></div>
    </div>
    <!-- footer -->
    <footer>
      <div class="footer-top">
        <div class="container">
          <img class="footer-xiaoxun" src="/images/footer-xiaoxun.png" width="131" alt="">
          <div class="link">
            <a href="javascript:;" target="_blank">浙江省教育厅</a>
            <a href="javascript:;" target="_blank">信息公开</a>
            <a href="javascript:;" target="_blank">书记信箱</a>
            <a href="javascript:;" target="_blank">校长信箱</a>
            <a href="javascript:;" target="_blank">网络导航</a>
            <a href="javascript:;" target="_blank">本科招生</a>
            <a href="javascript:;" target="_blank">研究生招生</a>
            <a href="javascript:;" target="_blank">留学生招生</a>
            <a href="javascript:;" target="_blank">成教招生</a>
            <a href="javascript:;" target="_blank">自考招生</a>
            <a href="javascript:;" target="_blank">内部网</a>
            <a href="javascript:;" target="_blank">办事大厅</a>
            <a href="javascript:;" target="_blank">就业网</a>
            <a href="javascript:;" target="_blank">迎新网</a>
            <div class="clearfix"></div>
          </div>
          <img class="footer-code" src="/images/footer-code.png" width="66" alt="">
        </div>
      </div>
      <div class="footer-bottom">地址：浙江省金华市迎宾大道688号 邮编：321004 浙ICP备05001954号 E-Mail:webserver@zjnu.cn</div>
    </footer>
    <!-- footer -->
  </form>
</body>

</html>