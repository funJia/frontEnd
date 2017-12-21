<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mutualReview.aspx.cs" Inherits="Web.Web.student.ThreeStrokes.mutualReview" %>

<%@ Register Src="~/control/header-logined.ascx" TagPrefix="uc1" TagName="headerlogined" %>
<%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>实习</title>
    <link href="/css/common.css" rel="stylesheet" type="text/css">
    <link href="/css/student.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery.js"></script>
    <script src="./js/artTemplate/es5-shim.min.js"></script>
    <script src="./js/artTemplate/es5-sham.min.js"></script>
    <script src="./js/artTemplate/json3.min.js"></script>
    <script src="./js/artTemplate/template-web.js"></script>
    <script src="./es6/buildTemplate.js"></script>
    <script src="./js/business/template.min.js?v=0ead09cf40"></script>
    <script src="./js/business/load.min.js?v=2d99d5924e"></script>
    <script src="./js/business/enum.min.js?v=47ef34bfe3"></script>
    <script src="./js/business/mutualReview.min.js?v=dcde2622c3"></script>
    <script src="./js/business/temp.min.js?v=242144b698"></script>

    <!-- <script>
        $(function () {
            var _sbzLoad = window.sbzLoad();
            _sbzLoad.render();
        })
    </script> -->
</head>

<body>
    <form id="form1" runat="server">
        <uc1:headerlogined runat="server" id="headerlogined" />
        <div class="top-manu">
            <a href="Default.aspx" class="current">返回</a>
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

                <div class="subsearch">
                    全部：
                    <select name="select" id="select" style="width: 100px;">
                        <option value="1">全部</option>
                    </select>
                    毛笔字：
                    <select name="select" id="select1" style="width: 100px;">
                        <option value="1">毛笔字</option>
                    </select>
                    <input name="textfield" type="text" class="input-text" id="textfield" value="关键字">
                    <input type="submit" name="button2" id="button2" value="搜索" class="input-btn">
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
                    </tbody>
                    <tbody id="list">
                    </tbody>
                </table>
                <div class="pager">
                    <a href="#">首页</a>
                    <a href="#">上一页</a>
                    <a href="#">下一页</a>
                    <a href="#">尾页</a>
                    <p class="sc_txt">页码：1/15</p>
                    <p class="sc_txt">到第</p>
                    <input type="text" class="sc_page" />
                    <p class="sc_txt">页</p>
                    <input type="submit" name="button" id="button" value="跳转" class="sc_submit">
                    <div class="clearfix"></div>
                </div>

            </div>

        </div>

        <uc1:footer runat="server" ID="footer" />       
    </form>
</body>

</html>
