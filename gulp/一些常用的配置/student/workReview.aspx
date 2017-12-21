<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workReview.aspx.cs" Inherits="Web.Web.student.ThreeStrokes.workReview" %>
    <%@ Register Src="~/control/header-logined.ascx" TagPrefix="uc1" TagName="headerlogined" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>

            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>同学互评</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/student.css" rel="stylesheet" type="text/css">
                <script src="/js/ThreeStrokes/common.js"></script>                 
                <script src="/js/jquery.js"></script>
                <script src="./js/business/number.js"></script>                      
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/workReview.js"></script>
                <style>
                    [v-cloak] {
                        display: none;
                    }
                </style>
            </head>

            <body>
                <div id="vue-container" v-cloak>
                    <form id="form1" runat="server">
                        <uc1:headerlogined runat="server" ID="headerlogined" />
                        <div class="top-manu">
                            <a href="###" class="current" @click="location.href='./workReviewList.aspx?id='+activityId">返回</a>
                        </div>
                        <div class="white-box">
                            <div class="new-title">
                                <p>作业</p>
                                <h1>{{info.ThreeStrokesName}}</h1>
                                <div class="clearfix"></div>
                            </div>
                            <div class="SbzZy-botton-box" style="margin-left:20px">
                                <div>
                                    <img class="SbzZysx-box" :src="info.URL||'/images/sbz-pic.jpg'">
                                </div>
                                <table width="100%" class="wg-list">
                                    <tbody>
                                        <tr>
                                            <th>序号</th>
                                            <th>打分项目</th>
                                            <th>单项分数</th>                                             
                                            <th>分数</th>                                           
                                        </tr>
                                        <tr align="center" v-for="(item,index) in items">
                                            <td>{{index+1}}</td>
                                            <td>{{item.ProjectName}}</td>
                                            <td>{{item.MaxScore}}</td>                                            
                                            <td>得分：
                                                <input class="input-text SbzZyInput score-input" v-model="item.Score" placeholder="分数："></input>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div style="text-align:center;">
                                    <button type="button" class="submit-btn SbzZySubmit" @click="addScore">提交</button>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <uc1:footer runat="server" ID="footer" />
                    </form>
                </div>
            </body>

            </html>