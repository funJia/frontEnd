<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="summary.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.summary" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 活动总结 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>活动总结</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/jquery.js"></script>

                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/summary.js"></script>
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />
                    <div class="top-manu">
                            <a href="###" class="current" onclick="window.history.go(-1)">返回</a>
                            <a :href="'index.aspx?id='+activityId">活动首页</a>
                            <a :href="'basicInfo.aspx?id='+activityId">基本信息</a>
                            <!-- <a href="SbzResource.aspx">活动资源</a> -->
                          <%--  <a :href="'studentInfo.aspx?id='+activityId">学生管理</a>
                            <a :href="'taskInfo.aspx?id='+activityId">任务管理</a>
                            <a :href="'works.aspx?id='+activityId">作品管理</a>--%>
                            <a :href="'summary.aspx?id='+activityId"  class="current">活动总结</a>
                            <a :href="'workReviewList.aspx?id='+activityId">评审</a>
                        </div>       

                    <div class="white-box white-box-min">
                        <div class="active_info">
                            <ul>
                                <li>
                                    <textarea name="textarea" id="textarea" cols="45" rows="10" v-model.trim="summary" class="input-textarea" style="width:98%;" placeholder="请在此填写本次活动的总结内容吧！"></textarea>
                                </li>
                                <li>
                                    <input class="input-btn" type="button" value="保存修改" @click="save">
                                </li>
                            </ul>
                        </div>
                    </div>

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>