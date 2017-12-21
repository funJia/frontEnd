<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workReview.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.workReview" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 作品评审 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title></title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/ThreeStrokes/common.js"></script>                 
                <script src="/js/jquery.js"></script>
                <script src="./js/business/number.js"></script>  
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/workReview.js"></script>
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />

                    <div class="top-manu">
                        <a href="###" class="current" @click="location.href='./workReviewList.aspx?id='+activityId">返回</a>
                    </div>

                    <div class="white-box">
                        <div class="new-title">
                            <p>作品评审</p>
                            <h1>{{info.ThreeStrokesName}}</h1>
                            <div class="clearfix"></div>
                        </div>
                        <div class="SbzZy-botton-box">
                            <div class="SbzZysx-box">
                                <img :src="info.Url||'/images/maobi.jpg'" />
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
                                            <input class="input-text SbzZyInput score-input" v-model="item.Score" placeholder="分数"></input>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div style="text-align:center;">
                                <button type="button" class="submit-btn SbzZySubmit" @click="addScore">提交</button>
                            </div>
                            <div class="news_comment">
                                <p>
                                    <textarea rows="3" class="news_comment_text" v-model.trim="comment.Content" placeholder="请输入点评内容"></textarea>
                                </p>
                                <p>
                                    <input name="submit" type="button" @click="setComment" class="news_comment_submit" value="评审">
                                </p>
                                <div class="clearfix"></div>
                            </div>
                            <div class="news_cmtlist" v-for="(item,index) in commentList">
                                <div class="cmttx">
                                    <img :src="item.pictureImg||'/images/tx.jpg'" alt="" />
                                </div>
                                <div class="cmtbox">
                                    <div class="cmtbox1">
                                        <span>{{getDateTime(item.CreateTime)}}</span>{{item.UserName}}</div>
                                    <div class="cmtbox2">{{item.Content}}</div>
                                    <!-- <div class="cmtbox3">
                                        <a href="#">评论</a>
                                        <a href="#">赞</a>
                                    </div> -->
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <paging @call="getCommentList" :total="total" :pageSize="pageSize"></paging>
                        </div>
                    </div>

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>