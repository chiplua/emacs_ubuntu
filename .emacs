;全屏 begin
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
;最大化
(defun my-maximized-horz ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(defun my-maximized-vert ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(my-maximized)
;全屏 end




;;增加ibus中文输入法
(add-hook 'after-init-hook 'ibus-mode-on)
(require 'ibus)
(global-set-key (kbd "C-SPC") 'ibus-toggle)
(ibus-define-common-key ?\C-\s nil)
;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("red" "blue" "limegreen"))




;在分别在C，C++，JAVA模式下在菜单栏中显示cscope
(add-hook 'c-mode-hook (function cscope:hook))
(add-hook 'c++-mode-hook (function cscope:hook))
(add-hook 'java-mode-hook (function cscope:hook))
(add-hook 'java-mode-hook (lambda ()
                                (setq c-basic-offset 4
                                      tab-width 4
                                      indent-tabs-mode t)))






;;关闭工具栏
(tool-bar-mode -1)
;;;; 显示行号
(setq column-number-mode t)
(setq line-number-mode t)




;(add-to-list 'load-path
;    "~/.emacs.d/cedet-1.1/common")
;配置cedet和ecb
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu
;minibuffer中显示函数的定义，原来时间差不多要3秒，现在改为0秒.
(setq semantic-idle-scheduler-idle-time 1)




(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(add-to-list 'load-path "~/.emacs.d/")
(require 'ecb)
(load-file "~/.emacs.d/xcscope.el")
(require 'xcscope)
(require 'xgtags)
;bu重新建一次数据库
(setq cscope-do-not-update-database t);
(require 'xgtags-extension)
(require 'gtags)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
; '(cscope-display-cscope-buffer nil)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(recentf-max-saved-items 100)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60)))
 '(transient-mark-mode (quote (only . t))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )




;Use the vim 
;(load-file "/home/chiplua/.emacs.d/vimpulse.el")
;(require 'vimpulse)
(load-file "~/.emacs.d/setnu.el")
(require 'setnu)
(setnu-mode t)
(global-set-key [(meta f3)] (quote setnu-mode))
(load-file "~/.emacs.d/linum.el")
(require 'linum)




;recent open files in FILE menu
(require 'recentf)
(recentf-mode t)




;set tabbar 
(load-file "~/.emacs.d/tabbar.el")
(require 'tabbar)
(tabbar-mode 1)
(global-set-key (kbd "") 'tabbar-backward-group)
(global-set-key (kbd "") 'tabbar-forward-group)
(global-set-key [C-S-iso-lefttab] 'tabbar-backward)
(global-set-key [(control tab)]   'tabbar-forward)
;当用tab切换时，只切换自己打开的文件
(setq tabbar-buffer-groups-function
    (lambda (b) (list "All Buffers")))
(setq tabbar-buffer-list-function
    (lambda ()
        (remove-if
          (lambda(buffer)
             (find (aref (buffer-name buffer) 0) " *"))
          (buffer-list))))
;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
(set-face-attribute 'tabbar-default-face nil
                    :family "DejaVu Sans Mono"
                    :background "gray80"
                    :foreground "gray30"
                    :height 1.0
                    )
;; 设置左边按钮外观：外框框边大小和颜色
(set-face-attribute 'tabbar-button-face nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "yellow70")
                    )
;; 设置当前tab外观：颜色，字体，外框大小和颜色
(set-face-attribute 'tabbar-selected-face nil
                    :inherit 'tabbar-default
                    :foreground "DarkGreen"
                    :background "LightGoldenrod"
                    :box '(:line-width 2 :color "DarkGoldenrod")
                    :overline "black"
                    :underline "black"
                    :weight 'bold
                    )
;; 设置非当前tab外观：外框大小和颜色
(set-face-attribute 'tabbar-unselected-face nil
                    :inherit 'tabbar-default
                    :box '(:line-width 2 :color "#00B2BF")
                    )



;配置颜色
(set-background-color "black")
(set-foreground-color "green")
(set-cursor-color  "white")




;; 颜色设置
(setq frame-background-mode 'dark)
(set-background-color "black")
(set-foreground-color "gray")
(set-cursor-color "yellow")




;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")




;设置颜色配置方案
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-matrix)
(color-theme-euphoria)
;(color-theme-oswald )




;;;;;;;;公用功能快捷键设置
;;F1列模式
;(global-set-key [f1] 'cua-mode)
;;恢复，常用键 
(global-set-key [f1] 'undo) 
(global-set-key [f2] 'menu-bar-open)
;;ibuffer
(require 'ibuffer)
(global-set-key [(f3)] 'ibuffer) ;disply all the buffers
;;F4,kill键，习惯设置，关闭当前buffer 
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [C-f5] 'revert-buffer)    ;refresh the file.  
(global-set-key [f5] 'eshell)
(global-set-key [f6] 'replace-string)
;;定义F9为CMD命令模式
;;设置F11为删除其它窗口
(global-set-key [f7] 'delete-other-windows)
;;定义F12键为激活ecb
(global-set-key [f8] 'ecb-activate)

(global-set-key [f9] 'cscope-prev-symbol)
(global-set-key [f10] 'cscope-next-symbol)
(global-set-key [f11] 'cscope-find-global-definition-no-prompting)
(global-set-key [f12]'cscope-pop-mark)
;;定义Ctrl+F12为停止ecb
(global-set-key [C-f12] 'ecb-deactivate) 




(setq x-select-enable-primary nil)
(setq mouse-drag-copy-region nil);;取消鼠标选择即复制
;; 显示括号匹配, 而不是匹配后短暂的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; 在 mode-line 中显示列号
(setq column-number-mode t)
;; 使用 C-k 删除整行
(setq-default kill-whole-line t)
;; 设置 kill-ring 的大小
(setq kill-ring-max 50)
;; 备份文件目录
;(setq backup-by-copying t) ; 自动备份
;;自动备份目录~/.emacs.d/backup
;(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))) 
(setq delete-old-versions t) ; 自动删除旧的备份文件
(setq kept-new-versions 2) ; 保留最近的3个备份文件
(setq kept-old-versions 1) ; 保留最早的2个备份文件
(setq version-control t) ; 多次备份
;; 不要问 yes-or-no，只问 y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)
;; 设置 emacs 的标题
(setq frame-title-format "emacs@%b %f")
;; 可以显示图片
(auto-image-file-mode)
;; 高亮显示选中区域
(transient-mark-mode t)
;;;不要生成备份文件
;(setq-default make-backup-files nil)
;;;; 显示时间
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)
;; 代码折叠 
(load-library "hideshow") 
(add-hook 'java-mode-hook 'hs-minor-mode) 
(add-hook 'java-mode-hook (function cscope:hook))
(add-hook 'perl-mode-hook 'hs-minor-mode) 
(add-hook 'php-mode-hook 'hs-minor-mode) 
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)




(setq backup-inhibited nil);; 不产生备份
(setq auto-save-default nil) ; stop creating those #autosave# files




;把 cscope 窗口放到 ecb 的窗口中
(ecb-layout-define "my-cscope-layout" left nil
(ecb-set-methods-buffer)
;(ecb-split-ver 0.5 t)
;(other-window 1)
;(ecb-set-history-buffer)       ;;chiplua
(ecb-split-ver 0.7 t)		;;chiplua
(other-window 1)		;;chiplua
(ecb-set-cscope-buffer))

(defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
(switch-to-buffer "*cscope*"))
(setq ecb-layout-name "my-cscope-layout")
;设置左边列窗口的宽度
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-windows-width 0.2))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)
;定义C-1显示ECB左边小窗口，C-2显示ECB左边大窗口
(defun ecb-window-left ()
 (interactive)
(custom-set-variables
 '(ecb-windows-width 0.2))
(custom-set-faces
))
;; (defun window_move_right () ;光标移动到右边的窗口
;; (interactive)
;; (windmove-right)
;; )
(defun ecb-window-left-mini ()
 (interactive)
(custom-set-variables
 '(ecb-windows-width 0.0))
(custom-set-faces
))
(defun ecb-window-right ()
(interactive)
(custom-set-variables
 '(ecb-windows-width 0.9))
(custom-set-faces
))
(global-set-key (kbd "C-1") 'ecb-window-left)
;(global-set-key (kbd "C-2") 'window_move_right)
(global-set-key (kbd "C-2") 'ecb-window-left-mini)
(global-set-key (kbd "C-3") 'ecb-window-right)
(global-set-key (kbd "C-4") 'delete-window)
(global-set-key (kbd "C-5") 'delete-other-windows)



;配置ECB自动加载
(require 'ecb-autoloads)
;auto load ecb when start emacs
(setq ecb-auto-activate t
	ecb-tip-of-the-day nil)
 '(ecb-options-version "2.40")
(setq stack-trace-on-error t)
(ecb-activate)
(ecb-byte-compile)
(switch-to-buffer "*scratch*") 
(delete-other-windows) 




;用"C-+"和"C--"来放大Emacs显示字体的大小
(defun increase-font-size ()
(interactive)
(set-face-attribute 'default
nil
:height
(ceiling (* 1.10
(face-attribute 'default :height)))))
(defun decrease-font-size ()
(interactive)
(set-face-attribute 'default
nil
:height
(floor (* 0.9
(face-attribute 'default :height)))))
(global-set-key (kbd "C-+") 'increase-font-size)
(global-set-key (kbd "C--") 'decrease-font-size)




;Linux下让M-w Emacs复制内容到系统的剪切板
 (setq x-select-enable-clipboard t)




;Disable the electric mode when start up
(defun zlt-disable-electricity ()
  (c-toggle-electric-state -1))
(add-hook 'c-mode-common-hook 'zlt-disable-electricity)




;自动补齐
;;绑定按键 
;(global-set-key [(meta ?/)] 'hippie-expand)




;自动补齐Add auto-complete with auto-complete.el
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1/")
(require 'auto-complete-config)  
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/dict")
(ac-config-default)




;使用auto-complete当输入“/”后会提示“Tramp:Waiting for prompts from remote shell"的解决方法
(delete-if
 (lambda (x)
   (or (eq (cdr x) 'tramp-completion-file-name-handler)
       (eq (cdr x) 'tramp-file-name-handler)))
 file-name-handler-alist)




;使用auto-complete-scite-api
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1/ac-scite-api-directories/")
(load "auto-complete-config")
(if (load "auto-complete-scite-api" t)
    (setq-default ac-sources (cons 'ac-source-scite-api ac-sources)))




;;设置Alt+Enter为自动补全菜单
(global-set-key [backtab] 'semantic-ia-complete-symbol-menu)
;;切换到编辑窗口
(global-set-key [C-\;] 'ecb-goto-window-edit-last)
;;切换到函数窗口 
(global-set-key [C-\'] 'ecb-goto-window-methods) 
;;搜索定义
(global-set-key [C-.] 'cscope-find-global-definition) 
;; 跳出转向
;(global-set-key [C-,] 'cscope-pop-mark) 
;;设置C语言默认格式
(add-hook 'c-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) ) 
 ;;设置C++语言默认格式
(add-hook 'c++-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) )
(put 'set-goal-column 'disabled nil)
(global-set-key (kbd "C-c z") (quote shell)) ;The Z key for shell;





;config the java env start
;; Set the debug option to enable a backtrace when a
;; problem occurs.
;; 当有问题出现显示错误信息，便于调试
;(setq debug-on-error t)
;; Update the Emacs load-path to include the path to
;; the JDE and its require packages. This code assumes
;; that you have installed the packages in the emacs/site
;; subdirectory of your home directory.
;; 加载所需的package
(custom-set-variables  
'(jde-jdk-registry (quote (("1.6.0_15" . "/usr/lib/jvm/java-6-sun-1.6.0.06/")))))
(add-to-list 'load-path "~/.emacs.d/cedet-1.1/eieio")
(add-to-list 'load-path "~/.emacs.d/cedet-1.1/semantic")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet-1.1/speedbar/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee-2.4.0.1/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet-1.1/common"))
;(load-file (expand-file-name "~/.emacs.d/cedet-1.1/common/cedet.el"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elib-1.0"))
;(setq defer-loading-jde t)
;(if defer-loading-jde
;(progn
;      (autoload 'jde-mode "jde" "JDE mode." t)
;      (setq auto-mode-alist
;       (append
;        '(("\\.java\\'" . jde-mode))
;        auto-mode-alist)))
;  (require 'jde))
;config the java env end




;;; 各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)




;; compile current c file
(defun compile-file ()
  (interactive)
  (compile (format "CC -o a.out %s" (buffer-file-name))))
(global-set-key (kbd "C-<f1>") 'compile-file)
;; compile current cpp file
(defun compile-file ()
  (interactive)
  (compile (format "g++ -o a.out %s" (buffer-file-name))))
(global-set-key (kbd "C-<f2>") 'compile-file)
;; compile current java file
;(defun compile-file ()
 ; (interactive)
  ;(compile (format "g++ -o a.out %s" (buffer-file-name))))
;(global-set-key (kbd "C-<f1>") 'compile-file)




;解决的"Command attempted to use minibuffer while in minibuffer"bug
(setq enable-recursive-minibuffers t) 




;用shirt+space来标记mark,使用c-g取消标记
(global-set-key [?\S- ] 'set-mark-command)




;使用yasnippet
(add-to-list 'load-path
              "~/.emacs.d/yasnippet")
(require 'yasnippet-bundle)
;设置模板
(add-to-list 'load-path
              "~/.emacs.d/yasnippet/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/yasnippet-0.6.1c/snippets")
;保持tab的宽度
(setf yas/indent-line nil)




;配置auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;设置xelatex为默认编辑命令，evince为pdf文件阅读器
(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
(add-hook 'LaTeX-mode-hook
(lambda()
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
(setq TeX-command-default "XeLaTeX")))
;添加环境变量
(setenv "PATH" (concat "/usr/local/texlive/2012/bin/x86_64-linux/:" (getenv "PATH")))
      (setq exec-path (append '("/usr/texbin" "/usr/local/texlive/2012/bin/x86_64-linux/") exec-path)) 




;增加org-mode自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))




;在org-mode中添加代码块的包含,M-X:org-insert-src-block
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))




(defun my-goto-line ()
  (interactive)
  (unwind-protect (goto-line (string-to-number (read-from-minibuffer "Goto line: ")))
))    
(global-set-key "\M-gg" 'my-goto-line)








(load-file "~/.emacs.d/highlight/feng-highlight.el")
(global-set-key (kbd "C-6") 'feng-highlight-at-point)




