<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workReviewList.aspx.cs" Inherits="Web.Web.student.ThreeStrokes.workReviewList" %>
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
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/workReviewList.js" charset="gbk"></script>
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
                            <a href="###" class="current" onclick="window.history.go(-1)">返回</a>
                        </div>
                        <div class="white-box white-box-min SbzVideo">
                            <div>
                                <div class="new-title">
                                    <p>任务</p>
                                    <h1>同学互评</h1>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                            <div class="active_task_result">

                                <!-- <div class="subsearch">
                                    <input name="textfield" type="text" class="input-text" v-model.trim="keywords" value="请输入关键字">
                                    <input type="button" name="button2" id="button2" value="搜索" @click="search" class="input-btn">
                                    <div class="clearfix"></div>
                                </div> -->
                                <table class="wg-list" width="100%">
                                    <tbody>
                                        <tr>
                                            <!-- <th width="50">
                                                <input type="checkbox">
                                            </th> -->
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

                        </div>

                        <uc1:footer runat="server" ID="footer" />
                    </form>
                </div>
            </body>

            </html>