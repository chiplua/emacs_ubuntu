1.建立cscope的index文件
最一般的方式是在源代码目录运行cscope -bR,-b代表build源码的index数据库，-R表示包括子文件夹,cscope在源代码的根目录生成index文件cscope.out但是在默认情况下，cscope在建库时不会引入cpp文件，如果是cpp的项目需要现找到所有的c，cpp文件，然后再用cscope建立index
＃找到所有的c,cpp,h文件
find . -name "*.cpp" -o -name "*.c" -o -name "*.h" > cscope.files
# 根据cscope.files生成database
cscope -b -i cscope.files
这样也太麻烦了把？！其实大家都这么想，在cscope的源代码包中，在contrib/xcscope中有一个文件cscope-indexer,就完成了上述功能，搜索文件夹，并且建cscope的index,比如opensuse并没有把这个文件打到cscope的包中，所以建议大家自己去下载源代码包,把这个文件拷贝到/bin下面，就可以直接用了。


2. 搜索的跳转
快捷键可以根据自己的喜好定义,先运行 M-x cscope-index-files，生成代码的index。用cscope-find-global-definition-no-prompting跳转到定义，用cscope-find-this-symbol搜索所有的引用xcscope.el也比较简单，很多配置项都写死了，没法修改，比如在跳出的cscope窗口中,选择要跳转到哪一个位置,有2种方式一个是光标移动到函数位置，按回车。令一个是用鼠标中键点击。第2种方式是在是太奇怪了，我想把它改到鼠标左键上,修改xcscope.el文件,mouse-2改成mouse-1就大功告成
