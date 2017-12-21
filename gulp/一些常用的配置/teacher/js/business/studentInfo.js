class StudentInfo {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    dataList: [{}],
                    currentId: 0,
                    //打分项目
                    socreProject: [{}],
                    //总分
                    totalSocre: 0,
                    showDialog: false,
                }
            },
            methods: {
                getList() {
                    console.log(4444);
                },
                //打分
                setScore(id) {
                    this.currentId = id;
                    this.showDialog = true;
                }
            },
            mounted: function () {

            }
        })
    }
}

$(function () {
    StudentInfo.init();
})