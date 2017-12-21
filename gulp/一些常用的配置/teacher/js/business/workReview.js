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
                        getSingleUrl: '/Web/teacher/ThreeStrokes/workReview.aspx?Action=GetThreeStrokesDetails',
                        getProjectUrl: '/Web/teacher/ThreeStrokes/workReview.aspx?Action=ThreeStrokesItem',
                        addScoreUrl: '/Web/teacher/ThreeStrokes/workReview.aspx?Action=AddThreeStrokesScore',
                        getCommentList: '/Web/teacher/ThreeStrokes/workReview.aspx?Action=GetData_Comment',
                        addComment: '/Web/teacher/ThreeStrokes/workReview.aspx?Action=Add_Comment'
                    },
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
                    },
                    commentList: [],
                    reviewRemark: null,
                    comment: {
                        ThreeStrokesId: null,
                        Content: null
                    },
                    currentIndex: 1,
                    total: 0,
                    pageSize: 20
                }
            },
            methods: {                
                getDateTime(dateStr){
                    var dateHelp = new DateHelp();
                    return dateHelp.init(dateStr).formatDate('yyyy-MM-dd').dateStr;
                },                
                getUrlParams(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURIComponent(r[2]); return null;
                },
                setComment() {
                    var that = this;
                    if (!this.comment.Content) {
                        alert('评论不能为空');
                        return;
                    }
                    $.post(this.apiUrl.addComment, {
                        data: JSON.stringify(this.comment)
                    }, function (res) {
                        try {
                            if (res) {
                                alert('评论成功');
                                that.getCommentList({ pageIndex: that.pageIndex, pageSize: that.pageSize });
                            }
                            else {
                                console.log('返回的数据为空');
                                alert('评论失败');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                            alert('评论失败');
                        }
                    }, 'json')
                },
                getCommentList(page) {
                    var that = this;
                    $.get(this.apiUrl.getCommentList, {
                        id:this.worksId,
                        page: page.pageIndex,
                        pagesize: page.pageSize
                    }, function (res) {
                        try {
                            if (res) {
                                that.commentList = res.Rows;
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
                addScore() {
                    var score = 0;
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
                        id: this.activityId
                    }, function (res) {
                        try {
                            if (res) {
                                that.info = res[0];
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
                        id: this.worksId
                    }, function (res) {
                        try {
                            if (res) {
                                var itemInfo = res[0];
                                try {
                                    that.scoreInfo.ItemsId = itemInfo.ID;
                                    that.items = JSON.parse(itemInfo.Items);
                                } catch (error) {
                                    that.items = [];
                                }
                                that.$forceUpdate();
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
                this.comment.ThreeStrokesId = this.worksId;
                this.getSingle();
                this.getProject();
                this.getCommentList({ pageIndex: 1, pageSize: this.pageSize });
            }
        })
    }
}

$(function () {
    WorkReview.init();
})