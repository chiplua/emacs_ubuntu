;;关闭工具栏
(tool-bar-mode nil)
;;;; 显示行号
(setq column-number-mode t)
(setq line-number-mode t)

;配置cedet和ecb
(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu


(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(add-to-list 'load-path "~/.emacs.d/")
(require 'ecb)
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
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(recentf-max-saved-items 100)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
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


(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-matrix)
(color-theme-euphoria)

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
(global-set-key [f5] 'cscope-prev-symbol)
(global-set-key [f6] 'cscope-next-symbol)
(global-set-key [f7] 'cscope-find-global-definition-no-prompting)
(global-set-key [f8]'cscope-pop-mark)
(global-set-key [f9] 'eshell) 

;(global-set-key [f6] 'replace-string)
;;设置保存当前文件快捷
;(global-set-key [f8] 'save-buffer);
;;定义F9为CMD命令模式
;;设置F11为删除其它窗口
(global-set-key [f11] 'delete-other-windows) 
;;定义F12键为激活ecb
(global-set-key [f12] 'ecb-activate) 
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
(setq backup-by-copying t) ; 自动备份
;;自动备份目录~/.emacs.d/backup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))) 
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


;;设置Alt+Enter为自动补全菜单
(global-set-key [(meta return)] 'semantic-ia-complete-symbol-menu) 
;;切换到编辑窗口
(global-set-key [C-\;] 'ecb-goto-window-edit-last)
;;切换到函数窗口 
(global-set-key [C-\'] 'ecb-goto-window-methods) 
;;搜索定义
(global-set-key [C-.] 'cscope-find-global-definition) 
;; 跳出转向
(global-set-key [C-,] 'cscope-pop-mark) 
;;设置C语言默认格式
;(add-hook 'c-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) ) 
 ;;设置C++语言默认格式
;(add-hook 'c++-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) )
(put 'set-goal-column 'disabled nil)





(global-set-key (kbd "C-c z") (quote shell)) ;The Z key for shell;




(setq backup-inhibited t);; 不产生备份
(setq auto-save-default nil) ; stop creating those #autosave# files




;把 cscope 窗口放到 ecb 的窗口中
(ecb-layout-define "my-cscope-layout" left nil
(ecb-set-methods-buffer)
(ecb-split-ver 0.5 t)
(other-window 1)
;(ecb-set-history-buffer)
;(ecb-split-ver 0.5 t)
;(other-window 1)
(ecb-set-cscope-buffer))
(defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
(switch-to-buffer "*cscope*"))
(setq ecb-layout-name "my-cscope-layout")


;(require 'ecb-autoloads)
;auto load ecb when start emacs
(setq ecb-auto-activate t
	ecb-tip-of-the-day nil)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("/home/chiplua/work/TCL/AT01_Tapas01/bootable/bootloader/lk")))



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

