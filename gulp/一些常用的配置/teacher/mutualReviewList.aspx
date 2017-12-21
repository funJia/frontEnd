<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mutualReviewList.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.mutualReviewList" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 同学互评列表 -->
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
                <script src="./js/business/mutualReviewList.js"></script>
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />

                    <div class="top-manu">
                        <a href="SbzZuopin.aspx" class="current">返回</a>
                    </div>

                    <div class="white-box SbzVideo">
                        <div class="new-title">
                            <p>任务</p>
                            <h1>同学互评成绩</h1>

                            <div class="clearfix"></div>
                        </div>

                        <div class="subsearch">
                            作品类型：
                            <select name="select" id="select1" style="width:100px;" v-model="type">
                                <option value="-1">全部</option>
                                <option value="0">粉笔字</option>
                                <option value="1">硬笔字</option>
                                <option value="2">毛笔字</option>
                                <option value="3">简笔画</option>
                            </select>
                            <input name="textfield" type="text" class="input-text" id="keyword" v-model="keyword" placeholder="请输入关键字">
                            <input type="button" name="button2" id="button2" value="搜索" class="input-btn" @click="search">
                            <div class="clearfix"></div>
                        </div>
                        <table class="wg-list" width="100%">
                            <tbody>
                                <tr>
                                    <th width="50">
                                        <input type="checkbox">
                                    </th>
                                    <th>姓名</th>
                                    <th>作品名称</th>
                                    <th>作品类型</th>
                                    <th>互评状态</th>
                                    <th width=" 20%">成绩</th>
                                </tr>
                                <tr align="center" v-for="(item,index) in dataList">
                                    <td>
                                        <input type="checkbox">
                                    </td>
                                    <td>李一</td>
                                    <td>沁园春·雪</td>
                                    <td>硬笔字</td>
                                    <td>5/5</td>
                                    <td>
                                        86
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <paging @call="getList" :total="100"></paging>
                    </div>

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>