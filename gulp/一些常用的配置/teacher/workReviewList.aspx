<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workReviewList.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.workReviewList" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 评审 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>评审</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/ThreeStrokes/common.js"></script>
                <script src="/js/jquery.js"></script>

                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/workReviewList.js"></script>
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
                            <%--  <a :href="'summary.aspx?id='+activityId">活动总结</a>--%>
                                <a :href="'workReviewList.aspx?id='+activityId" class="current">评审</a>
                    </div>

                    <div class="white-box white-box-min SbzVideo">

                        <div class="subsearch">
                            <!-- 作品类型：
                            <select name="select" id="select1" style="width:100px;" v-model="type">
                                <option value="-1">全部</option>
                                <option value="0">粉笔字</option>
                                <option value="1">硬笔字</option>
                                <option value="2">毛笔字</option>
                                <option value="3">简笔画</option>
                            </select> -->
                            <!-- <input name="textfield" type="text" class="input-text" id="keyword" v-model.trim="keyword" placeholder="请输入作品名称">
                            <input type="button" name="button2" id="button2" value="搜索" class="input-btn" @click="search"> -->
                            <div class="clearfix"></div>
                        </div>
                        <table class="wg-list" width="100%">
                            <tbody>
                                <tr>
                                    <th>作品编号</th>
                                    <th>作品名称</th>
                                    <th>作品类型</th>
                                    <th>评审状态</th>
                                    <th width=" 20%">操作</th>
                                </tr>
                                <tr align="center" v-for="(item,index) in dataList">
                                    <td>{{item.ID}}</td>
                                    <td>{{item.ThreeStrokesName}}</td>
                                    <td>{{'--'}}</td>
                                    <td>{{item.State}}</td>
                                    <td>
                                        <input v-if="item.State=='未评审'" class="table-btn" type="button" value="评审" @click="location.href ='workReview.aspx?id='+item.ID+'&activityId='+item.activityId">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <paging @call="getList" :total="total" :pageSize="pageSize"></paging>
                    </div>

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>