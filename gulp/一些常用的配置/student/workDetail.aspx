<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workDetail.aspx.cs" Inherits="Web.Web.student.ThreeStrokes.workDetail" %>
    <%@ Register Src="~/control/header-logined.ascx" TagPrefix="uc1" TagName="headerlogined" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>作品详情</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/student.css" rel="stylesheet" type="text/css">
                <script src="/js/ThreeStrokes/common.js"></script>                 
                <script src="/js/jquery.js"></script>
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/date.js"></script>
                <script src="./js/business/workDetail.js"></script>
                <style>
                    [v-cloak] {
                        display: none;
                    }
                </style>
            </head>

            <body>
                <div id="vue-container" v-cloak>
                    <form id="form1" runat="server">
                        <div class="top-manu">
                            <a href="###" class="current" onclick="window.history.go(-1)">返回</a>
                        </div>
                        <div class="white-box">
                            <div class="new-title">
                                <p>作业</p>
                                <h1>{{info.ThreeStrokesName||'--'}}</h1>
                                <div class="clearfix"></div>
                            </div>
                            <div class="SbzZy-botton-box">
                                <!-- <div>
                                <button type="botton" class="input-btn SbzZy-botton">成果1</button>
                                <button type="button" class="input-btn SbzZy-botton">成果2</button>
                                <div class="clearfix"></div>
                            </div> -->
                                <div class="SbzZy-box">
                                    <img :src="info.URL||'/images/111.jpg'" alt="" style="width:100%;" />
                                </div>
                            </div>
                            <div class="SbzZy-box1">
                                <p class="SbzZy-title">总投票数：{{info.PollSum||0}}票</p>
                                <p class="SbzZy-title">
                                    <button type="button" class="input-btn SbzZy-botton" @click="poll()" style="float:left;margin-top:10px;">投票</button>
                                </p>
                            </div>
                            <div class="clearfix"></div>

                            <!--评论模块-->
                            <div class="news_comment">
                                <p>
                                    <textarea rows="3" class="news_comment_text" v-model.trim="comment.Content"></textarea>
                                </p>
                                <p>
                                    <input name="submit" type="button" class="news_comment_submit" @click="setComment" value="评论">
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
                                    <div class="cmtbox2">
                                        {{item.Content}}
                                    </div>
                                    <!-- <div class="cmtbox3">
                                    <a href="#">评论</a>
                                    <a href="#">赞</a>
                                </div> -->
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <paging @call="getCommentList" :total="total" :pageSize="pageSize"></paging>

                            <!--评论模块-->


                        </div>
                        <uc1:footer runat="server" ID="footer" />
                    </form>
                </div>
            </body>

            </html>