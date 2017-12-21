class MutualReviewList {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    dataList: [{}],
                    type: -1,
                    keyword: null
                }
            },
            methods: {
                search() { },
                getList() { }
            },
            mounted: function () {

            }
        })
    }
}

$(function () {
    MutualReviewList.init();
})