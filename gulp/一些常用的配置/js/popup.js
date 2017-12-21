function popup(popupName) {
  var _scrollHeight = $(document).scrollTop(),//获取当前窗口距离页面顶部高度
  _windowHeight = $(window).height(),//获取当前窗口高度
  _windowWidth = $(window).width(),//获取当前窗口宽度
  _popupHeight = popupName.height(),//获取弹出层高度
  _popupWeight = popupName.width();//获取弹出层宽度
  _posiTop = (_windowHeight - _popupHeight) / 2 + _scrollHeight;
  _posiLeft = (_windowWidth - _popupWeight) / 2;
  popupName.css({ "left": _posiLeft + "px", "top": _posiTop + "px", "display": "block" });//设置position
}

function ShowHide(popupdiv, cancelbtn) {
  var Pdiv = "#" + popupdiv;
  var Cbtn = "#" + cancelbtn;
  popup($(Pdiv));
  $("<div id='mask' onclick=\"mask_click()\"></div>").addClass("mask").appendTo("body").fadeIn(200);

  var bodyHeight = $("body").height();
  var winHeight = $(window).height();
  if (bodyHeight > winHeight) {
    $("#mask").css("height", bodyHeight);
  } else {
    $("#mask").css("height", winHeight);
  }



  //	$("body").css({"overflow":"hidden","height":"100%"});

  $(Cbtn).click(function () {
    $(Pdiv).hide();
    $("#mask").remove();
    $("body").css({ "overflow": "auto", "height": "100%" });
  });

  $("[name='close']").click(function () {
    $(Pdiv).hide();
    $("#mask").remove();
    $("body").css({ "overflow": "auto", "height": "100%" });
  });

  $("#close").click(function () {
      $(Pdiv).hide();
      $("#mask").remove();
      $("body").css({ "overflow": "auto", "height": "100%" });
  });

}

function mask_click() {
  $("#mask").remove();
  $(".popup_box").hide();
}