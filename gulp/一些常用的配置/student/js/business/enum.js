//专题类型
var SUBJECTTYPEENUM = {
    '竞赛': 0,
    '作品': 1
}

//专题状态
var SUBJECTSTATUSENUM = {
    '开始报名': 0,
    '投票中': 1,
    '审核中': 2,
    '互评中': 3,
    '已结束': 4
}

//评审类型
var REVIEWTYPEENUM = {
    '网上投票': 0,
    '专家评审': 1,
    '同学互评': 2
}

//专题用户类型
var SUBJECTUSERTYPEENUM = {
    '评审': 1,
    '参加对象': 2
}

//互评成员 mutualEmplyee
var MUTUALTYPEENUM = {
    '全校互评': 1,
    '专业互评': 2,
    '班级互评': 3
}

//课程类别
var COURSETYPEENUM = {
    '粉笔字': 0,
    '硬笔字': 1,
    '毛笔字': 2,
    '简笔画': 3
}

//书画作品状态
var THREESTROKESENUM={
    '通过':0,
    '未通过':1
}

//作品类型
var THREESTROKESETYPEENUM = {
    '粉笔字': 0,
    '硬笔字': 1,
    '毛笔字': 2,
    '简笔画': 3
}

//成绩状态
var THREESTROKESSCORESTATUSENUM={
    '通过':0,
    '未通过':1
}

//书画作品状态
var THREESTROKESSTATUSENUM={
    '未评审':0,
    '已评审':1
}

//枚举转对象
var EnumToObject = function (enumObj) {
    var obj = [];
    for (item in enumObj) {
        obj.push({ 'text': item, 'id': enumObj[item] });
    }
    return obj;
}

