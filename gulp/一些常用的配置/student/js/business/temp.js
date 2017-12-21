var buildTemplate = function (source, data) {
  var render = template.compile(source);
  let html = render(data);
  return html;
}

var initHead = function () {
  let html = buildTemplate(window.sbzTemplate.head,
    sbzDataSource.info);

  var _sbzLoad=window.sbzLoad();
  _sbzLoad.add('.activity-info-text', html);
}();

var initDescribe = function () {
  let html = buildTemplate(window.sbzTemplate.describe,
    sbzDataSource.info);

  var _sbzLoad=window.sbzLoad();
  _sbzLoad.add('.activity-describe', html);
}()

var initFile = function () {
  let html = buildTemplate(window.sbzTemplate.activityFile,
    sbzDataSource.info);

  var _sbzLoad=window.sbzLoad();
  _sbzLoad.add('.activity-file', html);
}()


