class Works {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    dataList: [{}],
                    type:-1,
                    keyword:null,
                }
            },
            methods: {
                search(){

                },
                getList() {
                    console.log(4444);
                },
                recommend(){},
                recommends(){},
                unRecommend(){},
                unRecommends(){},                                                
            },
            mounted: function () {

            }
        })
    }
}

$(function () {
    Works.init();
})