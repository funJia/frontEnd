<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workDetail.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.workDetail" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 作品详情 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title></title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/jquery.js"></script>

                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/workDetail.js"></script>
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />

                    <div class="top-manu">
                        <a href="SbzZuopin.aspx" class="current">返回</a>
                    </div>
                    <div class="white-box">
                        <div class="new-title">
                            <p>作业</p>
                            <h1>三笔字书画</h1>
                            <div class="clearfix"></div>
                        </div>
                        <div class="SbzZy-botton-box">
                            <div class="SbzZy-box1">
                                <p class="SbzZy-title">总投票数：12345票</p>
                                <p class="SbzZy-title">
                                    <button type="button" @click="vote" class="input-btn SbzZy-botton" style="float:left;margin-top:10px;">投票</button>
                                    <button type="button" @click="unRecommend" class="input-btn SbzZy-botton" style="float:left;margin-top:10px;">取消推荐</button>
                                    <button type="button" @click="recommend" class="input-btn SbzZy-botton" style="float:left;margin-top:10px;">推荐到作品赏析</button>
                                </p>
                                <div class="clearfix"></div>
                            </div>
                            <div class="SbzZysx-box">
                                <img src="/images/maobi.jpg" />
                            </div>
                        </div>
                    </div>

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>