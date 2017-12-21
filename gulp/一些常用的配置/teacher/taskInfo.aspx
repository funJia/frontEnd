<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="taskInfo.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.taskInfo" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 任务管理 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>任务管理</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/jquery.js"></script>

                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/taskInfo.js"></script>
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />

                    <div class="top-manu">
                        <a class="current" href="/teacher/">返回</a>
                        <a href="index.aspx">活动首页</a>
                        <a href="basicInfo.aspx">基本信息</a>
                        <!-- <a href="SbzResource.aspx">活动资源</a> -->
                        <a href="studentInfo.aspx">学生管理</a>
                        <a href="taskInfo.aspx" class="current">任务管理</a>
                        <a href="works.aspx">作品管理</a>
                        <a href="summary.aspx">活动总结</a>
                        <a href="workReviewList.aspx">评审</a>
                    </div>

                    <div class="white-box white-box-min">
                        <ul class="activity-tesk-list">
                            <li v-for="(item,index) in courseList">
                                <a class="activity-tesk-enter" href="SbzVideo.aspx">
                                    <img class="activity-tesk-icon" src="/images/activity-tesk.png">
                                    <p class="acitivity-tesk-type">视频</p>
                                    <p class="activity-tesk-name">{{item.courseName}}</p>
                                    <div class="clearfix"></div>
                                </a>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <a class="activity-tesk-enter" href="SbzZuopin.aspx">
                                    <img class="activity-tesk-icon" src="/images/activity-tesk.png">
                                    <p class="acitivity-tesk-type">任务</p>
                                    <p class="activity-tesk-name">参赛作品上传</p>
                                    <div class="clearfix"></div>
                                </a>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <a class="activity-tesk-enter" href="SbzHuping.aspx">
                                    <img class="activity-tesk-icon" src="/images/activity-tesk.png">
                                    <p class="acitivity-tesk-type">任务</p>
                                    <p class="activity-tesk-name">同学互评</p>
                                    <div class="clearfix"></div>
                                </a>
                                <div class="clearfix"></div>
                            </li>
                        </ul>
                    </div>

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>