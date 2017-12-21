class WorkReview {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    //作品编号
                    worksId: null,
                    //活动编号
                    activityId: null,
                    apiUrl: {
                        getSingleUrl: '/Web/student/ThreeStrokes/workDetail.aspx?Action=GetSingle',
                        getProjectUrl: '/Web/student/ThreeStrokes/workReview.aspx?Action=GetSingle',
                        addScoreUrl: '/Web/student/ThreeStrokes/WorkReview.aspx?Action=Add_Score'
                    },
                    projectList: [],
                    info: {
                        ID: null,
                        URL: null,
                        ThreeStrokesName: null,
                        Items: []
                    },
                    items:[],
                    scoreInfo: {
                        ItemsId: null,
                        ThreeStokesId: null,
                        Score: 0,
                        Content: null
                    }
                }
            },
            methods: {
                getUrlParams(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURIComponent(r[2]); return null;
                },
                addScore() {
                    var score = 0, that = this;
                    this.items.forEach(function (item) {
                        try {
                            score += parseFloat(item.Score);
                        } catch (error) {
                            score = 0;
                        }
                    }, this);
                    this.scoreInfo.Score = score;
                    if (score > 100) {
                        alert('总分数不能大于100');
                        return;
                    }
                    $.post(this.apiUrl.addScoreUrl, {
                        data: JSON.stringify(this.scoreInfo)
                    }, function (res) {
                        if (res.success) {
                            alert('评审成功');
                            location.href = './workReviewList.aspx?id=' + that.activityId;
                        }
                        else {
                            alert('评审失败');
                        }
                    }, 'json')


                },
                getSingle() {
                    var that = this;
                    $.get(this.apiUrl.getSingleUrl, {
                        id: this.worksId
                    }, function (res) {
                        try {
                            if (res) {
                                that.info =res[0];   
                                that.$forceUpdate()
                            } else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                        }
                    }, 'json')
                },
                getProject() {
                    var that = this;
                    $.get(this.apiUrl.getProjectUrl, {
                        id: this.activityId
                    }, function (res) {
                        try {
                            if (res) {
                                var itemInfo = res[0];
                                try {
                                    that.scoreInfo.ItemsId = itemInfo.ID;
                                    that.items = JSON.parse(itemInfo.Items);
                                    that.items.forEach(function (item) {
                                        item.MaxScore = item.Score;
                                    }, this);
                                } catch (error) {
                                    that.Items = [];
                                }
                                that.$forceUpdate();
                                that.$nextTick(() => {
                                    $(".score-input").each(function () {
                                        var element = this;
                                        var nh = new NumberHandle();
                                        nh.bindEvent(element);
                                        nh.cb = function (val) {
                                            $(element).val(val);
                                        }
                                    })
                                });
                            }
                            else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                        }
                    }, 'json')
                }
            },
            mounted: function () {
                this.worksId = this.getUrlParams('id');
                this.activityId = this.getUrlParams('activityId');
                this.scoreInfo.ThreeStokesId = this.worksId;
                this.getSingle();
                //获取互评配置数据
                this.getProject();
            }
        });
    }
}

$(function () {
    WorkReview.init();
})