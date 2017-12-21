class SubjectDetail {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    singleUrl: '/Web/student/ThreeStrokes/subjectDetail.aspx',
                    couserUrl: '/Web/student/ThreeStrokes/subjectDetail.aspx?Action=GetData_Course',
                    getWorksListUrl:'/Web/student/ThreeStrokes/subjectDetail.aspx?Action=GetThreeStrokes',
                    activityId: null,
                    info: {
                        activityName: null,
                        intro: null,
                        startTime: null,
                        endTime: null,
                        activityAddress: null,
                        userName: null,
                        userId: null,
                        logoImage: null,
                        activitySummarize:null
                    },
                    courseList:[],
                    worksList:[]
                }
            },
            methods: {
                upImg() {
                },
                getSingle() {
                    let that = this;
                    $.get(this.singleUrl, {
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
                //获取课程
                getCourse(){
                    let that = this;
                    $.get(this.couserUrl, {
                        id: this.activityId
                    }, function (res) {                        
                        try {
                            if (res) {
                                that.courseList = res;
                            }
                            else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                        }

                    }, 'json') 
                },
                //获取优秀案例
                getWorksList(){
                    let that = this;
                    //where:{"rules":[{"field":"ID","op":"equal","value":"1","type":"number"},{"field":"ThreeStrokesName","op":"equal","value":"2","type":"string"}],"op":"and"}
                    $.post(this.getWorksListUrl, {
                        id:this.activityId,
                        where:JSON.stringify({"rules":[{"field":"activityId","op":"equal","value":this.activityId,"type":"number"},
                        {"field":"IsRecommend","op":"equal","value":"1","type":"number"}],"op":"and"}),                        
                        page:1,
                        pagesize:8
                    }, function (res) {                        
                        try {
                            if (res) {
                                that.worksList = res.Rows;
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
                }
            },
            mounted: function () {
                this.activityId = this.getUrlParams('id');
                this.getSingle();
                this.getCourse();
                this.getWorksList();
            }
        })
    }
}

$(function () {
    SubjectDetail.init();
})