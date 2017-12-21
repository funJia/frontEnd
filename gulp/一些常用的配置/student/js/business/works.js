class Works {
    static initTable(option) {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    showEdit: false,
                    showUpImg: false,
                    showFileList: false,
                    activityId: null,
                    apiUrl: {
                        upLoadImg: '/Web/teacher/ThreeStrokes/basicInfo.aspx',
                        getList: '/Web/student/ThreeStrokes/works.aspx?Action=GetData',
                        getFileList: '/Web/student/ThreeStrokes/works.aspx?Action=GetMyFile',
                        add: '/Web/student/ThreeStrokes/works.aspx?Action=Add',
                        edit: '/Web/student/ThreeStrokes/works.aspx?Action=Edit',
                        del: '/Web/student/ThreeStrokes/works.aspx?Action=Delete',
                        downImg:'/Web/student/ThreeStrokes/works.aspx?Action=DownImg'
                    },
                    dateList: [],
                    fileList: [],
                    fileTotal: 0,
                    filePageSize: 5,
                    total: 0,
                    pageSize: 20,
                    currentIndex: 1,
                    info: {
                        ID: null,
                        URL: null,
                        ThreeStrokesName: null,
                        Intro: null
                    }
                }
            },
            watch: {
                "showUpImg"(newVal) {
                    if (newVal) {

                        this.initXiuxiu();
                    }
                    else {

                    }
                },
                "showFileList"(newVal) {
                    if (newVal) {
                        this.getFileList({ pageIndex: 1, pageSize: this.filePageSize });
                    }
                    else {

                    }
                }
            },
            methods: {
                upImg(data) {
                    console.log(data);
                },
                getUrlParams(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURIComponent(r[2]); return null;
                },
                getList(page) {
                    var that = this;
                    $.get(this.apiUrl.getList, {
                        activityId: this.activityId,
                        page: page.pageIndex,
                        pagesize: page.pageSize
                    }, function (res) {
                        try {
                            if (res) {
                                that.dateList = res.Rows;
                                that.total = res.Total;
                                that.currentIndex = page.pageIndex;
                            }
                            else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                        }
                    }, 'json')
                },
                getFileList(page) {
                    var that = this;
                    $.get(this.apiUrl.getFileList, {
                        page: page.pageIndex,
                        pagesize: page.pageSize
                    }, function (res) {
                        try {
                            if (res) {
                                that.fileList = res.Rows;
                                that.fileTotal = res.Total;
                            }
                            else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                        }
                    }, 'json')
                },
                save() {
                    var url = this.info.ID ? this.apiUrl.edit : this.apiUrl.add;
                    var that = this;
                    if (!this.info.ID) {
                        delete this.info.ID;
                    }
                    else {
                        this.info.ID = parseInt(this.info.ID);
                    }
                    this.info.activityId = this.activityId;
                    $.post(url, {
                        data: JSON.stringify(this.info)
                    }, function (res) {
                        try {
                            if (res) {
                                alert('保存成功');
                                that.info = {};
                                that.showEdit = false;
                                that.getList({ pageIndex: that.currentIndex, pageSize: that.pageSize });
                            }
                            else {
                                alert('保存失败');
                            }
                        } catch (error) {
                            console.error('保存失败', error);
                            alert('保存失败');
                        }
                    }, 'json')
                },
                cancle() {
                    this.showEdit = false;
                },
                //显示编辑框
                edit(item) {
                    console.log('edit', item);
                    this.info.ID = item.ID;
                    this.info.URL = item.URL;
                    this.info.ThreeStrokesName = item.ThreeStrokesName;
                    this.info.Intro = item.Intro;
                    this.showEdit = true;
                },
                del(id) {
                    console.log('del', id);
                    var that = this;
                    var r = confirm("确定要删除该条数据吗？")
                    if (r == true) {
                        $.post(this.apiUrl.del, {
                            id: id
                        }, function (res) {
                            try {
                                if (res) {
                                    alert('删除成功');
                                    that.getList({ pageIndex: that.currentIndex, pageSize: that.pageSize });
                                }
                                else {
                                    alert('删除失败');
                                }
                            } catch (error) {
                                console.error('删除失败', error);
                                alert('删除失败');
                            }
                        }, 'json')
                    }
                },
                initXiuxiu() {
                    let that = this;
                    xiuxiu.embedSWF("altContent2", 3, 700, 500, "lite");

                    xiuxiu.onInit = function (id) {
                        //xiuxiu.loadPhoto(["http://open.web.meitu.com/sources/images/1.jpg", "http://open.web.meitu.com/sources/images/2.jpg", "http://open.web.meitu.com/sources/images/3.jpg"]);
                        // xiuxiu.setUploadURL("http://web.upload.meitu.com/image_upload.php");
                        xiuxiu.setUploadURL(that.apiUrl.upLoadImg);
                        xiuxiu.setUploadType(2);
                        xiuxiu.setUploadDataFieldName("upload_file");
                    }

                    xiuxiu.onUploadResponse = function (data) {
                        var dataJson = JSON.parse(data);
                        that.info.URL = dataJson.imgurl;
                        that.showUpImg = false;
                        // that.showEdit = true;
                        //clearFlash();
                    }

                    xiuxiu.onDebug = function (data) {
                        alert("上传失败");
                        console.error("错误响应", data);
                    }

                    xiuxiu.onClose = function (id) {
                        // document.getElementById("flashEditorOut").innerHTML = '<div id="flashEditorContent"><p><a href="http://www.adobe.com/go/getflashplayer"><img alt="Get Adobe Flash player" src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"></a></p></div>';
                        that.showUpImg = false;
                    }
                },
                downImg(id) {
                    window.location.href=this.apiUrl.downImg+'&id='+id;
                }
            },
            mounted: function () {
                //配置图片上传地址
                this.apiUrl.upLoadImg = option.upSett + this.apiUrl.upLoadImg;
                this.activityId = this.getUrlParams('id');
                this.getList({ pageIndex: 1, pageSize: this.pageSize });
            }
        });
    }
}

$(function () {
    Works.initTable({
        upSett: $("#upSett").val()
    });
})