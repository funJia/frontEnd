class BuildTemplate {
    constructor() {

    }
    static Build(source, data, cb) {
        var render = template.compile(source);
        let html = render(user);
        if (cb && typeof (cb) === 'function') {
            cb();
        }
    }
}

export default BuildTemplate