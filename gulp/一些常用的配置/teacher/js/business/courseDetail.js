class CourseDetail {
    static initTable() {
        // 创建根实例
        new Vue({
            el: '#vue-container',
            data(){
                return {
                    commentList:[{}]
                }
            },
            methods:{
                getList(index){
                    console.log('选择页码:',index);
                }
            },
            mounted: function () {
       
            }
        })
    }
}

$(function(){
    CourseDetail.initTable();
})
