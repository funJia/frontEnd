class Comment {
    static getUrlParams(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return decodeURIComponent(r[2]); return null;
    }

    static isEffectiveRequest() {
        var path = window.location.pathname;
        var chunks = path.split('/');
        try {
            if (chunks.length == 5) {
                var pagePath = [];
               pagePath.push(chunks[0], chunks[1], chunks[2], chunks[3], chunks[4]);
               var pagePathStr=pagePath.join('/');
                switch (pagePathStr.toUpperCase()) {
                    case '/web/teacher/ThreeStrokes/index.aspx'.toUpperCase():
                    case '/web/teacher/ThreeStrokes/basicInfo.aspx'.toUpperCase():
                    case '/web/teacher/ThreeStrokes/basicInfo.aspx'.toUpperCase():
                    case '/web/teacher/ThreeStrokes/workReviewList.aspx'.toUpperCase():
                        var id = Comment.getUrlParams('id');
                        if (parseInt(id) > 0&&!isNaN(id)) {
                            //request is ok
                        }
                        else {
                            alert('非法请求')
                            location.href = '/activitys/teacher/Default.aspx';
                        }
                        break;
                    case '/web/teacher/ThreeStrokes/workReview.aspx'.toUpperCase():
                        var id = Comment.getUrlParams('id');
                        var activityId = Comment.getUrlParams('activityId');
                        if (parseInt(id) > 0 &&!isNaN(id)&& parseInt(activityId) > 0&&!isNaN(activityId)) {
                            //request is ok
                        }
                        else {
                            alert('非法请求')
                            location.href = '/activitys/teacher/Default.aspx';
                        }
                        break;
                    case '/Web/student/ThreeStrokes/subjectDetail.aspx'.toUpperCase():
                    case '/Web/student/ThreeStrokes/works.aspx'.toUpperCase():
                    case '/Web/student/ThreeStrokes/workDetail.aspx'.toUpperCase():
                    case '/Web/student/ThreeStrokes/workReviewList.aspx'.toUpperCase():
                        var id = Comment.getUrlParams('id');
                        if (parseInt(id) > 0&&!isNaN(id)) {
                            //request is ok
                        }
                        else {
                            alert('非法请求')
                            location.href = '/activitys/student/Default.aspx';
                        }
                        break;
                    case '/web/student/ThreeStrokes/workReview.aspx'.toUpperCase():
                        var id = Comment.getUrlParams('id');
                        var activityId = Comment.getUrlParams('activityId');
                        if (parseInt(id) > 0 &&!isNaN(id)&& parseInt(activityId) > 0&&!isNaN(activityId)) {
                            //request is ok
                        }
                        else {
                            alert('非法请求')
                            location.href = '/activitys/student/Default.aspx';
                        }
                        break;
                    default:
                        alert('非法请求')
                        location.href = '/Default.aspx';
                }
            }
            else {
                location.href = '/Default.aspx';
            }

        } catch (error) {
            location.href = '/Default.aspx';
        }
    }
}
Comment.isEffectiveRequest();