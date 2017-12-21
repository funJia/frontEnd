/*
  验证输入的文字是否为数字，
  支持数字为输入法为全角，中文模式下输入的字符
  2017-11-11
  author:jn
 */
function NumberHandle() {
    var option = {
        bindEvent: null,
        cb: null,
        rules:{
            min:0,
            max:10
        }
    }
    var validateNumber = function (event) {
        var value = event.target.value.toString();
        var realNumber = value = value.replace(/[^\d０１２３４５６７８９\.．。]+?/g, '');
        realNumber = realNumber.replace(/[\.．。]+?/g, '.');
        if (realNumber.length == 1) {
            value = realNumber.replace(/[\.．。]+?/g, '');
        }
        try {
            var numberSplit = realNumber.split('.');
            if (numberSplit.length > 2) {//确保只有一个小数点
                value = value.substring(0, value.length - 1);
            }
            else if (numberSplit.length == 2 && numberSplit[1].length > 2) {//保留两位小数
                value = value.substring(0, numberSplit[0].length + 1 + 2);
            }
            realNumber = parseFloat(realNumber);
        }
        catch (ex) {
            value = value.substring(0, value.length - 1);
        }
        event.target.value = value.replace(/[\.．。]+?/g, '.');
        typeof (option.cb) === 'function' && option.cb(value.replace(/[\.．。]+?/g, '.'));
    }

    var bindEvent = function (dom) {
        dom.addEventListener("keyup", validateNumber);
        dom.addEventListener("change", validateNumber);
        dom.addEventListener("blur", validateNumber);
        dom.addEventListener("paste", function (event) {
            setTimeout(() => {
                validateNumber(event);
            }, 10);
        });
    }
    option.bindEvent = bindEvent;
    return option;
}