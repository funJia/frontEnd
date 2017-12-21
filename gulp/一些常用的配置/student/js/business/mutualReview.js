class MutualReview {
    //初始化列表
    static initTable() {
        let data = [{
            ID: 1,
            ThreeStrokesName: '沁园春·雪',
            Type: 0,
            Status: 0
        }];
        var render = template.compile(window.classmateMutualListT);
        let html = render({ data });
        $("#list").html(html);
    }

    static defineVueCompoent() {
        Vue.component('mutual-dialog', {
            template: `<div style="position:absolute;width:100%;height:100%;top: 0px;
            left: 0px;"><div id="popup_box" class="popup_box SbzComent" style="position:relative;    position: fixed;
            top: 200px;left: calc((100% - 500px) / 2);display: block;">
            <div class="pop_title"><span class="close" id="close"  @click="$emit('hide-dialog')"><img src="/images/close.png"/></span>评审</div>
            <div class="pop_cont">
                <table class="wg-list" width="100%" style=" margin-top:0px; margin-bottom:10px;">
                    <tbody>
                      <tr>
                        <th>序号</th>
                        <th>打分项目</th>
                        <th>分数</th>
                      </tr>
                      <tr align="center" v-for="(item,index) in dataList" :key="item.ID">
                        <td>{{index+1}}</td>
                        <td>字迹工整</td>
                        <td><input type="text" class="input-text SbzComen-input" v-model="item.value"/>/10</td>
                      </tr>
                    </tbody>
                  </table>
                  <input type="button" name="button" id="submit" value="提交" class="input-btn" @click="getValue">
            </div>
        </div><div>`,
            props: ["id"],
            data() {
                return {
                    dataList: [{
                        id: 0,
                        value: 0
                    }]
                }
            },
            methods: {
                log() {
                    console.log(11111111111111);
                },
                setValue(e, id) {
                },
                getValue() {
                },
                getList() {
                    this.dataList = [{
                        id: 0,
                        value: 0
                    }];
                }
            },
            mounted() {
                this.getList();
            }
        })

        Vue.component('vue-tbody', {
            template: `<table class="wg-list" width="100%">            
                <tr>
                    <th>作品编号</th>
                    <th>作品名称</th>
                    <th>作品类型</th>
                    <th>评审状态</th>
                    <th width=" 20%">操作</th>
                </tr>
            <tr align="center" v-for="(item,index) in dataList" :key="item.ID">
            <td>{{item.ID}}</td>
            <td>{{item.ThreeStrokesName}}</td>
            <td>{{item.Type | getTSTypeStr}}</td>
            <td>{{item.Status | getTSRStatusStr}}</td>
            <td><input class="table-btn" type="button" value="评审" v-if="item.Status==THREESTROKESSTATUSENUM.未评审" @click="$emit('call',item.ID)">
            <span v-else>已评审</span>
            </td></tr></table>`,
            data() {
                return {
                    dataList: [{
                        ID: 1,
                        ThreeStrokesName: '沁园春·雪',
                        Type: 0,
                        Status: 0
                    }]
                }
            },
            filters: {
                getTSTypeStr: function (type) {
                    switch (type) {
                        case THREESTROKESETYPEENUM.粉笔字:
                            return '粉笔字';
                        case THREESTROKESETYPEENUM.硬笔字:
                            return '硬笔字';
                        case THREESTROKESETYPEENUM.毛笔字:
                            return '毛笔字';
                        case THREESTROKESETYPEENUM.简笔画:
                            return '简笔画';
                        default:
                            return '--';
                    }
                },
                getTSRStatusStr: function (type) {
                    switch (type) {
                        case THREESTROKESSTATUSENUM.未评审:
                            return '未评审';
                        case THREESTROKESSTATUSENUM.已评审:
                            return '已评审';
                        default:
                            return '--';
                    }
                },
                getTSOpertor: function (type) {
                    switch (type) {
                        case THREESTROKESSTATUSENUM.未评审:
                            return `<input class="table-btn" type="button" value="评审" onclick="location.href = ('SbzHupingDetail.aspx')">`;
                        case THREESTROKESSTATUSENUM.已评审:
                            return '';
                        default:
                            return '--';
                    }
                }
            },
            methods: {
                getTSOpertor: function (id, type) {
                    switch (type) {
                        case THREESTROKESSTATUSENUM.未评审:
                            return `<input class="table-btn" type="button" value="评审" @click="$emit('call',` + id + `)">`;
                        case THREESTROKESSTATUSENUM.已评审:
                            return '';
                        default:
                            return '<span>--</span>';
                    }
                }
            }
        })
    }

    //初始化分页组件
    static initVueComponent() {
        new Vue({
            el: '#vue-container',
            data() {
                return {
                    currentId: null,
                    showDialog: false,
                    type: 1,
                    keyword: 1231231
                }
            },
            methods: {
                hideDialog() {
                    this.showDialog = false
                },
                getList(index) {
                    console.log('选择页码:', index);
                },
                toReview(id) {
                    console.log(id);
                    this.currentId = id;
                    this.showDialog = true;
                },
                search() {
                    console.log('搜索的信息：',this.type,'-',this.keyword);
                }
            },
            mounted: function () {

            }
        })
    }

    //显示评审弹窗
    static showReviewDialog() {

    }
}

$(function () {
    MutualReview.defineVueCompoent();
    MutualReview.initTable();
    MutualReview.initVueComponent();
})


