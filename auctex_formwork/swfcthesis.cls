% Mainly stolen from http://www.physics.byu.edu/Undergraduate/Latex.aspx

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swfcthesis}[2011/04/14 SWFC Theses and Dissertations]

% The swfcthesis class is for producing senior year theses and dissertations
% that meet the SWFC requirements.

% Declare some variables to hold the text fields for the preliminary pages

\newcommand{\Title}[1]{\gdef\SWFCField@Title{#1}}
\newcommand{\enTitle}[1]{\gdef\SWFCField@enTitle{#1}}
\newcommand{\Author}[1]{\gdef\SWFCField@Author{#1}}
\newcommand{\enAuthor}[1]{\gdef\SWFCField@enAuthor{#1}}
\newcommand{\Docname}[1]{\gdef\SWFCField@Docname{#1}}
\newcommand{\Degree}[1]{\gdef\SWFCField@Degree{#1}}
\newcommand{\Advisor}[1]{\gdef\SWFCField@Advisor{#1}}
\newcommand{\AdvisorTitle}[1]{\gdef\SWFCField@AdvisorTitle{#1}}
\newcommand{\AdvisorInfo}[1]{\gdef\SWFCField@AdvisorInfo{#1}}
\newcommand{\Month}[1]{\gdef\SWFCField@Month{#1}}
\newcommand{\Year}[1]{\gdef\SWFCField@Year{#1}}
\newcommand{\Abstract}[1]{\gdef\SWFCField@Abstract{#1}}
\newcommand{\enAbstract}[1]{\gdef\SWFCField@enAbstract{#1}}
\newcommand{\Keywords}[1]{\gdef\SWFCField@Keywords{#1}}
\newcommand{\enKeywords}[1]{\gdef\SWFCField@enKeywords{#1}}
\newcommand{\Acknowledgments}[1]{\gdef\SWFCField@Acknowledgments{#1}}
\newcommand{\School}[1]{\gdef\SWFCField@School{#1}}
\newcommand{\enSchool}[1]{\gdef\SWFCField@enSchool{#1}}
\newcommand{\Univ}[1]{\gdef\SWFCField@Univ{#1}}
\newcommand{\enUniv}[1]{\gdef\SWFCField@enUniv{#1}}
\newcommand{\Subject}[1]{\gdef\SWFCField@Subject{#1}}

\RequirePackage[xetex]{graphicx} % before xltxtra
\graphicspath{{./figs/}{../figs/}{./}{../}} %note that the trailing “/” is required
\RequirePackage{amsmath,amsfonts,amssymb}% before xunicode
\RequirePackage{xltxtra} %fontspec,xunicode are loaded here.
\defaultfontfeatures{Mapping=tex-text}
\RequirePackage{xeCJK}
\setmainfont{Liberation Serif}
\setsansfont{Liberation Sans}
\setmonofont{Liberation Mono}
\setCJKmainfont[BoldFont={WenQuanYi Micro Hei}, ItalicFont={SimHei}]{SimSun}
\setCJKfamilyfont{hei}{WenQuanYi Micro Hei}
\setCJKfamilyfont{song}{SimSun}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

% Initialize the variables to their default values
\Title{金庸笔下武功详解}
\Author{周伯通}
\Docname{本科毕业（设计）论文}
%\Degree{本科}
\Advisor{王重阳}
\AdvisorTitle{祖师}
\AdvisorInfo{王重陽\footnote{参见维基百科-\href{http://zh.wikipedia.org/wiki/\%E7\%8E\%8B\%E9\%87\%8D\%E9\%99\%BD}{王重阳}}（1113年1月13日－1170年），原名中孚，字允卿，又名世雄，字德威，入道后改名喆，字知明，道号重阳子，故称王重阳。北宋末京兆咸阳（今陕西咸阳）大魏村人。中國道教分支全真道的始創人，后被尊为道教的北五祖之一。他有七位出名的弟子，在道教历史上称为北七真。}
\Month{六}
\Year{一二三七}
\Univ{中华武林大学}
\School{全真玄门正宗学院}
\Subject{打架斗殴专业}
\Abstract{中國武術\footnote{参见维基百科 - \href{http://zh.wikipedia.org/wiki/\%E4\%B8\%AD\%E5\%9B\%BD\%E6\%AD\%A6\%E6\%9C\%AF}{中国武术}}是中國传统文化的重要一環。兩廣人稱為功夫，民國初期簡稱為國術（後為中央國術館正式採用之名稱）；被視為中國文化之精粹，故又稱國粹。由於歷史發展和地域分佈關係，衍生出不同門派。中國武術主要內容包括搏擊技巧、格鬥手法、攻防策略和武器使用等技術。當中又分為理論和實踐兩個範疇。從實踐中帶來了有關體育、健身、和中國武術獨有之氣功、及養生等重要功能。理論中帶來了不少前人之經驗和拳譜記錄。因此，它体现中华民族对攻防技击及策略上的理解。加上經驗上積累，以自立、自強、健體養生為目標的自我運作，練習套路时顯示出身體動作之優美姿態。中國武術往往帶有思想冶鍊的文化特徵及人文哲學的特色、意義，對現今中國的大眾文化有著深遠影響\Cite{wushucn}。} 
\Keywords{金庸，武术，一陽指，双手互搏，空明拳，七傷拳，吸星大法，葵花宝典，九陰真經，九陽真
  經，天山六陽掌，天羅地網勢，蛤蟆功，倚天屠龍功，弹指神通，先天功，打狗棒法，全真剑法，摧心掌，降龍
  十八掌，六脈神劍，火焰刀，黯然銷魂掌，龍爪擒拿手，兰花拂穴手，龍象般若掌，劈空掌，玉女素心剑法，北
  冥神功，碧海潮生曲}
\Acknowledgments{感谢师兄王重阳传我全真玄门正宗功夫，感谢段皇爷不杀之恩，感谢刘贵妃不怨旧恶，感谢桃
  花岛主黄老邪助我练就空明拳和双手互搏之术，感谢郭靖兄弟让我看《九阴真经》，感谢小龙女教我驭蜂之术。}
% The followings are for the English Abstract.
\enTitle{Jin Yong's Chinese Martial Arts Illustrated}
\enAuthor{Zhou Botong}
\enUniv{Chinese Kungfu University}
\enSchool{School of Taoism}
\enAbstract{Chinese martial
  arts\footnote{Wikipedia - \href{http://en.wikipedia.org/wiki/Chinese\_martial\_arts}{Chinese martial arts}}, also referred to by the Mandarin Chinese term wushu and popularly as kung fu, are a number of fighting styles that have developed over the centuries in China. These fighting styles are often classified according to common traits, identified as "families", "sects" or "schools" of martial arts. Examples of such traits include physical exercises involving animal mimicry, or training methods inspired by Chinese philosophies, religions and legends. Styles which focus on qi manipulation are labeled as internal, while others concentrate on improving muscle and cardiovascular fitness and are labeled external. Geographical association, as in northern and southern, is another popular method of categorization\Cite{wushu}.}
\enKeywords{Jin Yong, Chinese martial arts, Kungfu}

% Title page layout
\newcommand{\SWFCtitlepage}{
  \thispagestyle{empty}
  {\centering
    \LARGE{{\ziju{1ex}\SWFCField@Univ}}\\
    \renewcommand{\baselinestretch}{1.1}
    \Huge{\textbf{{\ziju{1ex}\SWFCField@Docname}}}\\[.2\baselineskip]\par
    {\LARGE{(\SWFCField@Year\ 届)}}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}
    \vskip 100pt
    \begin{minipage}{.7\linewidth}
      \linespread{1.3}
      % \renewcommand{\baselinestretch}{2}
      \begin{Large}
        \begin{tabular}{rc}
          \textbf{题\hspace{4ex}目：}&\hspace{4ex}\ \SWFCField@Title\hspace{5ex}\ \\\cline{2-2}
          &\\
          \textbf{分院系部：}&\SWFCField@School\\\cline{2-2}
          &\\
          \textbf{专\hspace{4ex}业：}&\SWFCField@Subject\\\cline{2-2}
          &\\
          \textbf{姓\hspace{4ex}名：}&\SWFCField@Author\\\cline{2-2}
          &\\
          \textbf{导师姓名：}&\SWFCField@Advisor\\\cline{2-2}
          &\\
          \textbf{导师职称：}&\SWFCField@AdvisorTitle\\\cline{2-2}
        \end{tabular}
      \end{Large}
    \end{minipage}
    \vskip 110pt
    \Large{\textbf{\SWFCField@Year{}\ 年\ \SWFCField@Month{}\ 月}}\par
  }
  \clearpage
}

% Abstract page
\newcommand{\abstractpage}{
  \thispagestyle{empty}
  {\centering
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}
    \parbox{\textwidth}{\centering\Large{\textbf{\SWFCField@Title}}\\[.7\baselineskip]\par\normalsize
      \mbox{\large{\SWFCField@Author}}\\[.5\baselineskip]
      \mbox{\large{（\SWFCField@Univ\ \SWFCField@School，云南\ 昆明\ 650224）}}}
  }
  \vskip 2em
  \noindent \textbf{摘\ 要：}\SWFCField@Abstract\par
  \vskip 1em
  \noindent \textbf{关键词：}~\SWFCField@Keywords
  \clearpage
}

% English abstract page  
\newcommand{\enabstractpage}{
  \thispagestyle{empty}
  {\centering
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}
    \parbox{\textwidth}{\centering\Large{\textbf{\SWFCField@enTitle}}\\[.7\baselineskip]\par\normalsize
      \mbox{\large{\SWFCField@enAuthor}}\\[.5\baselineskip]
      \large{（\SWFCField@enSchool, \SWFCField@enUniv, Kunming, 650224, Yunnan, China）}}
  }
  \vskip 2em
  \noindent \textbf{Abstract: }~\SWFCField@enAbstract\par
  \vskip 1em
  \noindent \textbf{Key words: }~\SWFCField@enKeywords
  \clearpage
}

% Acknowledgments page  
\newcommand{\acknowledgmentspage}{
  \thispagestyle{empty}
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{致\hspace{1em}谢}
  \chapter*{致\hspace{1em}谢}
  \doublespace
  % \vskip 1.2em
  % \renewcommand{\baselinestretch}{1.66} \small\normalsize%
  \SWFCField@Acknowledgments
  \singlespace
  % \par\renewcommand{\baselinestretch}{1} \small\normalsize%
  \clearpage
}

% Allow opt-out on acknowledgments
\DeclareOption{noacknowlegments}{
  \renewcommand{\acknowledgmentspage}{}
}

% Advisor info page
\newcommand{\advisorinfopage}{
  \thispagestyle{empty}
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{指导教师简介}
  \chapter*{指导教师简介}
  % \renewcommand{\baselinestretch}{1.66} \small\normalsize%
  % \vskip 1.2em
  \doublespace
  \SWFCField@AdvisorInfo
  \singlespace
  % \par\renewcommand{\baselinestretch}{1} \small\normalsize%
  \clearpage
}

% Define the macro for making preliminary pages
\newcommand{\makepreliminarypages}{
  \singlespace
  % \changepage{0.5in}{}{}{}{}{}{-0.2in}{-0.3in}{}
  \setlength{\topmargin}{30pt}
  \setlength{\headsep}{0pt}
  \setlength{\hoffset}{0in}
  \SWFCtitlepage
  \setlength{\topmargin}{0pt}
  \setlength{\headsep}{0.3in}
  \setlength{\hoffset}{0in}
  \linespread{1}
  \abstractpage
  \enabstractpage
  % \changepage{-0.5in}{}{}{}{}{}{0.2in}{0.3in}{}
  \doublespace % mainmatter is doublespaced
  % \renewcommand{\arraystretch}{1.5} %widen table row height
}

% Load the class and needed packages
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\relax
\LoadClass[a4paper,12pt,oneside]{book}

%\RequirePackage{changepage}

% A couple of useful macros for line spacing

\newcommand{\singlespace}{\par\renewcommand{\baselinestretch}{1.2}\small\normalsize\par}
\newcommand{\doublespace}{\par\renewcommand{\baselinestretch}{1.6}\small\normalsize\par}
\newcommand{\normalspace}{\par\renewcommand{\baselinestretch}{1}\small\normalsize\par}
\newcommand{\Appendix}[1]{ % make bibliography looks better
  \normalspace
  \renewcommand{\chaptermark}[1]{\markboth{附录\ \thechapter \ \ #1}{}}
  \titleformat{\chapter}{\centering\LARGE\bfseries}{附录\ \thechapter}{1em}{}
  \appendix}

% Set the margins to SWFC specifications

%\setlength{\voffset}{-30pt}
% \setlength{\hoffset}{-1in}
\setlength{\oddsidemargin}{0pt}
\setlength{\evensidemargin}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\marginparwidth}{0pt}
\setlength{\marginparsep}{0pt}
\setlength{\textwidth}{6.5in}
\setlength{\headheight}{0.2in}
\setlength{\headsep}{0.3in}
%\setlength{\textheight}{8.8in}
\setlength{\textheight}{9.3in}
\setlength{\footskip}{0.25in}
\setlength{\parindent}{2em}
\raggedbottom

% Some useful packages

\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{1pt}
% Must put the redefinition after the first call of \pagestyle{fancy} !!!
\renewcommand{\chaptermark}[1]{\markboth{\thechapter \ \ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection \ \ #1}}
\titleformat{\chapter}{\centering\LARGE\bfseries}{\thechapter}{1em}{}
\titlespacing{\chapter}{0pt}{*0}{*4}

\RequirePackage{indentfirst}
\RequirePackage{longtable}
%\RequirePackage[superscript]{cite}
%\RequirePackage[style=bibtex,autocite=superscript, notetype=foot+end]{biblatex}

% To include a link in your pdf use \href{URL}{Text to be displayed}.  If your
% display text is the URL, you probably should use the \url{} command discussed
% above.
%
% To add a bookmark in the pdf you can use \pdfbookmark.  You can look up its usage
% in the hyperref package documentation
\usepackage[xetex,bookmarksnumbered,pdfpagelabels=true,plainpages=false,colorlinks=true,
            linkcolor=black,citecolor=black,urlcolor=blue]{hyperref}
\urlstyle{rm}

\renewcommand{\bibname}{参考文献} % report.cls
\renewcommand{\contentsname}{目\hspace{1em}录}
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\listtablename}{表格目录}
%\renewcommand{\abstractname}{摘\hspace{1em}要}
%\renewcommand{\appendixname}{附\hspace{1em}录}
%\renewcommand{\indexname}{索\hspace{1em}引}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% relax the position of tables and figures
% \renewcommand{\textfraction}{0.15}
% \renewcommand{\topfraction}{0.85}
% \renewcommand{\bottomfraction}{0.65}
% \renewcommand{\floatpagefraction}{0.60}

\newcommand{\Cite}[1]{\textsuperscript{\cite{#1}}}
\newcommand{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}
%\doublespace
%\linespread{1.3}