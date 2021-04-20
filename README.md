---

## 怎么运行Capslock+的源码？
1. 下载 [AutoHotkey (v1.1.+)](http://www.ahkscript.org/)，并安装。
2. 从 GitHub 下载 Capslock+ 源码。
3. 运行`Capslock+.ahk`。

## 怎么修改某个热键为自定义功能？
1. 在 `/userAHK/main.ahk`，编写自定义的按键功能函数，例如 `keyFunc_example1`
2. 在 `CapsLock+settings.ini` 的 [Keys] 字段下添加设置按键设置，例如：
    `caps_f7=keyFunc_example1`
3. 保存后重载 Capslock+ (Capslock+F5)
4. 之后再按下 `CapsLock+F7` 就可以触发该函数。

* 为了避免按键设置会调到内部函数，所以规定了所有函数以`keyfunc_`开头

## 怎么修改原有的功能？
`lib_keysFunction.ahk`修改这个文件

|文件|说明|
|:---|:---|
|lib_bindWins.ahk|窗口绑定|
|lib_functions.ahk|一些依赖函数|
|lib_json.ahk|json库|
|lib_keysFunction.ahk|几乎所有按键功能都在这实现|
|lib_keysSet.ahk|热键布局|
|lib_loadAnimation.ahk|程序加载动画|
|lib_settings.ahk|Capslock+settings.ini设置项提取|
|lib_ydTrans.ahk|翻译|

## 编译
可以编译也可以不编译,不编译更有利于分发给别人使用
编译执行build.bat 即可

## 编译
可以编译也可以不编译,不编译更有利于分发给别人使用
编译执行build.bat 即可
