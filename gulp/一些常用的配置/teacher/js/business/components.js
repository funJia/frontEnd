// 分页组件
Vue.component('paging', {
    template: `<div class="pager" v-if="page.total>0">
    <a href="###" @click='begin'>首页</a>
    <a href="###" @click='prev'>上一页</a>
    <a href="###" @click='next'>下一页</a>
    <a href="###" @click='end'>尾页</a>
    <p class="sc_txt">页码：{{page.currentIndex}}/{{page.pageNum}}</p>
    <p class="sc_txt">到第</p>
    <input type="text" class="sc_page" v-model='inputNum' type="number"/>
    <p class="sc_txt">页</p>
    <input type="button" name="button" id="button" value="跳转" class="sc_submit" @click="skipPage">
    <div class="clearfix"></div>
</div>`,
    props: ['total','pageSize'],
    data() {
        return {
            page: {
                pageSize: 20,
                pageIndex: 1,
                currentIndex: 1,
                pageNum: 1,
                total: 10
            },
            inputNum: 1
        };
    },
    watch: {
        total(newVal) {
            this.initPageParams();
        },
        pageSize(newVal)
        {
            this.pageSize.pageSize=newVal;
            this.initPageParams();            
        },
        inputNum(newVal) {
            let temp = this.inputNum;
            if (isNaN(Number(this.inputNum))) {
                this.inputNum = 1;
            }
            else {
                this.inputNum = this.getEffectiveIndx(this.inputNum);
            }
        }
    },
    methods: {
        isDisabled(type) {
            switch (type) {
                case 'prev':
                case 'begin':
                    return this.page.currentIndex == 1 ? true : false;
                case 'next':
                case 'end':
                    return this.page.currentIndex == this.page.pageNum ? true : false;
                default:
                    return false;
            }
        },
        getEffectiveIndx(index) {
            if (index < 1)
                return 1;
            else if (index > this.page.pageNum) {
                return this.page.pageNum;
            }
            else
                return index;
        },
        initPageParams() {
            if (this.total) {
                this.page.total = this.total;
                let num, total = this.total, pageSize = this.page.pageSize;
                num = total / pageSize;
                if (total % pageSize) {
                    this.page.pageNum = parseInt(num) + 1;
                }
                else {
                    this.page.pageNum = num;
                }
            }
            else {
                this.page.total = 0;
            }
        },
        //上一页
        prev() {
            let disabled = this.isDisabled('prev');
            if (disabled)
                return;
            let temp = this.page.currentIndex - 1;
            let index = this.getEffectiveIndx(temp);
            this.getList(index);
        },
        //下一页
        next() {
            let disabled = this.isDisabled('next');
            if (disabled)
                return;
            let temp = this.page.currentIndex + 1;
            let index = this.getEffectiveIndx(temp);
            this.getList(index);
        },
        //首页
        begin() {
            let disabled = this.isDisabled('begin');
            if (!disabled)
                this.getList(1);
        },
        //尾页
        end() {
            let disabled = this.isDisabled('end');
            if (!disabled)
                this.getList(this.page.pageNum);
        },
        //自定义跳到的页码
        skipPage() {
            this.getList(this.inputNum);
        },
        //获取数据
        getList(index) {
            this.page.currentIndex = index;
            this.$emit('call', {pageIndex:index,pageSize:this.page.pageSize});
        }
    },
    mounted() {
        this.page.pageSize=this.pageSize||this.page.pageSize;
        this.initPageParams();
    }
})

//弹框组件
Vue.component('vue-dialog', {
    template: `<div class='vue-dialog'>
            <div class='dialog-head'><span class='title'></span><span class='close'></span>
                <div class='dialog-contianer'>
                <solt name='container'>1111</solt>
                </div>
            </div>
    </div>`,
    mounted() {
        console.log('dialog');
    }
})

//图片上传组件
Vue.component('upload-img', {
    template: `<input type="file" accept="image/*" @change="fileChanged" ref="file" multiple="multiple">`,
    data() {
        return {
            status: 'ready',
            files: [],
            point: {},
            uploading: false,
            percent: 0,
            src:'/2222'
        }
    },
    methods: {
        fileChanged() {
            const list = this.$refs.file.files;
    
           // return;            
            for (let i = 0; i < list.length; i++) {
                if (!this.isContain(list[i])) {
                    const item = {
                        name: list[i].name,
                        size: list[i].size,
                        file: list[i]
                    }
                   // this.html5Reader(list[i], item)
                    this.files.push(item)
                }
            }
            this.$refs.file.value = ''
            this.submit();
        },
        isContain(file) {
            this.files.forEach((item) => {
                if (item.name === file.name && item.size === file.size) {
                    return true
                }
            })
            return false
        },
        // 将图片文件转成BASE64格式
        html5Reader(file, item) {
            const reader = new FileReader()
            reader.onload = (e) => {
                this.$set(item, 'src', e.target.result)
            }
            reader.readAsDataURL(file)
        },
        submit() {
            if (this.files.length === 0) {
                console.warn('no file!');
                return
            }
            const formData = new FormData()
            this.files.forEach((item) => {
                formData.append(item.name, item.file)
            })
            const xhr = new XMLHttpRequest()
            xhr.upload.addEventListener('progress', this.uploadProgress, false)
            xhr.open('POST', this.src, true)
            this.uploading = true
            xhr.send(formData)
            xhr.onload = () => {
                this.uploading = false
                if (xhr.status === 200 || xhr.status === 304) {
                    this.status = 'finished'
                    console.log('upload success!')
                    this.$emit('call', xhr);
                } else {
                    console.log(`error：error code ${xhr.status}`)
                }
            }
        }
    }
})


