class Summary {
    static init() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    summary: null,
                    activityId: null,                          
                    apiUrl: {
                        editUrl: '/Web/teacher/ThreeStrokes/index.aspx?Action=EditSummarize',                            
                        getSingleUrl: '/Web/teacher/ThreeStrokes/index.aspx?Action=GetSingle',                                                    
                    },                                              
                };
            },
            methods: {
                getSingle() {
                    let that = this;
                    $.get(this.apiUrl.getSingleUrl, {
                        id: this.activityId
                    }, function (res) {                        
                        try {
                            if (res) {
                                that.summary= res[0].activitySummarize;
                            }
                            else {
                                console.log('返回的数据为空');
                            }
                        } catch (error) {
                            console.error('返回的数据为空', error);
                        }

                    }, 'json')
                },
                getUrlParams(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURIComponent(r[2]); return null;
                },                                    
                save(){
                    $.post(this.apiUrl.editUrl,{
                        id:this.activityId,
                        summary:this.summary
                    },function(res){
                        try {
                            if (res.success) {
                                alert('保存成功');
                            }
                            else {
                                alert('保存失败');                             
                            }
                        } catch (error) {
                            alert('保存失败');                             
                            console.error('保存失败',error);
                        }
                    },'json');
                }
            },
            mounted() {                    
                this.activityId = this.getUrlParams('id');
                this.getSingle();
            }   
        })
    }
}

$(function () {
    Summary.init();
})