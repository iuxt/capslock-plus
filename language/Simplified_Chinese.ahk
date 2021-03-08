language_Simplified_Chinese:
; lib\lib_bindWins.ahk
global lang_bw_noWIRini:="CapsLock+winsInfosRecorder.ini 不存在"

; lib_clq.ahk
global lang_clq_addIni:="确定将以下字符串简写成 {replace0}，并记录到 {replace1}？"
global lang_clq_existing:="{replace0}`n已存在于 {replace1}，确定用以下设置覆盖？"
global lang_clq_qrunFileNotExist:="QRun中存在以下记录，而对应文件（文件夹）不存在，是否删除该设置？"
global lang_clq_noCmd:="没有该命令"
global lang_clq_emptyFolder:="<空文件夹>"

; ydTrans.ahk
global lang_yd_translating:="翻译中...  （如果网络太差，翻译请求会暂时阻塞程序，稍等就好）"
global lang_yd_name:="有道翻译"
global lang_yd_needKey:="缺少有道翻译API的key，有道翻译无法使用"
global lang_yd_fileNotExist:="文件（文件夹）不存在"
global lang_yd_errorNoNet:="发送异常，可能是网络已断开"
global lang_yd_errorTooLong:="部分句子过长"
global lang_yd_errorNoResults:="无词典结果"
global lang_yd_errorTextTooLong:="要翻译的文本过长"
global lang_yd_errorCantTrans:="无法进行有效的翻译"
global lang_yd_errorLangType:="不支持的语言类型"
global lang_yd_errorKeyInvalid:="无效的key"
global lang_yd_errorSpendingLimit:="已达到今日消费上限，或者请求长度超过今日可消费字符数"
global lang_yd_errorNoFunds:="帐户余额不足"
global lang_yd_trans:="------------------------------------有道翻译------------------------------------"
global lang_yd_dict:="------------------------------------有道词典------------------------------------"
global lang_yd_phrase:="--------------------------------------短语--------------------------------------"

global lang_settingsFileContent:=""
lang_settingsFileContent=
(
;------------ Encoding: UTF-16 ------------
;请对照 CapsLock+settingsDemo.ini 来配置相关设置
[Global]

loadScript=scriptDemo.js

[QSearch]

[QRun]

[QWeb]

[TabHotString]

[QStyle]

[TTranslate]

[Keys]

)
global lang_settingsDemoFileContent_1:=""
global lang_settingsDemoFileContent_2:=""
lang_settingsDemoFileContent_1=
(
;------------ Encoding: UTF-16 ------------
; # CapsLock+ 设置样本
; - ******请务必阅读以下说明：******

; - **这里的设置是只读的，仅作说明参考，不要修改这里的设置（修改了也无效），需要自定义设置请在 CapsLock+settings.ini 中的对应段名中作添加修改
;     例如，需要开启开机自启动，请在 CapsLock+settings.ini 的 [Global] 下添加：autostart=1，并保存

; - "[]"里面是段名，不能修改
; - 各段下所有设置的格式都为：键名=键值，每行一个
; - 虽然 QSearch,QRun 和 QWeb 是不同的段，理论上它们的键名可以重复，但请不要这样设置，否则 +Q 的快速启动功能会无法区分
; - 分号开头的是注释行，注释行不影响设置，就像这几行
; - 以下把 Capslock+Q 弹出的输入框称为 "Qbar"


;----------------------------------------------------------------
; ## 全局设置
[Global]
;是否开机自启动，1为是，0为否（默认）。
autostart=0

;是否开启程序加载动画，1是（默认），0否
loadingAnimation=1

;----------------------------------------------------------------;
; ## +T翻译设置

[TTranslate]
;有道api接口
;翻译功能通过调用有道的api实现。
;接口的请求频率限制为每小时1000次，超过限制会被封禁。也就是说所有使用Capslock+翻译的人一小时内翻译的次数加起来不能超过1000次。
;有道api网址：http://fanyi.youdao.com/openapi

;有道api的key，如果自己申请到key，可以填入，这样就不用和其他人共用api接口，留空则使用自带的key，所有人共用
;注意如果是免费版的key，apiType也要相应设置为0，收费版的填写1
apiKey=0123456789

;接口类型，0为免费版，1为收费版。通过上面的网址申请的是免费版的，收费版是需要 email 他们来申请的。
apiType=0

;免费版的有道 api key 的 keyfrom 参数，申请 api 时要求填写的。收费版的不需要填写。
keyFrom=xxx


;----------------------------------------------------------------;

)

lang_settingsDemoFileContent_2=
(
; ## 按键功能设置

; - 可设置的按键组合有：
;   Capslock + F1~F12
;   Capslock + 0~9
;   Capslock + a~z
;   Capslock + `-=[]\;',./ 
;   Capslock + Backspace, Tab, Enter, Space, RAlt
;   Capslock + LALt + F1~F12
;   Capslock + LALt + 0~9
;   Capslock + LALt + a~z
;   Capslock + LALt + `-=[]\;',./ 
;   Capslock + LALt + Backspace, Tab, Enter, Space, RAlt
;   Capslock + Win + 0~9

; - 以下设置键名是按键组合名，键值是对应功能，所有支持的功能都在下面

[Keys]
;短按 Caps Lock -> 发送 Esc
;press_caps=keyFunc_esc

;短按 Caps Lock -> 切换大小写
press_caps=keyFunc_toggleCapsLock

;Capslock+A -> 光标向左移动一个单词
caps_a=keyFunc_moveWordLeft

;Capslock+B -> 光标向下移动 10 行
caps_b=keyFunc_moveDown(10)

;独立剪贴板 1 的复制
caps_c=keyFunc_copy_1

;光标向下移动
caps_d=keyFunc_moveDown

;光标向上移动
caps_e=keyFunc_moveUp

;光标向右移动
caps_f=keyFunc_moveRight

;光标向右移动一个单词
caps_g=keyFunc_moveWordRight

;向左选中一个单词
caps_h=keyFunc_selectWordLeft

;向上选中
caps_i=keyFunc_selectUp

;向左选中
caps_j=keyFunc_selectLeft

;向下选中
caps_k=keyFunc_selectDown

;向右选中
caps_l=keyFunc_selectRight

;向下选中 10 行
caps_m=keyFunc_selectDown(10)

;向右选中一个单词
caps_n=keyFunc_selectWordRight

;选中至行末
caps_o=keyFunc_selectEnd

;光标移动到行首
caps_p=keyFunc_home

; QBar
caps_q=keyFunc_qbar

;delete
caps_r=keyFunc_delete

;光标向左移动
caps_s=keyFunc_moveLeft

caps_t=keyFunc_doNothing

;选中至行首
caps_u=keyFunc_selectHome

;独立剪贴板 1 的粘贴 
caps_v=keyFunc_paste_1

;backspace
caps_w=keyFunc_backspace

;独立剪贴板 1 的剪切
caps_x=keyFunc_cut_1

;向上选中 10 行
caps_y=keyFunc_selectUp(10)

caps_z=keyFunc_doNothing

caps_backquote=keyFunc_doNothing

;Capslock+0~9 -> 激活绑定窗口 0~9
caps_1=keyFunc_winbind_activate(1)

caps_2=keyFunc_winbind_activate(2)

caps_3=keyFunc_winbind_activate(3)

caps_4=keyFunc_winbind_activate(4)

caps_5=keyFunc_winbind_activate(5)

caps_6=keyFunc_winbind_activate(6)

caps_7=keyFunc_winbind_activate(7)

caps_8=keyFunc_winbind_activate(8)

caps_9=keyFunc_winbind_activate(9)

caps_0=keyFunc_winbind_activate(10)

caps_minus=keyFunc_qbar_upperFolderPath

caps_equal=keyFunc_qbar_lowerFolderPath

;删除光标所在一行
caps_backspace=keyFunc_deleteLine

;TabScript
caps_tab=keyFunc_tabScript

;删除至行首
caps_leftSquareBracket=keyFunc_deleteToLineBeginning

caps_rightSquareBracket=keyFunc_doNothing

caps_backslash=keyFunc_doNothing

;Capslock+; -> end
caps_semicolon=keyFunc_end

caps_quote=keyFunc_doNothing

;换行——无论光标是否在行末
caps_enter=keyFunc_enterWherever

;选中当前单词
caps_comma=keyFunc_selectCurrentWord

;向右选中单词
caps_dot=keyFunc_selectWordRight

;删除至行尾
caps_slash=keyFunc_deleteToLineEnd

;Capslock+Space -> enter
caps_space=keyFunc_enter

;Capslock+RAlt -> 无
caps_right_alt=keyFunc_doNothing

;打开 Capslock+ 首页
caps_f1=keyFunc_openCpasDocs

;Math Board
caps_f2=keyFunc_mathBoard

;有道翻译
caps_f3=keyFunc_translate

;窗口透明
caps_f4=keyFunc_winTransparent

;重载 Capslock+
caps_f5=keyFunc_reload

;窗口置顶
caps_f6=keyFunc_winPin

caps_f7=keyFunc_doNothing

caps_f8=keyFunc_getJSEvalString

caps_f9=keyFunc_doNothing

caps_f10=keyFunc_doNothing

caps_f11=keyFunc_doNothing

;打开 / 关闭独立剪贴板
caps_f12=keyFunc_switchClipboard

;--------------------LAlt--------------------

;Capslock+LAlt+A -> 向左移 3 个单词
caps_lalt_a=keyFunc_moveWordLeft(3)

;下移 30 次
caps_lalt_b=keyFunc_moveDown(30)

;独立剪贴板 2 的复制
caps_lalt_c=keyFunc_copy_2

;下移 3 次
caps_lalt_d=keyFunc_moveDown(3)

;上移 3 次
caps_lalt_e=keyFunc_moveUp(3)

;右移 5 次
caps_lalt_f=keyFunc_moveRight(5)

;右移 3 个单词
caps_lalt_g=keyFunc_moveWordRight(3)

;向左选中 3 个单词
caps_lalt_h=keyFunc_selectWordLeft(3)

;向上选中 3 次
caps_lalt_i=keyFunc_selectUp(3)

;向左选中 5 个字符
caps_lalt_j=keyFunc_selectLeft(5)

;向下选中 3 次
caps_lalt_k=keyFunc_selectDown(3)

;向右选中 5 个字符
caps_lalt_l=keyFunc_selectRight(5)

;向下选中 30 次
caps_lalt_m=keyFunc_selectDown(30)

;向右选中 3 个单词
caps_lalt_n=keyFunc_selectWordRight(3)

;选中至页尾
caps_lalt_o=keyFunc_selectToPageEnd

;移动至页首
caps_lalt_p=keyFunc_moveToPageBeginning

caps_lalt_q=keyFunc_doNothing

;向前删除单词
caps_lalt_r=keyFunc_forwardDeleteWord

;左移 5 次
caps_lalt_s=keyFunc_moveLeft(5)

;上移 30 次
caps_lalt_t=keyFunc_moveUp(30)

;选中至页首
caps_lalt_u=keyFunc_selectToPageBeginning

;独立剪贴板 2 的粘贴
caps_lalt_v=keyFunc_paste_2

;删除单词
caps_lalt_w=keyFunc_deleteWord

;独立剪贴板 2 的 剪切
caps_lalt_x=keyFunc_cut_2

;向上选中 30 次
caps_lalt_y=keyFunc_selectUp(30)

caps_lalt_z=keyFunc_doNothing

caps_lalt_backquote=keyFunc_doNothing

caps_lalt_1=keyFunc_winbind_binding(1)

caps_lalt_2=keyFunc_winbind_binding(2)

caps_lalt_3=keyFunc_winbind_binding(3)

caps_lalt_4=keyFunc_winbind_binding(4)

caps_lalt_5=keyFunc_winbind_binding(5)

caps_lalt_6=keyFunc_winbind_binding(6)

caps_lalt_7=keyFunc_winbind_binding(7)

caps_lalt_8=keyFunc_winbind_binding(8)

caps_lalt_9=keyFunc_winbind_binding(9)

caps_lalt_0=keyFunc_winbind_binding(10)

caps_lalt_minus=keyFunc_doNothing

caps_lalt_equal=keyFunc_doNothing

;删除全部
caps_lalt_backspace=keyFunc_deleteAll

caps_lalt_tab=keyFunc_doNothing

;删除至页首
caps_lalt_leftSquareBracket=keyFunc_deleteToPageBeginning

;Capslock+LAlt+]
caps_lalt_rightSquareBracket=keyFunc_doNothing

;Capslock+LAlt+\
caps_lalt_backslash=keyFunc_doNothing

;移动至页尾
caps_lalt_semicolon=keyFunc_moveToPageEnd

caps_lalt_quote=keyFunc_doNothing

caps_lalt_enter=keyFunc_doNothing

;选中当前行
caps_lalt_comma=caps_comma=keyFunc_selectCurrentLine

;向右选中 3 个单词
caps_lalt_dot=keyFunc_selectWordRight(3)

;删除至页尾
caps_lalt_slash=keyFunc_deleteToPageEnd

caps_lalt_space=keyFunc_doNothing

caps_lalt_ralt=keyFunc_doNothing

caps_lalt_f1=keyFunc_doNothing

caps_lalt_f2=keyFunc_doNothing

caps_lalt_f3=keyFunc_doNothing

caps_lalt_f4=keyFunc_doNothing

caps_lalt_f5=keyFunc_doNothing

caps_lalt_f6=keyFunc_doNothing

caps_lalt_f7=keyFunc_doNothing

caps_lalt_f8=keyFunc_doNothing

caps_lalt_f9=keyFunc_doNothing

caps_lalt_f10=keyFunc_doNothing

caps_lalt_f11=keyFunc_doNothing

caps_lalt_f12=keyFunc_doNothing

caps_lalt_wheelUp=keyFunc_doNothing

caps_lalt_wheelDown=keyFunc_doNothing

; CapsLock + Windows + 0~9 -> 绑定窗口 0~9
caps_win_1=keyFunc_winbind_binding(1)

caps_win_2=keyFunc_winbind_binding(2)

caps_win_3=keyFunc_winbind_binding(3)

caps_win_4=keyFunc_winbind_binding(4)

caps_win_5=keyFunc_winbind_binding(5)

caps_win_6=keyFunc_winbind_binding(6)

caps_win_7=keyFunc_winbind_binding(7)

caps_win_8=keyFunc_winbind_binding(8)

caps_win_9=keyFunc_winbind_binding(9)

caps_win_0=keyFunc_winbind_binding(10)


;----------------其他功能----------------

;上一首
keyFunc_mediaPrev

;暂停 / 播放
keyFunc_mediaPlayPause

;音量增大
keyFunc_volumeUp

;音量减小
keyFunc_volumeDown

;静音
keyFunc_volumeMute


)
global lang_winsInfosRecorderIniInit:=""
lang_winsInfosRecorderIniInit=
(
;------------ Encoding: UTF-16 ------------
;这里记录着窗口的数据，不要手动修改本文件内容，点下右上角的"X"就好。

[0]
bindType=
class_0=
exe_0=
id_0=
[1]
bindType=
class_0=
exe_0=
id_0=
[2]
bindType=
class_0=
exe_0=
id_0=
[3]
bindType=
class_0=
exe_0=
id_0=
[4]
bindType=
class_0=
exe_0=
id_0=
[5]
bindType=
class_0=
exe_0=
id_0=
[6]
bindType=
class_0=
exe_0=
id_0=
[7]
bindType=
class_0=
exe_0=
id_0=
[8]
bindType=
class_0=
exe_0=
id_0=
)

