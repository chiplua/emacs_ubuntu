1.建立cscope的index文件
最一般的方式是在源代码目录运行cscope -bR,
-b代表build源码的index数据库，-R表示包括子文件夹,cscope在
源代码的根目录生成index文件cscope.out

但是在默认情况下，cscope在建库时不会引入cpp文件，如果是cpp的项目
需要现找到所有的c，cpp文件，然后再用cscope建立index
＃找到所有的c,cpp,h文件
find . -name "*.cpp" -o -name "*.c" -o -name "*.h" > cscope.files
# 根据cscope.files生成database
cscope -b -i cscope.files

这样也太麻烦了把？！其实大家都这么想，在cscope的源代码包中，在
contrib/xcscope中有一个文件cscope-indexer,就完成了上述功能，搜索
文件夹，并且建cscope的index,比如opensuse并没有把这个文件打到
cscope的包中，所以建议大家自己去下载源代码包,把这个文件拷贝到
/bin下面，就可以直接用了。

