class BasicInfo {
    static init(option) {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    showUpImg: false,
                    apiUrl: {
                        upLoadImg: '/Web/teacher/ThreeStrokes/basicInfo.aspx',
                        dataUrl: '/Web/teacher/ThreeStrokes/index.aspx',
                    },
                    activityId: null,
                    info: {
                        activityId:null,
                        activityName: null,
                        intro: null,
                        startTime: null,
                        endTime: null,
                        activityAddress: null,
                        userName: null,
                        userId: null,
                        logoImage: null
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
                }
            },
            methods: {
                upImg() {
                    this.showUpImg = true;
                },
                getSingle() {
                    let that = this;
                    $.get(this.apiUrl.dataUrl, {
                        Action: 'GetSingle',
                        id: this.activityId
                    }, function (res) {
                        //[{"activityId":61,"activityName":"222222222","intro":"222222","activityTypeId":3,"adminId":1,"createTime":"2017-11-28 00:00:00","practice_unitsId":null,"activitySummarize":null,"summarizeTime":null,"activityAddress":null,"startTime":"2017-11-01 00:00:00","endTime":"2017-11-29 00:00:00","userId1":null,"userId2":27,"userId3":null,"userId4":1,"apply_starTime":null,"apply_endTime":null,"staticId":1,"logoImage":null,"standardTemplateId":null,"otalActivityId":32}]
                        try {
                            if (res) {
                                that.info = res[0];
                                var dateHelp = new DateHelp();
                                that.info.startTime = dateHelp.init(that.info.startTime).formatDate('yyyy-MM-dd').dateStr;
                                that.info.endTime = dateHelp.init(that.info.endTime).formatDate('yyyy-MM-dd').dateStr;
                            }
                            else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                        }

                    }, 'json')
                },
                getUrlParams(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURIComponent(r[2]); return null;
                },
                save() {
                    $.post(this.apiUrl.dataUrl + '?Action=Edit', {
                        data: JSON.stringify(this.info)
                    }, function (res) {
                        //{"success":true,"result":1,"code":200,"msg":""}
                        try {
                            if (res.success) {
                                alert('保存成功');
                            }
                            else {
                                alert('保存失败');                             
                            }
                        } catch (error) {
                            alert('保存失败');                             
                            console.error('保存失败',error);
                        }
                    }, 'json')
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
                        that.info.logoImage = dataJson.imgurl;
                        that.showUpImg = false;                        
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
                }
            },
            mounted: function () {
                //配置图片上传地址
                this.apiUrl.upLoadImg = option.upSett + this.apiUrl.upLoadImg;
                this.activityId = this.getUrlParams('id');
                this.getSingle();
            }
        })
    }
}

$(function () {
    BasicInfo.init({
        upSett: $("#upSett").val()
    });
})