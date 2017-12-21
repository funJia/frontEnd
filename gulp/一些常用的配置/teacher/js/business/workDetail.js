class WorkDetail {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    dataList: [{}],
                    type: -1,
                    keyword: null,
                }
            },
            methods: {
                vote() { },
                recommend() { },
                unRecommend() { }
            },
            mounted: function () {

            }
        })
    }
}

$(function () {
    WorkDetail.init();
})