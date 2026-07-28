## ThinkVantage 按键的历史沿革：

ThinkVantage 按键传承自 IBM 时期 ThinkPad 上的`ThinkPad/Access IBM`按键
通常在开机状态下按下该按键可打开机体设置或IBM技术支持程序
如果正确使用原厂恢复盘完成过系统恢复，那么关机状态下按下该按键可以进入系统恢复功能（Rescue camp或Recovery）

联想收购IBM旗下个人电脑业务之后开始进行“去IBM化”操作
Access IBM 按键上的标识变为`ThinkVantage`
在使用 Windows XP/Vista 的机型中，开机状态下可启动 ThinkVantage Productivity Center，这是一个包含常用功能且能够被用户自定义的菜单。
由于标志性的颜色，这个键也被俗称为蓝键。
Productivity Center 菜单在安装时将兼容性设置为 Windows XP 或 Vista 后，即便是Windows 10 都仍然可用。

Windows 7 后，ThinkVantage 按键用于启动 ThinkVantage Toolbox/Lenovo Solution Center 硬件综合诊断程序。

Windows 8 后，各自分散的 ThinkVantage 应用逐渐被 Lenovo Settings 统一接管

在230系列（X、W、T等）这一代传统设计的ThinkPad后，新模具设计的轻薄ThinkPad上ThinkVantage 按键也逐渐退出了历史舞台（关机恢复功能变为在开机出现 BIOS 画面后敲一下回车启动）。
受此影响，在 Windows 10 下默认情况老机型的 ThinkVantage 按键没有任何对应功能


## 以下是在Win7环境下自定义ThinkVantage 按键的方法：

操作前请确认已安装 `Hotkey Features Integration（热键驱动程序 ）`,确认方法是当麦克风静音时指示灯是点亮状态

一、 打开开始菜单，输入 打开开始菜单，输入`regedit`，回车

二、启动注册表编辑器之后，找到` HKEY_LOCAL_MACHINE\\SOFTWARE\\IBM\\TPHOTKEY \\8001 `#很多机器可能没有8001这个键值，需要自己创建一下，

三、选中`8001`，选择 编辑--新建--字符串值，字符串命名为`file`

四、双击file，在“数值数据”栏填上你要运行的程序路径和文件名，例如：C:\Program Files (x86)\Internet Explorer\iexplore.exe

现在按下ThinkVantage，就可以打开你指定的软件了！