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





1.建立cscope的index文件
最一般的方式是在源代码目录运行cscope -bR,-b代表build源码的index数据库，-R表示包括子文件夹,cscope在源代码的根目录生成index文件cscope.out但是在默认情况下，cscope在建库时不会引入cpp文件，如果是cpp的项目需要现找到所有的c，cpp文件，然后再用cscope建立index
＃找到所有的c,cpp,h文件
find . -name "*.cpp" -o -name "*.c" -o -name "*.h" > cscope.files
# 根据cscope.files生成database
cscope -b -i cscope.files
这样也太麻烦了把？！其实大家都这么想，在cscope的源代码包中，在contrib/xcscope中有一个文件cscope-indexer,就完成了上述功能，搜索文件夹，并且建cscope的index,比如opensuse并没有把这个文件打到cscope的包中，所以建议大家自己去下载源代码包,把这个文件拷贝到/bin下面，就可以直接用了。


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



8:Ubuntu 使用emacs+auctex编译tex文档
首先是安装emacs
sudo apt-get install emacs
搞定。
然后安装auctex
由于我下载安装了texlive 2008,而没有使用源里的旧版本，所以不能直接apt-get install auctex了，因为这样会要求你从源里
安装texlive。下载安装之。
从gnu网站下载auctex-11.85（http://www.gnu.org/software/auctex/ ），例如下载到主目录下，解压。
cd auctex-11.85
./config --with-emacs #（注意--with-emacs参数，如果不使用此参数，emacs找不到auctex）
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
就可以使用C-c C-c编译tex文件，使用C-c C-v使用evince阅读生成的pdf文件。

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

auctex
直接google上面找到的源码，放到emacs配置目录/home/username/.emacs.d中，并在emacs 配文件/home/username/.emacs中添加了一段配置脚本，配置脚本中的preview-latex.el可能auctex中没有，直接用这个文件名称google之，很容易找到。找到之后将这个文件放在auctex解压缩之后的目录中，和auctex.el在一起即可。




