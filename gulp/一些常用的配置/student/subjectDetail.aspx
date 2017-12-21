<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subjectDetail.aspx.cs" Inherits="Web.Web.student.ThreeStrokes.subjectDetail" %>

    <%@ Register Src="~/control/header.ascx" TagPrefix="uc1" TagName="headerlogined" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>



            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head id="Head1" runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>专题详情</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/student.css" rel="stylesheet" type="text/css">
                <script src="/js/ThreeStrokes/common.js"></script>                 
                <script src="/js/jquery.js"></script>
                <script src="/js/popup.js"></script>
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/date.js"></script>
                <script src="./js/business/subjectDetail.js"></script>


            </head>

            <body>
                <div id="vue-container">
                    <form runat="server">
                        <uc1:headerlogined runat="server" ID="headerlogined" />
                        <div class="top-manu">
                            <a href="###" class="current" onclick="window.history.go(-1)">返回</a>
                        </div>
                        <div class="white-box">
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
                            <ul class="activity-tesk-list">
                                <div class="wg-sjsc-title">
                                    <span>&diams;</span> 指定任务</div>
                                <li v-for="(item,index) in courseList">
                                    <a class="activity-tesk-enter" :href="item.Url||'###'" target="_blank">
                                        <img class="activity-tesk-icon" src="/images/activity-interaction-icon04.png">
                                        <p class="acitivity-tesk-type">视频</p>
                                        <p class="activity-tesk-name">{{item.CourseName}}</p>
                                        <div class="clearfix"></div>
                                    </a>
                                    <!-- <div class="acitivity-tesk-tip">
                                        <span>共上传10份材料</span>
                                        <span>已完成</span>
                                        <span>100积分</span>
                                      </div> -->
                                    <div class="clearfix"></div>
                                </li>
                                <li>
                                    <a class="activity-tesk-enter" :href="'works.aspx?id='+activityId">
                                        <img class="activity-tesk-icon" src="/images/activity-tesk.png">
                                        <p class="acitivity-tesk-type">任务</p>
                                        <p class="activity-tesk-name">参赛作品上传</p>
                                        <div class="clearfix"></div>
                                    </a>
                                    <!-- <div class="acitivity-tesk-tip">
                                        <span>共上传10份材料</span>
                                        <span>已完成</span>
                                        <span>100积分</span>
                                      </div> -->
                                    <div class="clearfix"></div>
                                </li>
                                <li>
                                    <a class="activity-tesk-enter" :href="'workReviewList.aspx?id='+activityId">
                                        <img class="activity-tesk-icon" src="/images/activity-tesk.png">
                                        <p class="acitivity-tesk-type">任务</p>
                                        <p class="activity-tesk-name">同学互评</p>
                                        <div class="clearfix"></div>
                                    </a>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </div>

                        <div class="white-box white-box-fix activity-summary">
                            <div class="new-title">

                                <h1>活动总结</h1>
                                <div class="clearfix"></div>
                            </div>
                            <p>{{info.activitySummarize||'--'}}</p>
                        </div>

                        <div class="white-box white-box-fix activity-analysis">
                            <div class="new-title">

                                <h1>优秀案例</h1>
                                <div class="clearfix"></div>
                            </div>
                            <ul class="sbzsh-zuopin" v-for="(item,index) in worksList">
                                <a class="zuopin-pic" :href="'workDetail.aspx?id='+item.ID">
                                    <img :src="item.URL||'/images/index-notice.png'" width="240" alt="">
                                </a>
                                <a class="zuopin-name" href="###">{{item.ThreeStrokesName}}</a>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <uc1:footer runat="server" ID="footer" />
                    </form>
                </div>
            </body>

            </html>