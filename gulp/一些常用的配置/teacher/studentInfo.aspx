<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentInfo.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.studentInfo" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>
            <!-- 学生管理 -->
            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>学生管理</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/jquery.js"></script>

                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/studentInfo.js"></script>
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />

                    <div class="top-manu">
                        <a class="current" href="/teacher/">返回</a>
                        <a href="index.aspx">活动首页</a>
                        <a href="basicInfo.aspx">基本信息</a>
                        <!-- <a href="SbzResource.aspx">活动资源</a> -->
                        <a href="studentInfo.aspx" class="current">学生管理</a>
                        <a href="taskInfo.aspx">任务管理</a>
                        <a href="works.aspx">作品管理</a>
                        <a href="summary.aspx">活动总结</a>
                        <a href="workReviewList.aspx">评审</a>
                    </div>

                    <div class="white-box white-box-min sx-xsgl">
                        <div class="search-box">
                            <span>所属学院</span>
                            <select></select>
                            <span>所属班级</span>
                            <select></select>
                            <span>所属小组</span>
                            <select></select>
                            <span>学生姓名</span>
                            <input class="input-text" type="text">
                            <input class="input-btn" type="button" value="搜索">
                        </div>
                        <table class="wg-list" width="100%">
                            <tr>
                                <tr>
                                    <th width="50">
                                        <input type="checkbox">
                                    </th>
                                    <th>学生姓名</th>
                                    <th>学院</th>
                                    <th>班级</th>
                                    <th>小组</th>
                                    <th>完成情况</th>
                                    <th>活跃度</th>
                                    <th>高校/中学/总成绩</th>
                                    <th>操作</th>
                                </tr>
                                <tr align="center" v-for="(item,index) in dataList">
                                    <td>
                                        <input class="input-checkbox" type="checkbox">
                                    </td>
                                    <td>诸葛垚</td>
                                    <td>行知学院</td>
                                    <td>教育技术17-02班</td>
                                    <td>小组1</td>
                                    <td>6/10</td>
                                    <td>200</td>
                                    <td>97/96/98</td>
                                    <td>
                                        <input class="table-btn" id="create-file01" type="button" value="打分" @click="setScore(item.ID)">
                                    </td>
                                </tr>
                                </tobdy>
                        </table>
                        <paging @call="getList" :total="100"></paging>
                    </div>
                    <div id="mask" class="mask" style="width:100%;height:100%" v-show="showDialog" @click="showDialog=false"></div>
                    <!--弹出层-->
                    <div id="popup_box01" class="popup_box sx-dafen" style="position:fixed;top: 200px;left: calc((100% - 500px) / 2);display:block;"
                        v-show="showDialog">
                        <div class="pop_title">
                            <span class="close" id="close" name="close" @click="showDialog=false">
                                <img src="/images/close.png" />
                            </span>打分</div>
                        <div class="pop_cont sx-dafen">
                            <table class="wg-list" width="94%">
                                <tbody>
                                    <tr>
                                        <th width="50%">教育实习考核指标</th>
                                        <th width="25%">分值</th>
                                        <th>评分</th>
                                    </tr>
                                    <tr align="center" v-for="(item,index) in socreProject">
                                        <td>个人实习计划</td>
                                        <td>10</td>
                                        <td>
                                            <input class="input-text SbzZyInput" type="text" v-model="item.sorce" placeholder="请输入分数">
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td colspan="2">得分</td>
                                        <td>10</td>
                                    </tr>
                                </tbody>
                            </table>
                            <input class="input-btn" type="submit" value="保存">
                        </div>
                    </div>
                    <!--弹出层-->

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>