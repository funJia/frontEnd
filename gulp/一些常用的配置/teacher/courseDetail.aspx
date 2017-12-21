<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="courseDetail.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.courseDetail" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 课程详情 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title></title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/jquery.js"></script>
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/courseDetail.js"></script>
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />

                    <div class="top-manu">
                        <a class="current" href="/student/Default.aspx">返回</a>
                    </div>

                    <div class="white-box SbzVideo">
                        <div>
                            <div class="new-title">
                                <p>视频</p>
                                <h1>三笔字必修视频课程</h1>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <img src="../../images/video.jpg" width="100%">
                        <div class="clearfix"></div>

                        <div style="font-size:20px;margin:20px auto;font-weight:bold;">视频研讨：</div>
                        <!--评论模块-->
                        <div class="zan_cmtlist" v-for="(item,index) in commentList">
                            <div class="cmttx">
                                <img src="/images/tx.jpg" alt="" />
                            </div>
                            <div class="cmtbox">
                                <div class="cmtbox1">
                                    <span>
                                        <img src="/images/time-icon.png" style="width:15px;float:left; margin-right:5px; margin-top:5px;" />12:01:23</span>mico沫沫</div>
                                <div class="cmtbox2">啊啊啊啊，要实习啦！员们的到来表示欢迎，围绕地方高校转型发展与人才培养模式创新的主题，介绍了我校办学的历程、规模和目标，详细汇报我校在人才培养与师资队伍建</div>

                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <paging @call="getList" :total="100"></paging>

                        <!--评论模块-->
                    </div>


                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>