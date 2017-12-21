class WorkReviewList {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    activityId: null,
                    apiUrl: {
                        getListUrl: '/Web/student/ThreeStrokes/workReviewList.aspx?Action=GetData'
                    },
                    keywords: null,
                    dataList: [],
                    total: 0,
                    currentIndex: 1,
                    pageSize: 20
                }
            },
            methods: {
                getUrlParams(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURIComponent(r[2]); return null;
                },
                getStatus(status) {
                    switch (status) {
                        case "1":
                            return '审核通过';
                        case "0":
                            return '未审核';
                        case "2":
                            return '审核未通过';
                        default:
                            return '未审核';
                    }
                },
                search() {

                },
                getList(page) {
                    var that = this;
                    $.get(this.apiUrl.getListUrl, {
                        id: page.activityId,
                        page: page.pageIndex,
                        pagesize: this.pageSize
                    }, function (res) {
                        try {
                            if (res) {
                                that.dataList = res.Rows;
                                that.total = res.Total;
                                that.currentIndex = page.pageIndex;                                
                            }
                        } catch (error) {
                            that.dataList = [];
                            that.total = 0;
                            console.error('数据格式错误',error);
                        }
                    }, 'json');
                }
            },
            mounted: function () {
                this.activityId = this.getUrlParams('id');
                this.getList({pageIndex:1,pageSize:this.pageSize});
            }
        });
    }
}

$(function () {
    WorkReviewList.init();    
})