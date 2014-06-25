在新装的系统中快速搭建环境，除了sudo apt-get install emacs cscope,还需要如下步骤。（需要拷贝到别的目录的文件如下）：
(1)sudo cp ～/.emacs.d/cscope-indexer-java  /usr/bin/cscope-indexer-java
(2)cp ~/.emacs.d/.emacs ~/.emacs
(3)安装ibus中需要判断中间ibus的demo进程需要使用python-xlib，所以$sudo apt-get install python-xlib 
		(a).安装ibus-el，为省去繁琐的步骤，直接用"sudo apt-get install ibus-el"就行啦！
		(b).在~/.emacs下加入这句“(add-hook 'after-init-hook 'ibus-mode-on)”，保存重启

		现在，你已经可以用 Ctrl+Space 切换到ibus啦！是不是很兴奋？不过你可能还不满足，想用 Ctrl+Space 做mark-set功能，用emacs的默认输入法切换快捷键 		Ctrl+\ 做中英文切换，那你就需要跟着我往下做啦。

		(c).在~/.emacs下加入"(require 'ibus) "(为了激活下面的语句)
		(d).在其后加入
		(global-set-key (kbd "\C-\\") 'ibus-toggle)     //激活Ctrl+\切换
		(ibus-define-common-key ?\C-\s nil)               //取消Ctrl+Space的切换
		好啦，现在可以用 Ctrl+Space mark 用 Ctrl+\ 切换啦，哈哈，赶紧去试试吧！
(4)在auto-complete.el自动补全中使用scite的补全功能查看函数的定义按如下步骤操作：
		(a).先安装scite  sudo apt-get install scite
		(b).安装中文包：wget http://scite-files.googlecode.com/svn-history/trunk/translations/locale.zh_cn.properties
		       mv locale.zh_cn.properties locale.properties
		       sudo mv locale.properties  /usr/share/scite
		(c).设置api所在的路径
		      cd /usr/share/scite/
		      sudo mkdir api
		      sudo cp ~/.emacs.d/auto-complete-1.3.1/ac-scite-api-directories/*.api    ./
                (d).api下载的页面在http://code.google.com/p/scite-files/wiki/Customization
(5)如何安装编译一个新的cedet
                (a).把新的cedet放置到~/.emacs.d/下
                (b).在emacs中打开~/.emacs.d/cedet/cedet-build.el
                (c).M-x eval-buffer
                (d).M-x cedet-build-in-default-emacs
                (e).编译过程中如果发生超过emacs堆栈大小的错误，退出emacs再重新编译即可。
(6)安装auctex: sudo apt-get install auctex.
(7)安装




cscope
1.建立cscope的index文件
最一般的方式是在源代码目录运行cscope -bR,-b代表build源码的index数据库，-R表示包括子文件夹,cscope在源代码的根目录生成index文件cscope.out但是在默认情况下，cscope在建库时不会引入cpp文件，如果是cpp的项目需要现找到所有的c，cpp文件，然后再用cscope建立index
＃找到所有的c,cpp,h文件
find . -name "*.cpp" -o -name "*.c" -o -name "*.h" > cscope.files
# 根据cscope.files生成database
cscope -b -i cscope.files
这样也太麻烦了把？！其实大家都这么想，在cscope的源代码包中，在contrib/xcscope中有一个文件cscope-indexer,就完成了上述功能，搜索文件夹，并且建cscope的index,比如opensuse并没有把这个文件打到cscope的包中，所以建议大家自己去下载源代码包,把这个文件拷贝到/bin下面，就可以直接用了。
cscope-indexer对java文件支持：
cscope-indexer 默认只会扫描 C/C++ 的源码文件。所以其实只要修改 cscope-indexer，把第 140 行从原来的   egrep -i '\.([chly](xx|pp)*|cc|hh)$' | \
改为：
 egrep -i '\.([chly](xx|pp)*|cc|hh|java|aidl)$' | \
 之后就可以用c-c s I在eamcs中创建Android项目的索引了。
 在~/.emacs.d/下的cscope-indexer的140行已经做好了修好。每次重新安装完cscope之后要把
 sudo cp ~/.emacs.d/cscope-indexer /usr/bin/cscope-indexer

2. 搜索的跳转
快捷键可以根据自己的喜好定义,先运行 M-x cscope-index-files，生成代码的index。用cscope-find-global-definition-no-prompting跳转到定义，用cscope-find-this-symbol搜索所有的引用xcscope.el也比较简单，很多配置项都写死了，没法修改，比如在跳出的cscope窗口中,选择要跳转到哪一个位置,有2种方式一个是光标移动到函数位置，按回车。令一个是用鼠标中键点击。第2种方式是在是太奇怪了，我想把它改到鼠标左键上,修改xcscope.el文件,mouse-2改成mouse-1就大功告成


3.ECB窗口对鼠标定位的支持
我这里改动是用改动脚本的方式。或者采用一下方法：
默认情况下，使用鼠标点击ECB窗口中的内容，不起作用，并不能打开它，要回车才可以。可以在Emacs中执行“M-x ecb-customize-most-important”，找到“Ecb Primary Secondary Mouse Buttons”选项，将其设为“Primary: mouse-1, secondary: mouse-2”，并且以“Save for Future Sessions”保存。


4.Config JAVA ENV
分为两部分:
第一：配置emacs+jaee+elib+ecb+cedet
第二：配置使用cscope浏览java
第一部分内容如下：
============================================================================ 
本文的最初版本可于http://forum.ubuntu.org.cn/viewtopic.php?t=109439看到（三楼）。 
http://www.ibm.com/developerworks/cn/java/joy-emacs/在这里可以看到JDEE的部分优点。 
http://jdee.sunsite.dk/jdedoc/html/jde-ug/jde-ug.html此为JDEE使用手册（英文）。 
============================================================================ 
本文参照了http://www.ibm.com/developerworks/cn/java/joy-emacs/以及http://jdee.sourceforge.net/install.html上的资料。（推荐想安装这个东东的人看一下这两个网站……尽管非本人完全独立实现，但是转载请注明出处……嗯嗯，我是为了给咱们的Ubuntu中文作宣传……） 
============================================================================ 
所需文件： 
1、cedet-1.0pre4.tar.gz （可以从http://sourceforge.net/project/showfiles.php?group_id=17886&release_id=513873取得。） 
2、elib-1.0（从http://jdee.sunsite.dk/elib-1.0.tar.gz取得。） 
3、JDEE（从http://sourceforge.net/project/showfiles.php?group_id=210946取得。） 
============================================================================ 
步骤： 
1、下载elib，解压到某文件夹中（比如我就是/home/lavender/Install/Java-Emacs。据说放到Emacs的安装目录下更好，但由于本人没有找到这个目录，所以……）。 
2、下载cedet、JDEE，解压到某目录中（建议和elib放到同样位置）。 
3、在终端下定位到cedet的目录下，make（通过cedet下的INSTALL可获得更多信息。）。 
4、现在你应该有cedet、jde和elib三个文件夹了。打开.emacs，加入如下代码（在这里假定它们三个文件夹都在/home/lavender/Install/Java-Emacs下。）： 

代码:
;; Set the debug option to enable a backtrace when a
;; problem occurs.
;; 当有问题出现显示错误信息，便于调试
(setq debug-on-error t)
;; Update the Emacs load-path to include the path to
;; the JDE and its require packages. This code assumes
;; that you have installed the packages in the emacs/site
;; subdirectory of your home directory.
;; 加载所需的package

(add-to-list 'load-path "~/Install/Java-Emacs/cedet-1.0pre4/eieio")
(add-to-list 'load-path "~/Install/Java-Emacs/cedet-1.0pre4/semantic")
(add-to-list 'load-path (expand-file-name "~/Install/Java-Emacs/jde-2.3.5.1/lisp"))
(add-to-list 'load-path (expand-file-name "~/Install/Java-Emacs/cedet-1.0pre4/common"))
(load-file (expand-file-name "~/Install/Java-Emacs/cedet-1.0pre4/common/cedet.el"))
(add-to-list 'load-path (expand-file-name "~/Install/Java-Emacs/elib-1.0"))

;; If you want Emacs to defer loading the JDE until you open a
;; Java file, edit the following line
;; 不自动加载jde-mode
(setq defer-loading-jde t)
;; to read:
;;
;;  (setq defer-loading-jde t)
;;
;; 编辑.java文件时加载jde
(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
       (append
        '(("\\.java\\'" . jde-mode))
        auto-mode-alist)))
  (require 'jde))

中间独立的一部分的内容是因机器而异的。其实它们分别是：cedet下的eieio、cedet下的semantic、jde下面的lisp、cedet下面的common、common下的cedet.el以及elib的位置。 
5、保存。 
============================================================================ 
从此以后就可以在Emacs中舒服地写Java程序了……C-c C-v C-c编译并检查错误，C-c C-v C-r运行程序！当然，费了这么多精力得到的回报远远不止是这一点……请访问http://www.ibm.com/developerworks/cn/java/joy-emacs/及http://jdee.sunsite.dk/jdedoc/html/jde-ug/jde-ug.html获得详细信息……

第二部分内容如下：
Using cscope with Emacs to browse Java source codes.
cscope can be used to browse Java symbols too. Use these commands at the top-level directory to create the index:
Enter into the source directory. Here I want to browse android source code. Hence I will cd into android source directory then execute below commands.
$ find . -name “*.java” > cscope.files
$ cscope -b
Then add this line at the bottom of xcscope.el to load cscope-mode whenever a Java file is opened:
(add-hook ‘java-mode-hook (function cscope:hook))
In my system the xcscope.el is located in /usr/share/emacs/site-lisp/xcscope.el 
Then use the xcscope in emacs as usual. If you are using a single command cscope-indexer -r to gnerate the cscoape database then use the below hack.
sudo cp /usr/bin/cscope-indexer /usr/bin/cscope-indexer-java
sudo vim /usr/bin/cscope-indexer-java
search for a line similar to “egrep -i ‘\.([chly](xx|pp)*|cc|hh)$’ | \“  and modifiy it as below
egrep -i ‘\.([chly](xx|pp)*|cc|hh|java)$’ | \
Now you can use a single command to genateate the database. Goto the source directory and use below command.
$ cscope-indexer-java -r    (最后一步用单个命令生成JAVA的cscope.file没有成功)


5.去掉代码中的^M
(1).C-x RET c undecided-unix RET C-x C-w RET y
(2).M-S 

6.字符串后面一旦输入左括号后，字符串和左括号就会一起后退。要解决这个问题就要在对应的模式中把C（C++）->Toggle->Electronic mode勾掉。



7.auto-complete自动不全的网址http://cx4a.org/software/auto-complete/   http://emacser.com/emacs-gccsense.htm该网址中gccsense并没有添加。


auctex
1.直接google上面找到的源码，放到emacs配置目录/home/username/.emacs.d中，并在emacs 配文件/home/username/.emacs中添加了一段配置脚本，配置脚本中的preview-latex.el可能auctex中没有，直接用这个文件名称google之，很容易找到。找到之后将这个文件放在auctex解压缩之后的目录中，和auctex.el在一起即可。
2.对于在Letex中什么时候需要加$（必须要成对出现）,什么情况下才需啊加$? m_n这样的格式就需要添加，添加后如下：$m_n$
3.对于要查看pdf文档的命令应该是：c-c,c-v。一般用c-c,c-l是查看编译的结果。
4.对于org-mode要生成html文件的花，需要执行的命令为c-c,c-e,c-h
5.Org-mode加了下划线输出成html时老是要变成下标，现在已解决：只要在文件头写上#+OPTIONS: ^:nil即可
6.Ubuntu 使用emacs+auctex编译tex文档
首先是安装emacs
sudo apt-get install emacs
搞定。
然后安装auctex
由于我下载安装了texlive 2008,而没有使用源里的旧版本，所以不能直接apt-get install auctex了，因为这样会要求你从源里
安装texlive。下载安装之。
从gnu网站下载auctex-11.85（http://www.gnu.org/software/auctex/ ），例如下载到主目录下，解压。
cd auctex-11.85
./configure --with-emacs #（注意--with-emacs参数，如果不使用此参数，emacs找不到auctex）
make
make install
安装完成。
编辑~/.emacs文件（没有的话，自己新建），令emacs加载auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
这时用emacs打开一个.tex文件，会看到菜单栏上多了Preview、LaTeX、Command菜单项（auctex成功安装）
设置xelatex为默认编辑命令，evince为pdf文件阅读器
再在~/.emacs中添加以下命令：
(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
(add-hook 'LaTeX-mode-hook
(lambda()
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
(setq TeX-command-default "XeLaTeX")))
就可以使用C-c C-c编译tex文件(C-c C-c后default提示输入：XeLaTeX)，使用C-c C-v使用evince阅读生成的pdf文件。

latex中文支持
环境
  系统：Ubuntu Desktop 12.04 x86_64
  Latex：texlive2012
  编辑器：GNU Emacs 23.3.1+Auctex
缘起
最初安装的Ubuntu Desktop 12.04系统是英文版的，手动添加了中文字体在 /usr/share/fonts目录下面。最近由于写文章需要，由于以前用过一段时间windows+office， 再转过来使用linux下面的office软件，大部分都感觉不是很舒服，可能因为没有花时间找吧。目前对于word文档之类的都暂时使用永中Office，主要都是修改word文档或者与别人交 流的时候只能使用word文档的情况才会用到。因此，就慢慢寻找linux下面的文本编辑器。 在试用的过程中逐渐把目标定在了Emacs+Latex+Autex这个组合上面了。因为之前写的英文 文章，latex的中文支持就一直都没有放在心上，也没有尝试去解决。但现在需要写毕设论文了，因为已经喜欢上了latex编辑器，当然就想着试试。但最初的中文尝试并不顺利，试过大部分自己在网上找到的中文解决方法在我这里都不适用。最初问题是编译包含中文字符的源文件都会报错；经过一番修改调整之后，问题演变为，编译中英文混排的源文件没有问 题，但生成的pdf文件就是不显示中文，该出现中文字符的位置上都是空格代替。在后一个问题上面纠结了两三天都没有解决。就果断卸载重装。
新环境安装过程
texlive2012
下载
从google中找到下面的链接地址 http://www.tug.org/texlive/acquire-iso.html，直接下载到目录（假设为/home/username/Downloads）
挂载
下载到你的目录中之后，对于iso文件，linux可以直接挂载
 mount -t iso9660 -o ro,loop,noauto /home/username/Downloads/texlive2012.iso /mnt/disk
安装
安装过程有两个途径：文本（text）和图形界面（gui)， 我选择的是图形界面下安装；
安装perl-tk（图形界面的安装需要用到）：
sudo apt-get install perl-tk

安装texlive2012：
/mnt/disk/install-tl -–gui
在出现的安装界面中，第二步需要选择语言支持，默认是全选的，但有些基本上用不上，我 选的是CJK（中日韩文）和英文；其他的就默认安装即可；

环境变量
安装结束之后，在shell窗口中会有些提示很重要（以后加上截图）。意思是，这样安装结 束之后，直接输入latex或者xelatex，系统会提示没有此命令，主要是因为环境变量PATH中 没有此命令安装的路径；需要将latex命令的路径 “/usr/local/texlive/2012/bin/x86_64‐linux:”添加到PATH变量中；
注意：添加环境变量可选择的配置文件有三个以上，他们是有区别的；

1）在/home/username/.bashrc或者/home/username/.profile中添加

export PATH=/usr/local/texlive/2012/bin/x86_64‐linux:$PATH;
2）在/etc/profile 中添加

export PATH=/usr/local/texlive/2012/bin/x86_64‐linux:$PATH;

或者直接在/etc/environment中修改PATH变量，结尾处双引号之前加
:/usr/local/texlive/2012/bin/x86_64-linux
这种添加方式等于修改原系统默认的PATH。

第一种情况下，用户每开启一个shell窗口，都会自动执行配置文件中的命令，因此，能够 在shell中输入latex或者xelatex就显示相应命令提示；但如果想在emacs中使用，还是会出 错的，因为PATH变量只有在启动shell时才会执行。emacs调用时并不会执行，也就是emacs 调用latex时，仍然找不到latex的路径；这时就需要第二种方法； 第二种情况是在系统启动的过程中，执行一次之后，在整个系统活动过程中，都是有效的。 这是不需要第一种情况的修改，用户启动shell窗口调用latex和emacs中C-c C-c自动调用 latex都能够找到latex命令的路径。
二者区别就如同用户级环境变量和系统级环境变量，而emacs自动调用时用到的是后者。
添加完latex执行命令的路径之后，还需要添加其他两个，主要是在帮助文档显示的过程中 用到，例如，man latex 同样加入/etc/profile文件最后
MANPATH=/usr/local/texlive/2012/texmf/doc/man:$MANPATH; export MANPATH
INFOPATH=/usr/local/texlive/2012/texmf/doc/<info:$INFOPATH>; export INFOPATH
 接着，在帮助文档/etc/manpath.config加入

 MANPATH_MAP /usr/local/texlive/2012/bin/x86_64-linux /usr/local/texlive/2012/texmf/doc/man
中文配置过程
下载字体
使用windows下的某些字体和Adobe字体。windows字体直接从C:\Windows\Fonts∼*拷贝即 可，adobe字体需要下载，直接google就能够找到，adobe字体是*.otf文件。 接下来创建Windows字体目录winfonts和Adobe字体目录adobefonts：
sudo mkdir /usr/share/fonts/winfonts
sudo mkdir /usr/share/fonts/adobefonts
拷贝字体

我的adobefonts文件夹下的字体有
$ ls /usr/share/fonts/adobefonts/
AdobeFangsongStd-Regular (v5.010).otf  AdobeHeitiStd-Regular.otf  AdobeKaitiStd-Regular (v5.010).otf  AdobeSongStd-Light.otf

winfonts文件夹下的字体有
ls /usr/share/fonts/winfonts/
century_schoolbook_l_bold_italic.ttf  segoesc.ttf   serife.fon     simpfxo.ttf     STFANGSO.TTF   STXINGKA.TTF     sylfaen.ttf
century_schoolbook_l_italic.ttf       segoeuib.ttf  simfang_0.ttf  simpo.ttf       STHUPO.TTF     STxinwei.ttf     symbol.ttf
msyhbd.ttf                            segoeuii.ttf  simfang.ttf    simsunb.ttf     stkaiti.ttf    STzhongsong.ttf
msyh.ttf                              segoeuil.ttf  simhei.ttf     simsun.ttc      STLITI.TTF     STZHONGS.TTF
segoeprb.ttf                          segoeui.ttf   simkai_0.ttf   sserife.fon     STSONG.TTF     SURsong.ttf
segoepr.ttf                           segoeuiz.ttf  simkai.ttf     STcaiyun.ttf    STxihei.ttf    svgafix.fon
segoescb.ttf                          seguisb.ttf   simpbdo.ttf    STfangsong.ttf  STxingkai.ttf  svgasys.fon

将windows字体和adobe字体拷贝到相应的目录之后，修改文件夹下文件的权限为可读可写. 
sudo chmod 644 /usr/share/fonts/winfonts/*
sudo chmod 644 /usr/share/fonts/adobefonts/*

更新字体库
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fsv

查看
系统支持的字体：　　
fc-list | sort
查看系统支持的中文字体：　　

fc-list :lang=zh | sort
texlive中文配置
如果使用xeLATEX的话，需要xeCJK宏包的支持，需要修改 /usr/local/texlive/2012/texmf-dist/tex/latex/ctex/fontset 的 ctex-xecjk-winfonts.def。修改原来的文件如下 

% ctex-xecjk-winfonts.def: Windows 的 xeCJK 字体设置，默认为六种中易字体
% vim:ft=tex
\setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}
\setCJKfamilyfont{zhsong}{SimSun}
\setCJKfamilyfont{zhhei}{SimHei}
\setCJKfamilyfont{zhkai}{KaiTi}
\setCJKfamilyfont{zhfs}{FangSong}
% \setCJKfamilyfont{zhli}{LiSu}
% \setCJKfamilyfont{zhyou}{YouYuan}
\newcommand*{\songti}{\CJKfamily{zhsong}} % 宋体
\newcommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
\newcommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书
\newcommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋
% \newcommand*{\lishu}{\CJKfamily{zhli}}    % 隶书
% \newcommand*{\youyuan}{\CJKfamily{zhyou}} % 幼圆
\endinput




org-mode
先是基本语法：
1.常见使用
*加粗* 加粗
/倾斜/ 倾斜
_下划线_ 下划线

导出文件的标题在特定行给出
#+TITLE: This is the title of the document

目录表通常会直接插入在文档第一个标题之前
#+OPTIONS: toc:2 (目录中只显示二级标题)
#+OPTIONS: toc:nil (无目录)

当从另外一个文档中引用一段话时通过会让它左右都缩进
#+BEGIN_QUOTE
Everything should be made as simple as possible,
but not any simpler -- Albert Einstein
#+END_QUOTE

如果你想让某些文本居中
#+BEGIN_CENTER
Everything should be made as simple as possible, \\
but not any simpler
#+END_CENTER

这是一个很奇葩的功能，当你使用这句语法的时候，输出html，会自动播放你指定的音乐……
#<bgsound src="d:/自用/0/Music/1.mp3" loop=5>
“loop”表示循环次数。

当导出文档时，你可以包含其他文件中的内容。比如，想包含你的“.emacs”文件，你可以用：
#+begin_src org
, #+INCLUDE: "~/.emacs" src emacs-lisp
#+end_src
可选的第二个第三个参数是组织方式（例如，“quote”，“example”，或者“src”），如果是 “src”，语言用来格式化内容。组织方式是可选的，如果不给出，文本会被当作 Org 模式的正常处理。用 C-c , 访问包含的文件。

当 Org 标题含有很多星号并且标题下面的文字缩进
* Top level headline
** Second level
*** 3rd level
some text
*** 3rd level
more text
* Another top level headline
如果你用的 Emacs 23.1.50.3 和 Org 6.29 的更高版本，这种视图可以用 org-indent-mode 模式动态地实现。也可以通过设置变量 org-startup-indented 为所有的文件打开 org-indent-mode 模式，或者用
#+STARTUP: indent

如果你希望为图片定义一个标题，或者一个标签方便内部交叉引用，可以让图片单独一行
#+CAPTION: This is the caption for the next figure link (or table)
#+LABEL: fig:SED-HR4049
[[./img/a.jpg]]

对于需要包含数学符号和特殊方程的科学笔记，Org 模式支持嵌入 LaTeX 代码到文件中。你可以直接使用类 TeX 的宏来输入特殊符号，输入方程，或者整个 LaTeX 环境。
#+begin_src org
,Angles are written as Greek letters \alpha, \beta and \gamma. The mass if
,the sun is M_sun = 1.989 x 10^30 kg. The radius of the sun is R_{sun} =
,6.96 x 10^8 m. If $a^2=b$ and $b=2$, then the solution must be either
,$a=+\sqrt{2}$ or $a=-\sqrt{2}$.
,\begin{equation}
,x=\sqrt{b}
,\end{equation}
#+end_src
特殊设置之后，导出 HTML 时 LaTeX 代码片断会生成图片并包含进来。

关于链接
C-c C-l	编辑链接
C-c C-o	打开链接
链接的格式
[[link][description]] 或者 [[link]]
常用link类型
http://www.sina.com Web
file:paper/lastdoc.pdf 本地文档，用相对路径表示
file:/path/to/filename 本地文档，用绝对路径表示
news:comp.emacs 新闻组
caole82@gmail.com 邮件地址

关于自定义css
#+STYLE: <link rel="emacs" type="/home/mudan/Documents/org/css" href="emacs.css" /> 自定义css
#test{font-size:14px;} 设置字体大小
下面贴一下我的自定义css：
#+STYLE: <link rel="stylesheet" type="text/css" href="C:/Documents and Settings/Mu/My Documents/worg.css" />
#+INFOJS_OPT: view:info mouse:underline up:think_world.html home:http://www.orgmode.org toc:t
我有几个挺好的css文件，打包了一下，可以在链接中下载：http://pan.baidu.com/share/link?shareid=151940&uk=1963878638

段落、分行和引用
段落之间至少要有一空行。如果你想实现段内分行，可以在行后加上“\\”。
要想在一个区域内实现分行，而其他地方使用正常格式，你可以使用下面的语法实行：
#+BEGIN_VERSE
Great clouds overhead
Tiny black birds rise and fall
Snow covers Emacs
-- AlexSchroeder
#+END_VERSE

排版源码
#+begin_src 语言
...
#+end_src 
例如：
#+begin_src c -t -h 7 -w 40
int main(void)
{
printf("Hello, World!\n");
return 0;
}
#+end_src
语法详解：
-n 显示行号
-t 清除格式
-h 7 设置高度为 7 行
-w 40 设置宽度为 40 列

关于导出
C-c C-e l	导出 LaTeX 文件
C-c C-e p	导出 LaTeX 文件，并处理成 PDF 文件（需要格外的LaTeX软件支持）
C-c C-e d	导出 LaTeX 文件，处理成 PDF 文件，并打开
C-c C-e D	导出 DocBook 文件
C-c C-e a	导出 ASCII 文件
C-c C-e 用来导出和发布的调度器（我通常使用这个命令，然后在里面选择导出格式）
当导出文档时，你可以包含其他文件中的内容
#+INCLUDE: "~/.emacs" src emacs-lisp

2.标签使用

C-c C-q 为当前标题输入标签，回车之后，标签会被插入，并放到第 org-tags-column 列。
如果用前缀 C-u，会把当前缓冲区中的所有标签都对齐到那一列。
C-c C-c 当光标处于标题上时，这个命令同 C-c C-q
C-c \ 搜索指定标签名
C-c / m 用匹配标签搜索的所有标题构造一个稀疏树
带前缀参数C-u时，忽略所有还是 TODO 行的标题

标签的前面和后面都应该有一个冒号，例如，“:work:”。可以指定多个标签，就像“:work:urgent:”。标签默认是粗体，并和标题具有相同的颜色。

标签具有大纲树的继承结构。如果一个标题具有某个标签，它的所有子标题也会继承这个标签。例如，在列表
#+begin_src org
* Meeting with the French group :work:
** Summary by Frank :boss:notes:
*** TODO Prepare slides for him :action:
#+end_src
中,尽管没有明确标出,最后一个标题会有标签“:work:”，“:boss:”，“:note:”，和“:action”。
你也可以设定一个标签让所有的标题都继承，就好像标签在包含整个文件的第零级标题中指定了一样。用下面的方法：
#+begin_src org
,#+FILETAGS: :Peter:Boss:Secret:
#+end_src

Org 还支持基于一个标签列表来插入标签。
默认情况这个列表是动态构建的，包含了当前缓冲区中使用过的所有标签。你也可以通过变量 org-tag-alist 在全局设定一个标签的硬列表（hard list）。另外，对于某个特定文件你也可以用下面这几行设置一个默认列表：
#+begin_src org
,#+TAGS: @work @home @tennisclub
,#+TAGS: laptop car pc sailboat
#+end_src

--------------------------------------------------------------------------------
另外，它也实现了一个更快速，称为 /快速标签选择/ （ /fast tag selection/ ）的标签选择方法。这使得你只用按一次键就可以选择或者取消一个标签。
为了使它能很好地工作，需要为常用的标签赋唯一的值。你可以在你的“.emacs”文件中通过设置变量 org-tag-alist 作全局设定。例如，如果你需要在不同的文件中经常要给条目添加标签“:@home:”，这时你就可以像这样设置：
#+begin_src elisp
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))
#+end_src
如果标签只用于当前正在处理的文件，那么你可以这样设置标签选项行：
#+begin_src org
,#+TAGS: @work(w) @home(h) @tennisclub(t) laptop(l) pc(p)
#+end_src

--------------------------------------------------------------------------------
属性认识
C-c C-x p 设置一个属性，会询问属性名和属性值
C-c C-c d 从当前项中删除一个属性
通过设置属性 =“:Xyz_ALL:”= ，你可以为属性 =“:Xyz:”= 设置所有合法的值。
这个特定的属性是有 /继承性/ 的，即，如果你是在第 1 级别设置的，那么会被应用于整个树。当合法的值设定之后，设置对应的属性就很容易了，并且不容易出现打字错误。用CD唱片集为例，我们可以预定义发行商和盒中的光盘数目：
#+begin_src org
,* CD collection
,  :PROPERTIES:
, :NDisks_ALL: 1 2 3 4
,  :Publisher_ALL: "Deutsche Grammophon" Philips EMI
, :END:
#+end_src

3.时间戳
C-c . 询问日期并输入正确的时间戳
当光标处理一个时间戳之上时，是修改这个时间戳，而不是插入一个新的
如果这个命令连用，就会插入一个时间段，加上前缀会附带当前时间
C-c ! 功能同C-c . 但是插入的是一个未激活的时间戳
S-LEFT/RIGHT 将光标处理的时间戳改变一天
S-UP/DOWN 改变时间戳中光标下的项
光标可以处在年、月、日、时或者分之上
当时间戳包含一个时间段时，如 “15:30-16:30”，修改第一个时间，会自动
同时修改第二个时间，以保持时间段长度不变
想修改时间段长度，可以修改第二个时间。

使用 Org 可以记录在一个工程中花在某些特定任务上的时间。
C-c C-x C-i 开始当前条目的计时（clock-in）
会插入一个 CLOCK 关键字和一个时间戳
加上 C-u 前缀，从当前已经计时的任务中选择任务
C-c C-x C-o 停止计时（clock-out）
这会在开始计时的地方插入另一个时间戳
它会直接计算使用时间并插入到时间段的后面如 “=> HH:MM”
C-c C-x C-e 为当前的计时任务更新进度
C-c C-x C-x 取消当前的计时
C-c C-x C-j 跳转到包含当前正在运行的计时的任务条目

时间戳是一个具有特定格式的日期（可能带有时间和时间段）说明，例如 ~<2005-10-01~ ~Tue>~ ， ~<2003-09-16~ ~Tue~ ~09:39>~ ，或者 ~<2003-09-16~ ~Tue~ ~12:00-12:30>~ 。
时间戳可以出现在树条目的标题和正文的任何地方，同时能使条目只在特定的日期才出现在议程列表中。

一个简单的时间戳只是给一个条目加上时间和日期。这跟在纸质的议程上写下约会和事件是一样的。
#+begin_src org
,* Meet Peter at the movies <2006-11-01 Wed 19:15>
,* Discussion on climate change <2006-11-02 Thu 20:00-22:00>
#+end_src

一个时间戳可以包含一个时间间隔，表示事件不只在指定的时间发生，还在每隔一个特定的时间如 N 天（d）、周（w）、月（m）或者年（y）之后重复发生。下面的事件每周二在议程中显示：
#+begin_src org
,* Pick up Sam at school <2007-05-16 Wed 12:30 +1w>
#+end_src

为了能定义更复杂的时间，Org 模式支持 Emacs 日历/日记包（calendar/diary package）中的日记条目（日记样式的 sexp 条目）。例如：
#+begin_src org
,* The nerd meeting on every 2nd Thursday of the month
, <%%(diary-float t 4 2)>
#+end_src

两个时间戳用‘--’连接起来就定义了一个时间段：
#+begin_src org
,** Meeting in Amsterdam
, <2004-08-23 Mon>--<2004-08-26 Thu>
#+end_src

非激活的时间戳，跟普通时间戳一样，但是这里是方括号而不是尖括号。这种时间戳是未激活的，它不会让一个条目显示在议程中。
#+begin_src org
,* Gillian comes late for the fifth time [2006-11-01 Wed]
#+end_src

有些任务需要一再重复出现。Org 模式在截止期限、计划安排和普通时间戳中用所谓的中继器来管理这种任务。在下面的例子中：
#+begin_src org
,** TODO Pay the rent
, DEADLINE: <2005-10-01 Sat +1m>
#+end_src
+1m 是一个中继器；上面的意思是任务有一个截止期限 ~<2005-10-01>~ ，并从这个日期开始每月都重复出现。

4.表格使用
TAB/RET/C-c C-c 表格自动调整
M-UP/DOWN 上/下移当前行
C-c - 在当前行下面添加一个水平线，如果带前缀，则在上面添加一行水平线 
C-c | 将活动区域（选中区域）转换成一个表
如果第一行至少有一个 TAB 字符，就用 TAB 划分内容；如果第一行都有逗号，就分逗号划
分内容；否则就用空白符来划分区域。如果当前没有活动区域就会建立一个空的 Org 表格。

给表格添加标题：
#+CAPTION: 表格的标题
#+LABEL: tbl:table_label1

#+srcname 3_1
#+begin_src org
,| Name | Pone | Age |
,|-------+------+-----|
,| Peter | 1234 | 17 |
,| Anna | 4321 | 25 |
#+end_src
表格的缩进程度可以在第一行设定。以“|-”开头的一行会作为一个水平分隔行，当它下次调整排列时会将‘-’扩展至填充整行。所以想要建上面的那个表格，只需键入：
#+srcname 3_2
#+begin_src org
,|Name|Phone|Age|
,|-
#+end_src
然后 TAB 排列表格。还有一个更快的方法就是键入|Name|Phone|Age，再 C-c RET。

5.remember 收集工具
Inbox,在 GTD 的定义里面是收集材料的工具。最好的 Inbox 工具是纸和笔。而 Remember 在 Org mode 里面算是较好的 Inbox 工具。它比每次打开 org 文件来写好非常非常多。

配置和基本使用remember.el在emacs23以上版本是自带的，emacs22及以下版本如果发现没有自带，请自行放狗搜。
(setq org-default-notes-file "~/.notes")

在.emacs中作如上设置，表示你希望将remember产生的note存放在~/.notes中，要我说这可一点也不重要，重要的是下面这一行：
(define-key global-map [f12] 'org-remember)

--------------------------------------------------------------------------------
快键键
C-c C-c 保存
C-c C-k 取消

--------------------------------------------------------------------------------
模版
一天可能乱七八糟的出现不少想法，每次都按F12来记录是好的，晚上回家一看，~/.noet里面充满了记录，一条一条分门另类地复制了不同的org文件中。我承认这是重要的工作，无可避免。可是有些想法我在记录的时候就知道它应该是todo还是普通的笔记，能不能让它们自动归位呢？
先贴配置文件：

(setq org-remember-templates
'(("TODO" ?t "* TODO %?\n %x\n %a" "~/doc/org/home.org" "Tasks")
("IDEA" ?i "* IDEA %?\n %i\n %a" "~/doc/org/home.org" "Idea")
))

它的参数是这样的，”TODO”是这个模版的名,”?t”是快捷键，”* TODO %?\n %x\n %a”是整个模版体，然后是该模版要保存的文件，保存后的项目在文件中处于哪个父节点下面(如果没有会自动新建)。

这样当你按下F12（这是我的快捷键）时，会看到buffer被切分成两块，下面出现一个rememeber fuffer。以及一个输入提示，按我们之前的设定，出现两个快捷提示。
这时按下“t”,在remember buffer中，会自动接模版体的格式显示出补好的TODO,第一行是“* TODO”，第二行是%x，%x是你触发remember时kill ring（类似于剪贴板）中的内容。最后一行是%a，一个指向你触发remember的地方的link。
这时如果你按下”C-c C-c”保存，这一条TODO项目将会被送到”~/doc/org/home.org”文件中的”Tasks”条目下面。

现在开始说一下 org mode 里面一个特复杂的功能——TODO，时间及任务管理。
额，这个功能是基于“严肃”的GTD理念开发，所以不知道GTD的，可以先百度、Google一下，在回来看。
当然，如果认为不需要，直接无视吧……

6.使用TODO
C-c C-t 将当前项的状态在（unmarked）->TODO->DONE 之间循环切换
C-c / t 在稀疏树中显示 TODO 项，同时显示 TODO 项和它们所在的层次的标题
C-c a t 显示全局 TODO 列表，将从所有的议程文件中收集 TODO 项到一个缓冲区中
S-M-RET 在当前项下插入一个新的 TODO 项

--------------------------------------------------------------------------------
用 TODO 关键字来定义不同的状态，用以处理项，比如：
#+begin_src lisp
(setq org-todo-keywords
'((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
#+end_src
竖直线将 TODO 关键字（还需要进一步的动作）和 DONE 状态（不需要进一步的动作）分隔开。如果你不给出竖直线，最后一个状态会作为 DONE 状态。设置之后，C-c C-t 就会将状态从 TODO 转换到 FEEDBACK，再转换到 VERIFY，最后到 DONE 和 DELEGATED。

--------------------------------------------------------------------------------
有时你可能希望同时使用几个不同的 TODO 状态集合。例如，你可能想要一个基本的 TODO/DONE，以及一个修改 bug 的工作流程和一个隔开的状态来表示取消的项目（既还是 DONE，也不需要进一步的动作），你可以这样设置：
#+begin_src elisp
(setq org-todo-keywords
'((sequence "TODO(t)" "|" "DONE(d)")
(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
(sequence "|" "CANCELED(c)")))
#+end_src
关键字应该各不相同，这样对于一个选项 Org 才知道该用哪个状态序列（集合）。例子中也给出了快速使用一个关键字的方法，就是在关键字后面括号中给出快捷字母——当用 C-c C-t时，会询问，让你输入一个字母。

要定义只在一个文件中有效的 TODO 关键字，可以在文件中任意地方给出下面的文本：
#+begin_src org
,#+TODO: TODO(t) | DONE(d)
,#+TODO: REPORT(r) BUG(b) KNOWNCAUSE(k) | FIXED(f)
,#+TODO: | CANCELED(c)
#+end_src
当改变这些行中的一行后，光标停留在改变行上，用 C-c C-c 让改变生效。

--------------------------------------------------------------------------------
很多时候将一个大的任务分成几个的易于完成的小任务是明智的，你可以通过在TODO项目下新建一个大纲树，并在子树上标记子任务来实现这个功能。
为了能对已经完成的任务有个大致的了解，你可以在标题的任何地方插入‘[/]’或者‘[%]’。当每个子任务的状态变化时，或者当你在标记上按 C-c C-时，这些标记状态也会随之更新。例如：
#+begin_src org
* Organize Party [33%]
** TODO Call people [1/2]
*** TODO Peter
*** DONE Sarah
** TODO Buy food
** DONE Talk to neighbor
#+end_src

当纯文本中的项以‘[]’开头时，就会变成一个复选框。
复选框不会包含在全局 TODO 列表中，所以它们很适合地将一个任务划分成几个简单的步骤。下面是一个复选框的例子：
#+begin_src org
,* TODO Organize party [1/3]
, - [-] call people [1/2]
, - [ ] Peter
, - [X] Sarah
, - [X] order food
, - [ ] think about what music to play
#+end_src
复选框是分层工作的。所以如果一个复选框项目如果还有子复选框，触发子复选框将会使该复选框变化以反映出一个、多个还是没有子复选框被选中。

C-c C-c 触发复选框的状态或者（加上前缀）触发复选框的的存在状态
M-S-RET 增加一个带有复选框的项。这只在光标处于纯文本列表项中才起使用

--------------------------------------------------------------------------------
最基本的日志功能是跟踪一个特定项目的完成。这可以这样实现：
#+begin_src elisp
(setq org-log-done 'time)
#+end_src
这时当你将一个项目从一个 TODO（未完成）状态改变为一个完成状态时，标题下面就会插入一行 “CLOSED:[timestamp]”。如果你想和时间戳一起作一个记录，用：
#+begin_src elisp
(setq org-log-done 'note)
#+end_src
这时会提示你输入一个记录（note），并将它保存在标题为“Closing Note”项目之下。

--------------------------------------------------------------------------------
你可能想跟踪 TODO 状态的变化。可以只记录一个时间戳，也可以为变化作一个带时间戳的记录。记录会被插入到标题之后形成列表。当有很多记录之后，你可能希望将记录取出放到抽屉里。通过定制变量 org-log-into-drawer 可以实现这个功能。
对于状态记录，Org 可以实现基于每个状态关键字的设置。实现方法是在每个后的括号中指定“！”（记录时间戳）或“@”（作一个记录）。例如：
#+begin_src org
,#+TODO: TODO(t) WAIT(w@/!) | DONE(d!) CANCELED(c@)
#+end_src
将会设置 TODO 关键字和快速访问字母，以及当一个项目设为 DONE 时，会记录时间戳，当状态变为 WAIT 或 CANCELED 时，会作一个记录。这个语法也适用于变量 org-todo-keywords。

--------------------------------------------------------------------------------
如果你广泛地使用 Org 模式，这样你就会有大量的 TODO 项。给它们设定优先级就很有必要。可以在 TODO 项的标题中加入一些标记（cookie）来设置它们的优先级，像这样：
#+begin_src org
,*** TODO [#A] Write letter to Sam Fortune
#+end_src
Org模式支持三个优先级别：’A‘、’B‘和’C‘。’A‘是最高级别，如不指定，’B‘是默认的。优先级只在议程中有用。

C-c , 设置当前标题的优先级
S-UP/Down 增加/减少当前标题的优先级
--------------------------------------------------------------------------------
用org-mode来做TODO管理，那么无法避免的是，随着时间的流逝，被DONE的事件会越来越多，那么TODO被会被夹杂在DONE之间，难以查找。同时，由于后期回顾的需要，你也不想简单地将DONE事件删除掉。这个时候，你就需要归档命令了。归档，就是把你不想天天看到的东西，放到你看不到了，或者不怎么影响你的注意力的地方去。org-mode提供了两种归档方式。

内部归档
内部归档是在本文件内部给特定子树打上 ACHIVED 标签或者移动到名为 ACHIVED 的子树中去并打上标签。这个被认为是 ACIVED 的子树，会被移动了本级子树的最末端。
C-c C-x a 将某一个节点打上ARCHIVE标签
C-c C-x A 将当前节点归入一个名为Archive的子树中
并且这个子树是位于当前级别子树的最下方

外部归档
外部归档是指把子树移动到另一个org文件中去。文件名可以自定义。默认情况下，归档的子树会被移动到名为“当年文件名_archived”的文件中去。
C-c C-x C-s 把当前的节点移到archived文件中去。

--------------------------------------------------------------------------------
周期性 TODO
这我觉得是一个必不可少的功能……
只要对任务开始日期稍加修改，Org Mode 就能够管理周期性代办事项。比如周四要开会，可以设置如下代办事项：
* TODO 开会
SCHEDULED: <2009-01-22 四>
如果是每周四都开会，就改写成如下的样子：
* TODO 开会
SCHEDULED: <2009-01-22 四 +1w>
1w表示每周，另外1d表示每天，1m表示每月。对于周期性的任务， C-c C-t 每次将开始日期修改为相应的下一次开始日期，并保持 TODO 状态不变。

通常情况下，任务开始日期总是严格地按照预定间隔变动，但是当我们需要忽略 掉已经过期的日期时，就可以使用 ++ 或者 .+ 来修饰时间间隔，如
<2009-01-22 四 ++1w>
的下一次日期一定是今天之后的第一个星期四，而
<2009-01-22 四 .+1w>
的下一次日期是按今天算起的下一个星期，也就是说，不一定是星期四；如果今天是星期二，那么下一次开始日期就是星期二。



7.议程文件认识
所谓议程，简单说就是比如你今天晚上计划好明天要做到事情，并添加到TODO文件（前提是文件已经加入到议程文件列表），等到第二天你只需要打开议程界面就可是知道今天应该做什么……

C-c [ 将当前文件加入到议程文件列表中
如果文件已经在列表中，会被移到前面带有前缀时，文件添加/移到到后面
C-c ] 将当前文件从议程文件列表中删除
C-, 遍历议程文件列表，依次访问其中的每一个文件

C-c a M-x org agenda 打开议程调度器
a 日历式的议程
t/T TODO 项的列表，T 可选择TODO关键字
m/M 匹配某个标签表达式的标题的列表，可匹配属性
L 给出 Org 文件中所有带时间戳条目的排序视图
带有 C-u 前缀时，没有完成的 TODO 项也列在当前日期下
s 通过关键字和/或正则表达式选中的条目的列表

Org 可以跟 Emacs 的约会提醒功能结合。想添加议程文件中的约会提醒，可以使用命令 org-agenda-to-appt。

自定义搜索的主要用途是对于频繁使用的搜索进行快捷键绑定，从而快捷地创建议程缓冲区或者稀疏树（当然后者只涵盖当前缓冲区的内容）。
自定义的命令是用变量 org-agenda-custom-commands 来配置的。你可以用 C-c a C 来定制这个变量。也可以直接在 ”.emacs“ 中用 Emacs lisp 来设置。下面的例子包含了所有合法的搜索类型：
#+begin_src elisp
(setq org-agenda-custom-commands
'(("w" todo "WAITING")
("u" tags "+boss-urgent")
("v" tags-todo "+boss-urgent")))
#+end_src
意思即为：
C-c a w 对于包含关键字“WAITING”的 TODO 项的全局搜索
C-c a u 对于带有标签“:boss:”而不含标签“:urgent:”的标题的全局标签搜索
C-c a v 同搜索 C-c a u，但搜索范围只限于同时也是 TODO 项的标题

--------------------------------------------------------------------------------
议程缓冲区中的条目链接到了它们的源 Org 或者日记文件。有一些命令可以用来显示和跳转到条目的源位置，也可以从视图缓冲区中编辑源文件。

n 下一行
p 上一行
<space> 在另一个窗口中显示条目的源位置，带前缀使得整个条目在大纲中可见，而不只是标题
<TAB> 在另一个窗口中条目的准确源位置
<Enter> 转到条目的源位置并删除其它的窗口

o 删除其他窗口
d/w 切换到日/周视图
f/b 时间前移或者后移显示，例如显示了一周的内容，切换到下/上一周
. 转到今天
j 询问日期并转到那天
r/g 重新构造议程，以反映最新状态
s 保存当前 Emacs 会话的所有 Org 缓冲区和ID的地址
l 触发日志模式（Logbook mode）
在日志模式中，当记录功能打开（变量 org-log-done）时标记为 DONE 的条
目，以及在那天计时的条目，都会显示在议程中

0-9 数字参数
t 修改议程和 org 文件中条目的TODO状态
C-k 删除当前的议程条目以及源文件中它的整个子树
a C-c C-x C-a ，用在 org-archive-default-command 中设置的默认归档命令对当前的条目对应的整个树进行归档
$ C-c C-x C-s ，归档当前标题对应的树
C-c C-d 为条目设置截止期限
I 对当前条目开始计时
O/X 暂停最近开始的计时
J 在另一个窗口中跳转正在进行的计时
S-RIGHT/LEFT 将与当前行相关的时间戳改变一天




快捷方式：
1.M-^接到上一行尾。
2.c-u c-o c-u删除光标到行首。类似c-0 c-k。
3.buffer is readonly 退出该模式：c-x c-q。
4.M-\删除本行空格至单词尾。
5.c-x h全选。
6.M-x替换replace-reginxp
7.c-we删除光标之后所有的字符。
8.删除到行首:c-0,c-k.
9.c-u, 8, c-x, tab选中块向右移动8个字符。
  c-u, -8, c-x, tab选中块向左移动8个字符。
10.c-@标记选中的开始或者结束，然后方向键。
11.c-M-h选中函数。
12.m-h标记（选中）段落。
13.C-S-M-F选中字符串。
14.M-x:comment-regin注销选中区域
15.M-x:uncomment-regin取消选中区域
16.ecb-change-layout:left-sysmbolldef
17.sudo update-manager -d从低版本向高版本升级。
18.让光标跳到一行的首字母的前面c-a c-i
19.c-i跳四个空格，M-i跳8个空格。
20.C-c C-c编译tex文件(C-c C-c后default提示输入：XeLaTeX)，使用C-c C-v使用evince阅读生成的pdf文件。
21.用cscope看代码，c-x 0关闭当前窗口，c-x 1关闭其他窗口。
22.org-mode中从一个标题跳转到下一个标题的命令：前跳：c-c c-p 后跳：c-c c-n; M-Tab展开所有的子目录
23.auctex（.tex文件）Ctrl+C+E,然后在mini buffer里输入XXX,就自动出现＼begin ｛XXX｝．．．＼end｛XXX｝
24.光标跳转到配对的括号c-m-n,c-m-p
25.光标在函数中，要跳到该函数的头后者尾，用C-M-a,C-M-e
26.对于以空格开头的行，如果想从该行的行尾或者中间部分跳转到首个字符，用M-a
27.C-M-N C-M-F跳到字符串的末尾，跳到字符串的开头。（该字符串以空格为分割）遇到空格时则跳转到空格的配对处。
28.M-r 移动到页面中间行首位置。
29.在eshell中使用git diff时，当页面到END后如果继续按ENTER,则会持续在终端上打印END.跳出的方法是输入quit然后回车。
30.关于M-i一个tab键的长度的设定:M-x->customize-variable->tab-stop-list->把所有的8的倍数改为4的倍数。

Vim命令
========================================================================================
光标移动
h 或 向左箭头键(←)     光标向左移动一个字符
20h或者20(←)		光标向左移动20个字符,

j 或 向下箭头键(↓)	光标向下移动一行
20j或者20(↓)		光标向下移动20行,

k 或 向上箭头键(↑)	光标向上移动一行
20k或者20(↑)		光标向上移动20行,

l 或 向右箭头键(→)	光标向右移动一个字符
20l或者20(→)		光标向右移动20字符,
========================================================================================
光标移动
Ctrl + f	屏幕『向下』移动一页，相当于 [Page Down]按键 (常用)
Ctrl + b	屏幕『向上』移动一页，相当于 [Page Up] 按键 (常用)
Ctrl + d	屏幕『向下』移动半页
Ctrl + u	屏幕『向上』移动半页
Ctrl + e	屏幕『向下』移动一行
Ctrl + y	屏幕『向上』移动一行

+		光标移动到非空格符的下一列
-		光标移动到非空格符的上一列
n<space>	那个 n 表示『数字』，按下数字后再按空格键，光标会向右移动这一行的 n 个字符。例如 20<space> 则光标会向后面移动 20 个字符距离。
n<Enter>	n 为数字。光标向下移动 n 行(常用)

0 或功能键[Home] 这是数字『 0 』：移动到这一行的最前面字符处 (常用)
$ 或功能键[End]	 移动到这一行的最后面字符处(常用),这里的$在正则里面表示是结尾的意思,这样理解一下就能记住
H		光标移动到这个屏幕的最上方那一行的第一个字符,H你就把它记成是header的缩写，这样就好记了
M		光标移动到这个屏幕的中夬那一行的第一个字符,M你就把它记成middle的缩写
L		光标移动到这个屏幕的最下方那一行的第一个字符,L你就把它记成last的缩写
G		移动到这个档案的最后一行(常用)
nG		n 为数字。移动到这个档案的第 n 行。例如 20G 则会移动到这个档案的第 20 行
gg		移动到这个档案的第一行，相当于 1G 啊！ (常用)
========================================================================================
删除，复制，粘贴，撤销
x, X		在一行字当中，x 为向后删除一个字符 (相当于 [del] 按键)， X 为向前删除一个字符(相当于 [backspace] 亦即是退格键) (常用)
nx		n 为数字，连续向后删除 n 个字符。举例来说，我要连续删除光标后 10 个字符， 『10x』。
nX		n 为数字，连续删除光标前面的 n 个字符。举例来说，我要连续删除光标前的 10 个字符， 『10X』。

dd		删除光标所在的那一整行(常用)，
yy		复制光标所在的那一行(常用)

ndd		n 为数字。删除光标所在行向下 n 行，例如 20dd 则是删除 20 行(常用)
nyy		n 为数字。复制光标所在行向下 n 行，例如 20yy 则是复制 20 行(常用)

d1G		删除光标所在行到第一行的所有数据
y1G		复制光标所在行到第一行的所有数据

dG		删除光标所在行到最后一行的所有数据
yG		复制光标所在行到最后一行的所有数据

d$		删除光标所在处，到该行的最后一个字符
y$		复制光标所在的那个字符到该行行尾的所有数据

d0		那个是数字的 0 ，删除光标所在处，到该行的最前面一个字符
y0		复制光标所在的那个字符到该行行首的所有数据

p, P		p将复制的数据，粘贴在光标的下一行，P将复制的数据,粘贴到光标的上一行
J		将光标所在行不下一行的数据结合成同一行
c		重复删除多个数据，可以通过上下键来决定删除光标上面的，还是下面的
u		撤销。(常用)
Ctrl+r 撤销的撤销。(常用)
========================================================================================
区块选择，查找，替换
v		字符选择，会将光标经过的地方反白选择！
V		行选择，会将光标经过的行反白选择！
Ctrl+v		区块选择，可以用长方形的方式选择资料
y		将反白的地方复制起来
d		将反白的地方删除掉
从上面可以看出,v和V主要的是进行,行选择,而Ctrl+v是进行的列选择，从灵活性上来说，ctrl+v更加的灵活一点。
/string		向光标之下寻找一个名称为string字符串
?string		向光标之上寻找一个名称为string字符串
n		正向查找，搜索出的string,可以理解成next
N		反向查找，搜索出的string,可以理解成Not next
为了说明,n和N的区别,作了个例子,看左图,左图是搜索ddd所产生的结果，黄底黑字就是搜索的结果，这个时候，我们可以按n或者N,在这4个搜索区块内,进行切换.
n的顺序是12341234
N的顺序是43214321
总之一句话,n是从上到下，N是从下到上
n1,n2s/string1/string2/g	这里的n1是查找的开始行数，n2是查找结束的行数。【:2,7s/ddd/fff/g】在第2行,第7行之间，将ddd替换成fff
:1,$s/string1/string2/g		从第一行到最后一行寻找 string1 字符串，并将该字符串替换为 string2 ！(常用)
:1,$s/string1/string2/gc	从第一行到最后一行寻找 string1 字符串，并将该字符串替换为 string2 ！且在替换前显示提示字符给用户确认 (confirm) 是否需要替换！(常用)
========================================================================================
保存，退出，环境变量
:w		将编辑的数据写入硬盘档案中(常用)
:w!		若文件属性为『只读』时，强制写入该档案。不过，到底能不能写入， 还是跟你对该档案的档案权限有关啊!
:q		离开 vi (常用)
:q!		若曾修改过档案，又不想储存，使用 ! 为强制离开不储存档案。
:wq		储存后离开
:wq!		强制储存后离开
ZZ		这是大写的 Z 喔！若档案没有更动，则不储存离开，若档案已经被更动过，则储存后离开!
:w [filename]	另存为
:r [filename]	在编辑的数据中，读入另一个档案的数据。亦即将 『filename』 这个档案内容加到光标所在行后面
:! command	暂时离开vi到指令列模式下执行command的显示结果！例如『:! cat ./test』即可在vi当中察看当前文件夹中的test文件中的内容
i,I,a,A,o,O,r,R	进入插入模式，虽然有不同之处，感觉差别不大，就放在一起了
Esc		退出插入模式，进入命令模式
:set nu		显示行号，设定之后，会在每一行的前缀显示该行的行号,这一点，非常有用，当我们修改配置文件的时候，能知道多少行，就方便多了。
:set nonu	与 set nu 相反，取消行号
