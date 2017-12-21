<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basicInfo.aspx.cs" Inherits="Web.Web.teacher.ThreeStrokes.basicInfo" %>
    <%@ Register Src="~/control/header-teacher.ascx" TagPrefix="uc1" TagName="headerteacher" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>

            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>基本信息</title>                
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/teacher.css" rel="stylesheet" type="text/css">
                <script src="/js/ThreeStrokes/common.js"></script>                                
                <script src="/js/jquery.js"></script>                
                <!--my97 日期组件-->
                <script src="/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/date.js"></script>                    
                <script src="./js/business/basicInfo.js"></script>
                <script src="http://open.web.meitu.com/sources/xiuxiu.js" type="text/javascript"></script>                                
                <style>
                    .mt-dialog {
                        position: fixed;
                        height: 100%;
                        width: 100%;
                        top: 0px;
                        left: 0px;
                        background: #000;
                        opacity: 0.4;
                        filter: alpha(opacity=40);
                        z-index: 1002;
                    }
            
                    #flashEditorOut {
                        position: fixed;
                        top: 120px;
                        left: calc((100% - 500px) / 2);
                        z-index:1003;
                    }
                </style>                
            </head>

            <body>
                <form id="vue-container">
                    <uc1:headerteacher runat="server" ID="headerteacher" />
                    <input type="hidden" id="upSett" value='<%=ViewState["xiuxiuHost"]%>'/>
                    <div class="top-manu">
                            <a href="###" class="current" onclick="window.history.go(-1)">返回</a>
                        <a :href="'index.aspx?id='+activityId">活动首页</a>
                        <a :href="'basicInfo.aspx?id='+activityId"  class="current">基本信息</a>
                        <!-- <a href="SbzResource.aspx">活动资源</a> -->
                      <%--  <a :href="'studentInfo.aspx?id='+activityId">学生管理</a>
                        <a :href="'taskInfo.aspx?id='+activityId">任务管理</a>
                        <a :href="'works.aspx?id='+activityId">作品管理</a>--%>
                      <%--  <a :href="'summary.aspx?id='+activityId">活动总结</a>--%>
                        <a :href="'workReviewList.aspx?id='+activityId">评审</a>
                    </div>
                    <div class="white-box">
                        <div class="active_info">
                            <ul>
                                <li>活动名称</li>
                                <li>
                                    <input type="text" class="input-text active_input" style="width:80%;" v-model.trim="info.activityName" />
                                </li>
                                <li>开始时间：</li>
                                <li>
                                    <input id="startTime" class="input-text active_input" type="text" v-model="info.startTime" onclick="WdatePicker({ maxDate: '#F{$dp.$D(\'endTime\')||\'2099-10-01\'}' })"
                                    />
                                </li>
                                <li>结束时间：</li>
                                <li>
                                    <input id="endTime" class="input-text active_input" type="text" v-model="info.endTime"  onclick="WdatePicker({ minDate: '#F{$dp.$D(\'startTime\')}', maxDate: '2099-10-01' })"
                                    />
                                </li>
                                <li>活动地点：</li>
                                <li>
                                    <input type="text" class="input-text active_input" style="width:80%;" v-model.trim="info.activityAddress"/>
                                </li>
                                <li>活动封面：</li>
                                <li>
                                    <img :src="info.logoImage||'/images/index-notice.png'" width="200" style=" float:left;" />
                                    <a href="#" id="A1" class="input-btn blue-btn" style=" float:left; margin-left:10px;" @click="upImg">更换图片</a>
                                    <input id="file" type="file" accept="image/*" v-show="false" />
                                    <div class="clearfix"></div>
                                </li>

                                <li>活动描述：</li>
                                <li>
                                    <textarea name="textarea" id="textarea" cols="45" rows="5" class="input-textarea" v-model.trim="info.intro" style="width:90%;"></textarea>
                                </li>
                                <li></li>
                                <li>
                                    <a href="#" id="create-file" class="resource_addbtn" @click="save">保存修改</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div v-show="showUpImg" class="mt-dialog">     </div>
                        <div id="flashEditorOut"  v-show="showUpImg">
                            <div id="altContent2">
                                <h1>美图秀秀</h1>
                            </div>
                        </div>

                        <script>
                            ; (function (document, callback) {
                                var file = document.getElementById('file');

                                file.onchange = function () {
                                    var file = this.files[0];
                                    if (/image\/\w+/.test(file.type)) {
                                        var regexp = /^data:image\/.*;base64,/;
                                        var reader = new FileReader();
                                        reader.readAsDataURL(file);
                                        reader.onload = function () {
                                            callback(this.result.replace(regexp, ''))
                                            reader.onload = null;
                                        };
                                    };
                                };
                            })(document, function (base64) {

                                xiuxiu.loadPhoto(base64, true)

                            });
                        </script>
               

                    <uc1:footer runat="server" ID="footer" />
                </form>
            </body>

            </html>