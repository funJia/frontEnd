'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) { arr2[i] = arr[i]; } return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var MapInfo = function () {
    function MapInfo() {
        _classCallCheck(this, MapInfo);
    }

    _createClass(MapInfo, null, [{
        key: 'initComponent',
        value: function initComponent() {
            var AreaDetail = Vue.component('areaDetail', {
                template: '<div class=\'area-detail\'>\n                <div class=\'item province\' \n                 :class="checkedProvince&&\'checked\'" @click=\'initChecked("province")\' \n                 :title="provinceName"><span>{{provinceName}}</span></div>\n                <div class=\'item city\' :class="checkedCity&&\'checked\'" \n                 @click=\'initChecked("city")\' v-show="cityId!=null"\n                 :title="cityName"><span>{{cityId==-1?\'\u8BF7\u9009\u62E9\':cityName}}</span></div>                \n                <div class=\'item area\' :class="checkedArea&&\'checked\'"\n                 @click=\'initChecked("area")\' v-show="areaId!=null"\n                 :title="areaName"><span>{{areaId==-1?\'\u8BF7\u9009\u62E9\':areaName}}</span></div>                \n            </div>',
                data: function data() {
                    return {
                        checkedProvince: false,
                        checkedCity: false,
                        checkedArea: false,
                        provinceId: '430000',
                        provinceName: '湖南省',
                        cityId: '430100',
                        cityName: '长沙市',
                        areaId: '',
                        areaName: ''
                    };
                },

                methods: {
                    setData: function setData(ptab, name, id) {
                        switch (ptab) {
                            case "province":
                                this.provinceId = id;
                                this.provinceName = name;
                                this.initChecked('city');
                                this.cityId = -1;
                                break;
                            case "city":
                                this.cityId = id;
                                this.cityName = name;
                                this.initChecked('area');
                                this.areaId = -1;
                                break;
                            case "area":
                                this.areaId = id;
                                this.areaName = name;
                                break;
                        }
                        var data = {
                            provinceId: this.provinceId,
                            provinceName: this.provinceName,
                            cityId: this.cityId,
                            cityName: this.cityName,
                            areaId: this.areaId,
                            areaName: this.areaName
                        };
                        this.$emit('callResult', data);
                    },
                    initChecked: function initChecked(tab) {
                        this.checkedProvince = false;
                        this.checkedCity = false;
                        this.checkedArea = false;
                        switch (tab) {
                            case 'province':
                                this.checkedProvince = true;
                                this.areaId = -1;
                                this.$emit('changeArea', 'province', '86', this.provinceId);
                                break;
                            case 'city':
                                this.checkedCity = true;
                                this.areaId = -1;
                                this.$emit('changeArea', 'city', this.provinceId, this.cityId);
                                break;
                            case 'area':
                                this.checkedArea = true;
                                this.$emit('changeArea', 'area', this.cityId, this.areaId);
                                break;
                            default:
                                break;
                        }
                    }
                }
            });
            Vue.component('areaPanle', {
                template: '<div class=\'area-panle\'>\n            <div>\n            <ul>\n            <li v-for="(item,index) in areaList" :key="index" @click="choiseInfo(item,index)">\n            <span class="area-panel-info"\n             :class="index==currentId?\'checked\':\'\'" \n             :title="item">{{item}}</span>\n            </li>\n            </ul>\n            </div>\n            </div>',
                props: ['areaList'],
                data: function data() {
                    return {
                        currentId: null
                    };
                },

                methods: {
                    choiseInfo: function choiseInfo(item, index) {
                        this.currentId = index;
                        console.log(item, index);
                        this.$emit('choiseInfo', item, index);
                    },

                    //设置当前选中的项Id
                    setCurrentId: function setCurrentId(_currentId) {
                        this.currentId = _currentId;
                    }
                }
            });
            Vue.component('industryPanle', {
                template: '<div class=\'industry-panle\'>\n            <div class=\'main-industry\'>\n                <ul>\n                <li v-for="(item,index) in mainIndustryList" :key="index" @click="getChild(item)"  :class="item.id==currentMainId?\'checked\':\'\'" >\n                <span class="item area-panel-info"\n               \n                :title="item.name">{{item.name}}</span>\n                <span class="icon">{{\'>\'}}</span>\n                </li>\n                </ul>\n            </div>\n            <div class=\'child-industry\'>\n            <ul>\n            <li v-for="(item,index) in childIndustryList" :key="index"  @click="checkedIndustry(item)">\n            <span class="area-panel-info"\n             :class="item.id==currentChildId?\'checked\':\'\'" \n             :title="item.name">{{item.name}}</span>\n            </li>\n            </ul> </div>                                   \n            </div>',
                data: function data() {
                    return {
                        mainIndustryList: [],
                        childIndustryList: [],
                        currentMainName: null,
                        currentMainId: null,
                        currentChildId: null
                    };
                },

                methods: {
                    getChild: function getChild(item) {
                        this.currentMainId = item.id;
                        this.currentMainName = item.name;
                        this.childIndustryList = item.subIndustrys;
                        this.$emit('industryResult', {
                            pid: this.currentMainId,
                            childIds: this.currentChildId,
                            name: this.currentMainName
                        });
                    },
                    checkedIndustry: function checkedIndustry(item) {
                        this.currentChildId = item.id;
                        this.$emit('industryResult', {
                            pid: this.currentMainId,
                            childIds: this.currentChildId,
                            name: this.currentMainName
                        });
                    }
                },
                mounted: function mounted() {
                    this.mainIndustryList = window.industryInfo;
                }
            });
            Vue.component('industryPanle2', {
                template: '<div class=\'industry-panle2\'>\n            <div class=\'child-industry\'>\n            <ul>\n            <li v-for="(item,index) in mainIndustryList" :key="index" @click="getChild(item)" >\n            <span class="area-panel-info"\n             :class="item.id==currentMainId?\'checked\':\'\'" \n             :title="item.name">{{item.name}}</span>\n            </li>\n            </ul> </div>                                   \n            </div>',
                data: function data() {
                    return {
                        mainIndustryList: [],
                        childIndustryList: [],
                        currentMainName: null,
                        currentMainId: null,
                        currentChildId: null
                    };
                },

                methods: {
                    getChild: function getChild(item) {
                        this.currentMainId = item.id;
                        this.currentMainName = item.name;
                        // this.childIndustryList = item.subIndustrys;
                        this.$emit('industryResult', {
                            pid: this.currentMainId,
                            childIds: null,
                            name: this.currentMainName
                        });
                    }
                },
                mounted: function mounted() {
                    this.mainIndustryList = [{
                        "id": null,
                        "name": "全部"
                    }].concat(_toConsumableArray(window.industryInfo));
                }
            });
            Vue.component('vue-area', {
                template: '<div class=\'\'>\n            <div class="head">\n            <span class="area" @click="step=1" :class="step==1?\'checked\':\'\'"><span class="item">{{areaInfoStr}}</span></span>\n            <span class=\'industry\' @click="step=2" :class="step==2?\'checked\':\'\'"><span class="item">{{industryStr}}</span></span>           \n            </div>\n            <button class=\'search\' style=\'    position: fixed;\n            left: 346px;\n            top: 11px;\n            background-color: rgb(0, 129, 255);\n            color: rgb(255, 255, 255);\n            width: 62px;\n            height: 40px;\n            display: inherit;\n            text-align: center;\n            margin-left: 10px;\' @click="search">\u641C\u7D22</button>              \n            <div v-show="step==1" class="vue-area">\n            <area-detail ref="ad" @changeArea="changeArea" @callResult="callResult"></area-detail>\n            <area-panle ref="ap" :areaList="areaList" @choiseInfo="choiseInfo"></area-panle>            \n            </div>\n            <div v-show="step==2">\n            <industryPanle2 @industryResult="industryResult"></industryPanle2>\n            </div>\n            </div>',
                comments: {
                    AreaDetail: AreaDetail
                },
                data: function data() {
                    return {
                        areaList: {},
                        step: 0,
                        //0:省 1:市 2:区
                        checked: 0,
                        areaInfo: {
                            provinceId: '430000',
                            provinceName: '湖南省',
                            cityId: '430100',
                            cityName: '长沙市',
                            areaId: '',
                            areaName: ''
                        },
                        industryInfo: {
                            pid: null,
                            childIds: null,
                            name: '全部'
                        },
                        areaInfoStr: '湖南省/长沙市',
                        industryStr: '全部'
                    };
                },

                methods: {
                    changeArea: function changeArea(area, id, cid) {
                        var temp = [];
                        if (id) {
                            temp = window.areaInfo[id];
                        }
                        switch (area) {
                            case 'province':
                                this.areaList = temp.length || window.areaInfo["86"];
                                this.checked = 0;
                                break;
                            case 'city':
                                this.areaList = temp;
                                this.checked = 1;
                                break;
                            case 'area':
                                this.areaList = temp;
                                this.checked = 2;
                                break;
                        }
                        if (cid) {
                            this.$refs.ap.setCurrentId(cid);
                        }
                    },
                    choiseInfo: function choiseInfo(item, id) {
                        var choiseName = '';
                        switch (this.checked) {
                            case 0:
                                choiseName = 'province';
                                break;
                            case 1:
                                choiseName = 'city';
                                break;
                            case 2:
                                choiseName = 'area';
                                break;
                            default:
                                choiseName = 'province';
                                break;
                        }
                        this.$refs.ad.setData(choiseName, item, id);
                    },
                    search: function search() {
                        this.step = 0;
                        window.search(this.areaInfo, this.industryInfo);
                    },
                    callResult: function callResult(data) {
                        console.log(data);
                        this.areaInfo = data;
                        // this.areaInfoStr = data.provinceName + '/' + (data.cityName || '--') + '/' +
                        //     (data.areaName || '--');

                        var cityName = data.cityName,
                            cityId = data.cityId,
                            areaName = data.areaName,
                            areaId = data.areaId;

                        if (cityId != -1) {
                            cityName = cityName || '--';
                        } else {
                            cityName = null;
                        }

                        if (areaId != -1) {
                            areaName = areaName || '--';
                        } else {
                            areaName = null;
                        }

                        if (cityName && areaName) {
                            this.areaInfoStr = data.provinceName + '/' + (cityName || '--') + '/' + (areaName || '--');
                        } else if (cityName) {
                            this.areaInfoStr = data.provinceName + '/' + (cityName || '--');
                        } else {
                            this.areaInfoStr = data.provinceName;
                        }
                        this.areaInfo.cityName = cityName;
                        this.areaInfo.cityId = cityId;
                        this.areaInfo.areaName = areaName;
                        this.areaInfo.areaId = areaId;
                    },
                    industryResult: function industryResult(data) {
                        this.industryInfo = data;
                        this.industryStr = data.name;
                    }
                }
            });
        }
    }, {
        key: 'init',
        value: function init() {
            new Vue({
                el: '#map-container',
                methods: {},
                mounted: function mounted() {}
            });
        }
    }]);

    return MapInfo;
}();

window.onload = function () {
    MapInfo.initComponent();
    MapInfo.init();
};