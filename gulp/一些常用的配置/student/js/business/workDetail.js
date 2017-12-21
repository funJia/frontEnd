class WorkDetail {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    worksId: null,
                    apiUrl: {
                        getSingle: '/Web/student/ThreeStrokes/workDetail.aspx?Action=GetSingle',
                        getCommentList: '/Web/student/ThreeStrokes/workDetail.aspx?Action=GetData_Comment',
                        addComment: '/Web/student/ThreeStrokes/workDetail.aspx?Action=Add_Comment',
                        addPoll: '/Web/student/ThreeStrokes/workDetail.aspx?Action=Add_Poll'
                    },
                    commentList: [],
                    info: {
                        ID: null,
                        URL: null,
                        ThreeStrokesName: null,
                        PollSum: null
                    },
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
                getUrlParams(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURIComponent(r[2]); return null;
                },
                poll() {
                    var that = this;
                    $.post(this.apiUrl.addPoll, {
                        id: this.worksId
                    }, function (res) {
                        try {
                            if (res) {
                                alert('评论成功');
                                that.getSingle();
                            }
                            else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                        }
                    }, 'json')
                },
                setComment() {
                    var that = this;
                    if(!this.comment.Content)
                    {
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
                getSingle() {
                    var that = this;
                    $.get(this.apiUrl.getSingle, {
                        id: this.worksId
                    }, function (res) {
                        try {
                            if (res) {
                                that.info = res[0];
                            }
                            else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
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
                                that.total=res.Total;
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
                getDateTime(dateStr){
                    var dateHelp = new DateHelp();
                    return dateHelp.init(dateStr).formatDate('yyyy-MM-dd').dateStr;
                }
            },
            mounted: function () {
                this.worksId = this.getUrlParams('id');
                this.comment.ThreeStrokesId = this.worksId;
                this.getSingle();
                this.getCommentList({ pageIndex: 1, pageSize: this.pageSize });
            }
        });
    }
}

$(function () {
    WorkDetail.init();
})