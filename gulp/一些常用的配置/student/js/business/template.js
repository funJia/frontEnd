window.sbzTemplate = {
    //三笔字顶部信息
    head: `<h3>{{SubjectName}}</h3>
    <p>
      创建者：{{CreateUserName}}　参与人数：{{Participation}}人
      <br> 起止时间：{{StartDate}} ~ {{EndDate}}
      <br> 活动地点：{{Addr}}
    </p>`,
    describe: `{{Describe}}`,
    activityFile: `{{each FileList as item index}}
    <a href="{{item.fileUrl}}">
    <img class="activity-file-icon" src="{{item.fileIcon}}">
    <p>{{item.fileName}}</p>
    <div class="clearfix"></div>
  </a>
    {{/each}}
    `,
    activitySummary: `      <div class="new-title">
    
            <h1>活动总结</h1>
            <div class="clearfix"></div>
          </div>
          <p>{{Summary}}</p>`
}

window.sbzDataSource = {
    info: {
        SubjectName: '三笔字书画专题',
        CreateUserName: '学校管理员',
        Participation: 1268,
        StartDate: '2017-11-02',
        EndDate: '2017-11-08',
        Addr: '工作室成员各自学校及学习场所',
        Describe: `2017年的教育技术专业的三笔字书画专题，请大家及时报名。无论是培训、演讲，还是大小活动，UMU企业版都能让您的活动效果升级，更有效率！在知识共享的时代，每个人的知识和经验都可以经过萃取和提炼分享给他人。使用
        UMU 提供的创新混合式互动学习方式，可以非常容易的制作图文音视频各类互动课程，同时还可以在活动学习培训现场发起调研、提问，激发相互分享，甚至使用手机进行直播。`,
        FileList: [{
            fileName: '如何讲好一次说课.doc',
            fileIcon: '/images/word.png',
            fileUrl: ''
        }, {
            fileName: '如何讲好一次说课.ppt',
            fileIcon: '/images/ppt.png',
            fileUrl: ''
        }, {
            fileName: '如何讲好一次说课.mp4',
            fileIcon: '/images/mp4.png',
            fileUrl: ''
        }]
    }
}

//同学互评列表模板
window.classmateMutualListT = `{{each data as item index}}<tr align="center">
<td>{{item.ID}}</td>
<td>{{item.ThreeStrokesName}}</td>
<td>{{item.Type | getTSTypeStr}}</td>
<td>{{item.Status | getTSRStatusStr}}</td>
<td>{{#item.Status | getTSOpertor}}    
</td></tr>{{/each}}`;


//管道函数
//作品类型 字符串
template.defaults.imports.getTSTypeStr=function (type) {
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
};

//作品审核状态 字符串
template.defaults.imports.getTSRStatusStr=function (type) {
    switch (type) {
        case THREESTROKESSTATUSENUM.未评审:
            return '未评审';
        case THREESTROKESSTATUSENUM.已评审:
            return '已评审';
        default:
            return '--';
    }
};

//根据作品审核状态为未评审时显示评审按钮
template.defaults.imports.getTSOpertor=function (type) {
    switch (type) {
        case THREESTROKESSTATUSENUM.未评审:
            return `<input class="table-btn" type="button" value="评审" onclick="location.href = ('SbzHupingDetail.aspx')">`;
        case THREESTROKESSTATUSENUM.已评审:
            return '';
        default:
            return '--';
    }
};