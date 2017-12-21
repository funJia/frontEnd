class TaskInfo {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    courseList: [{}]
                }
            }
        });
    }
}

$(function () {
    TaskInfo.init();
})