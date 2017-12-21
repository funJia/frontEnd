<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.index" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 活动首页 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>活动首页</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/ThreeStrokes/common.js"></script>                 
                <script src="/js/jquery.js"></script>
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/index.js"></script>
                <script src="./js/business/date.js"></script>                
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />

                    <div class="top-manu">
                            <a href="###" class="current" onclick="window.history.go(-1)">返回</a>
                            <a :href="'index.aspx?id='+activityId" class="current">活动首页</a>
                            <a :href="'basicInfo.aspx?id='+activityId">基本信息</a>
                            <!-- <a href="SbzResource.aspx">活动资源</a> -->
                           <%-- <a :href="'studentInfo.aspx?id='+activityId">学生管理</a>
                            <a :href="'taskInfo.aspx?id='+activityId">任务管理</a>
                            <a :href="'works.aspx?id='+activityId">作品管理</a>
                            <a :href="'summary.aspx?id='+activityId">活动总结</a>--%>
                            <a :href="'workReviewList.aspx?id='+activityId">评审</a>
                        </div>

                    <div class="white-box white-box-min">
                        <div class="activity-infomation-left" style=" width:100%;">
                            <img class="activity-img" :src="info.logoImage||'/images/banner.jpg'">
                            <div class="activity-info-text">
                                <h3>{{info.activityName||'--'}}</h3>
                                <p>
                                    创建者：{{info.userName}}
                                    <br> 起止时间：{{info.startTime||'--'}} ~ {{info.endTime||'--'}} 
                                    <br> 活动地点：{{info.activityAddress||'--'}}
                                </p>
                            </div>
                            <div class="clearfix"></div>
                            <div class="wg-sjsc-title">
                                <span>&diams;</span> 活动描述</div>
                            <p class="activity-describe">
                                {{info.activityAddress||'--'}}
                            </p>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>