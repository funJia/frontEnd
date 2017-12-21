<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="works.aspx.cs" Inherits="Web.Web.student.ThreeStrokes.works" %>

    <%@ Register Src="~/control/header-logined.ascx" TagPrefix="uc1" TagName="headerlogined" %>
        <%@ Register Src="~/control/footer.ascx" TagPrefix="uc1" TagName="footer" %>



            <!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">

            <head id="Head1" runat="server">
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>上传作品</title>
                <link href="/css/common.css" rel="stylesheet" type="text/css">
                <link href="/css/student.css" rel="stylesheet" type="text/css">
                <script src="/js/ThreeStrokes/common.js"></script>                 
                <script src="/js/jquery.js"></script>
                <script src="/js/popup.js"></script>
                <script src="./js/artTemplate/vue.min.js"></script>
                <script src="./js/business/components.js"></script>
                <script src="./js/business/works.js" charset="gbk"></script>
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

                    .edit-info {
                        position: fixed;
                        top: 120px;
                        width: 500px;
                        height: 488px;
                        left: calc((100% - 500px) / 2);
                    }

                    .SbzBjFloat {
                        height: auto;
                        overflow-y: auto;
                    }

                    #flashEditorOut {
                        position: fixed;
                        z-index: 1003;
                        top: 120px;
                        left: calc((100% - 500px) / 2);
                    }

                    .my-file-list {
                        position: fixed;
                        z-index: 1004;
                        top: 120px;
                        left: calc((100% - 930px) / 2);
                        background-color: #fff;
                        padding: 10px;
                        height: 500px;
                        overflow: auto;
                    }

                    .my-file-list .disk_fav {
                        height: 20px;
                        padding: 8px;
                        border-bottom: solid 1px #ddd;
                    }

                    .disk_fav .col_6 {
                        width: 160px;
                        float: right;
                        margin-top: 0;
                    }

                    .disk_fav .col_6 a {
                        float: none;
                        margin-right: 22px;
                        text-align: center;
                    }

                    .disk_fav .col_3 {
                        width: 600px;
                        float: left;
                        font-size: 16px;
                        overflow: hidden;
                    }

                    .up-file {
                        margin-top: 10px;
                        margin-bottom: 10px;
                    }

                    .file-list-head{
                        position:relative;
                    }

                    .file-list-close{
                        position:absolute;
                        right:0px;
                        cursor:pointer;
                    }

                    textarea {
                        vertical-align: bottom;
                    }

                    [v-cloak] {
                        display: none;
                    }
                </style>

            </head>

            <body>
                <div id="vue-container" v-cloak>
                    <form id="Form1" runat="server">
                        <input type="hidden" id="upSett" value='<%=ViewState["xiuxiuHost"]%>' />
                        <uc1:headerlogined runat="server" ID="headerlogined" />
                        <div class="top-manu">
                            <a href="###" class="current" onclick="window.history.go(-1)">返回</a>
                        </div>
                        <div class="white-box">
                            <div class="new-title">
                                <p>任务</p>
                                <h1>参赛作品上传</h1>
                                <div class="clearfix"></div>
                            </div>
                            <div class="Sbz-botton-box">
                                <button type="button" class="Sbz-button" @click="showEdit=true">添加作品</button>
                                <input id="file" type="file" accept="image/*" v-show="false" />
                                <!-- <upload-img @call="upImg" ref="up" v-show="false"></upload-img> -->
                                <!-- <button type="button" class="Sbz-button">从云盘中选择</button> -->
                                <div class="clearfix"></div>
                            </div>

                            <div class="Sbz-box">
                                <ul class="SbzBj-box" v-for="(item,index) in dateList">
                                    <li>
                                        <img :src="item.URL||'/images/index-notice.png'" alt="">
                                    </li>
                                    <li>作品名称：{{item.ThreeStrokesName}}</li>
                                    <li>作品描述：{{item.Intro}}</li>
                                    <li>
                                        <a class="SbzBj-title" href="#" @click="del(item.ID)">删除</a>
                                        <a class="SbzBj-title" href="#" @click="edit(item)">编辑</a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                                <paging @call="getList" :total="total" :pageSize="pageSize"></paging>
                            </div>

                        </div>

                        <!--弹出层-->
                        <div class="mt-dialog" v-show="showEdit" v-cloak></div>
                        <div class="edit-info popup_box Sbz-floatbox" style="display:block" v-show="showEdit">
                            <div class="pop_title">
                                <span class="close" id="close" @click="showEdit=false">
                                    <img src="/images/close.png" />
                                </span>作品编辑</div>
                            <div class="SbzBjFloat">
                                <ul class="SbzBj-floatbox">
                                    <li>
                                        <img :src="info.URL||'/images/index-notice.png'" alt="">
                                        <div class="up-file">
                                            <a href="#" id="A1" class="input-btn blue-btn" style=" float:left; margin-left:10px;" @click="showUpImg=true;">本地上传</a>
                                            <a href="#" id="A2" class="input-btn blue-btn" style=" float:left; margin-left:10px;" @click="showFileList=true">从云盘选</a>
                                        </div>
                                    </li>
                                    <li>作品名称：
                                        <input class="input-text Sbz-input" v-model.trim="info.ThreeStrokesName" placeholder="请输入照片名称:"></input>
                                    </li>
                                    <li>作品描述：
                                        <input class="input-text Sbz-input" v-model.trim="info.Intro" placeholder="请输入照片描述:"></input>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="SbzBj-box">
                                <input type="button" name="button2" id="save-btn" @click="save" value="保存上传" class="Sbz-button">
                                <input type="button" name="cancel" id="cancel" @click="cancle" value="取消" class="Sbz-button">

                            </div>
                        </div>


                        <%--    <div class="mt-dialog">--%>
                            <div id="flashEditorOut" v-show="showUpImg" v-cloak>
                                <div id="altContent2">
                                    <h1>美图秀秀</h1>
                                </div>
                            </div>
                            <div class="diskright my-file-list" v-show="showFileList">
                                <div class="subtit file-list-head">云盘文件列表
                                    <span class="close file-list-close" id="close" @click="showFileList=false">
                                        <img src="/images/close.png" />
                                    </span>
                                </div>
                                <!-- <div class="subsearch">
                                    <input name="textfield" type="text" class="input-text" id="text1" placeholder="请输入关键字">
                                    <input type="submit" name="button2" id="Submit1" value="搜索" class="input-btn">
                                    <div class="clearfix"></div>
                                </div> -->

                                <div class="disk_fav_row1">
                                    <div class="col_3">资源名称</div>
                                    <div class="col_6">操作</div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="disk_fav" v-for="(item,index) in fileList">
                                    <div class="col_3">
                                        <div>{{item.fileName}}</div>
                                    </div>
                                    <div class="col_6">
                                        <a href="#" @click="downImg(item.fileId)">下载</a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <paging @call="getFileList" :total="fileTotal" :page-size="filePageSize"></paging>
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
                            <%--   </div>--%>
                                <!--弹出层-->
                                <uc1:footer runat="server" ID="footer" />
                    </form>
                </div>
            </body>

            </html>