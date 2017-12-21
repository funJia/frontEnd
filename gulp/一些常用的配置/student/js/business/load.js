window.sbzLoad = function sbzLoad(option) {
    if (!window.sbzLoad.loadList) {
        window.sbzLoad.loadList = [];
        window.sbzLoad.option = {
            loaded: true,
            render: function () {
                if (this.loaded) {
                    window.sbzLoad.loadList.map(function (item) {
                        $(item.dom).html(item.html);
                    })
                }
            }
        };
    }

    return {
        add: function (dom, html) {
            window.sbzLoad.loadList.push({
                dom: dom,
                html: html
            });
            window.sbzLoad.option.render();
        },
        render: function () {
            window.sbzLoad.option.loaded = true;
            window.sbzLoad.option.render();
        }
    }
}