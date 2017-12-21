/*
  日期帮助类
  2017-11-12
  author:jn
 */
function DateHelp() {
    var option = {
        date: null,
        dateStr: null,
        init: function (_date) {
            try {
                //判断传入的date是否为日期类型，如果不是则初始化为当前日期
                if (_date instanceof Date) {
                    this.date = _date;
                }
                else {
                    this.date = new Date(_date);
                }
                this.dateStr = '';
            }
            catch (e) {
                this.date = new Date();
                this.dateStr = '';
            }
            return this;
        },
        ///初始化日期为年月日
        initYMD: function () {
            if (this.date) {
                this.date.setHours(0);
                this.date.setMinutes(0);
                this.date.setSeconds(0);
                this.date.setMilliseconds(0);
            }
            return this;
        },
        //给当前日期添加天数
        addDay: function (day) {
            if (this.date) {
                if (typeof (day) === "number") {
                    try {
                        this.date = new Date(this.date.getTime() + (86400000 * day));
                    }
                    catch (e) {
                        this.init();
                    }
                }
            }
            return this;
        },
        //格式化日期类型
        formatDate: function (fmt) {
            if (this.date) {
                try {
                    var date = this.date;
                    var o = {
                        "M+": date.getMonth() + 1,                 //月份   
                        "d+": date.getDate(),                    //日   
                        "h+": date.getHours(),                   //小时   
                        "m+": date.getMinutes(),                 //分   
                        "s+": date.getSeconds(),                 //秒   
                        "q+": Math.floor((date.getMonth() + 3) / 3), //季度   
                        "S": date.getMilliseconds()             //毫秒   
                    };
                    if (/(y+)/.test(fmt))
                        fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
                    for (var k in o)
                        if (new RegExp("(" + k + ")").test(fmt))
                            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                    this.dateStr = fmt;
                }
                catch (e) {
                    this.init();
                }
            }
            return this;
        },
        //把类似"Date(1491441457551)/"字符串转为日期类型
        //value:需要转换的日期字符串
        timeFormatter: function (value) {
            var da = new Date(parseInt(value.replace("/Date(", "").replace(")/", "").split("+")[0]));
            this.dateStr = da.getFullYear() + "-" + (da.getMonth() + 1) + "-" + da.getDate() + " " + da.getHours() + ":" + da.getMinutes() + ":" + da.getSeconds();
            this.date = da;
            return this;
        }
    }
    return {
        init: option.init,
        addDay: option.addDay,
        formatDate: option.formatDate
    };
}