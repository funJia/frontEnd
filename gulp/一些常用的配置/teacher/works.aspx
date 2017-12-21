<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="works.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.works" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 作品管理 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>作品管理</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/jquery.js"></script>

                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/works.js"></script>
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />

                    <div class="top-manu">
                        <a class="current" href="/teacher/">返回</a>
                        <a href="index.aspx">活动首页</a>
                        <a href="basicInfo.aspx">基本信息</a>
                        <!-- <a href="SbzResource.aspx">活动资源</a> -->
                        <a href="studentInfo.aspx">学生管理</a>
                        <a href="taskInfo.aspx">任务管理</a>
                        <a href="works.aspx" class="current">作品管理</a>
                        <a href="summary.aspx">活动总结</a>
                        <a href="workReviewList.aspx">评审</a>
                    </div>

                    <div class="white-box white-box-min">

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
                                    <th>序号</th>
                                    <th>作品名称</th>
                                    <th>作品类型</th>
                                    <th>状态</th>
                                    <th width=" 20%">操作</th>
                                </tr>
                                <tr align="center" v-for="(item,index) in dataList">
                                    <td>
                                        <input type="checkbox">
                                    </td>
                                    <td>{{index}}</td>
                                    <td>沁园春·雪</td>
                                    <td>硬笔字</td>
                                    <td>已推荐</td>
                                    <td>
                                        <input class="table-btn" type="button" value="推荐" @click="recommend" />
                                        <input class="table-btn" type="button" value="取消推荐" @click="unRecommend " />
                                        <input class="table-btn" type="button" value="查看" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="disk_btnbox">
                            <a href="#" class="move" @click="recommends">推荐到作品赏析</a>
                            <a href="#" class="del" @click="unRecommends">取消推荐</a>
                        </div>
                        <paging @call="getList" :total="100"></paging>
                    </div>

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>