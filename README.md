## 「空山素影」皮肤特点
- 支持 9 键和 26 键（KeyTao）布局，并适配 iPhone / iPad 的横竖屏与分体/连体键盘。
- 数字键盘布局包括九宫格、全键盘、16进制等布局。
- 符号键盘布局包括默认、全键盘、分类符号等布局。
- 不包含图片资源，风格接近原生键盘。
- 工具栏按钮固定为 效率 / Rime切换 / 符号 / emoji / 关闭；iPad 另有地球键，分屏时另有分体/连体切换。
- 空格键显示当前输入方案名称，方便查看当前输入方案。
- 中文模式下字母键大写显示，英文模式下字母键小写显示，是中文还是英文一目了然。
- shift 键在打字过程中充当“分词”功能（分词功能为输入单引号，可以在“微调”中调整为其它符号）。
- 支持按键上下划动功能，26键盘布局可以输入 PC 键盘上的所有符号，可快速设置是否显示划动提示文字。
- a,z,x,c,v 五个按键下划对应全选、撤销、剪切、复制、粘贴，与 PC 键盘习惯一致。
- 按键支持特定的自定义语法，可以非常简单地实现各种按键功能。
- 主题色可选，满足不同用户的审美需求。
- 可以使用浮动面板中的“微调”功能对皮肤进行快速调整。

## 上下划动功能说明
```
1234567890 上划功能
qwertyuiop 按键
       |<> 下划功能，q下划输入Tab

!^/;(-#{" 上划功能
asdfghjkl 按键
 `\:)_+}' 下划功能，a全选

@*%=[&? 上划功能
zxcvbnm 按键
    ]~$ 下划功能，z撤销、x剪切、c复制、v粘贴

backspace 输入中上划可删除一个音节
123 上划切换符号键盘，下划切换 emoji 键盘
逗号 上划输入句号
中/En 上划切换方案
enter 上划行首，下划行尾，长按换行
```

## 自定义皮肤调整说明

- 皮肤的基本设置`jsonnet/Settings.libsonnet`
  + 浮动键盘中的“微调”可以直接打开该文件进行编辑。
  + 修改后保存，重新编译皮肤即可生效。

- 键盘按键功能设置`jsonnet/Buttons/`
  + 浮动键盘中的“按键”会打开`jsonnet/Buttons/`文件夹下的 README.md，方便查看各按键在哪个文件
  + 退出 README.md 后再打开同目录下的具体按键文件进行编辑。
  + 修改后保存，重新编译皮肤即可生效。

## 分屏 / 连体 / iPad / 地球键

- 编译时会同时生成两套布局：`phone` 与 `pad`。
  - iPhone 用 `pinyinPortrait` / `pinyinLandscape` 等；
  - iPad 用 `pinyinPadPortrait` / `pinyinPadLandscape` 等；
  - iPad 浮动键盘沿用手机竖屏布局（浮动模式不带分屏、连体切换和地球键）。
- `Settings.libsonnet` 中的设置：
  - `keyboardHeight`：键盘高度（不含预编辑区和工具栏）
    - `phonePortrait: 216`、`phoneLandscape: 160`
    - `padPortrait: 216`、`padLandscape: 240`
  - `splitGapPercent`：分屏中间空隙占整个键盘宽度的比例
    - `phoneLandscape: 0.12`、`padPortrait: 0.12`、`padLandscape: 0.35`
    - iPhone 横屏 / iPad 竖屏左右各 44%；iPad 横屏左右各 32.5%
  - `splitPhoneLandscape` / `splitPadLandscape` / `splitPadPortrait`：是否启用分屏
  - `showNextKeyboardOnPad`：iPad 工具栏是否显示地球键
- 分屏只作用于 26 键中英键盘，左右各 6 列，重叠 T/Y、G/H、V/B：
  - 左：Q W E R T Y / A S D F G H / Shift Z X C V B / 简En ， 空格
  - 右：T Y U I O P / G H J K L □ / V B N M 退格 / 空格 ； 回车
  - 所有字母统一 1/6 半边宽；T/Y、G/H、V/B 两侧都有，按哪边都可以
  - `□` 是空位（透明、不可点）；退格占 2 格，正好填满右半第三行
- 分体 / 连体切换：
  - 连体是普通整行布局（宽屏上就是之前被拉长的样子）
  - 切换按钮在工具栏最左边；iPad 上在地球键右边
  - 分体里显示「连体」图标，连体里显示「分体」图标
  - 键盘类型：`pinyin` / `pinyinJoined`、`alphabetic` / `alphabeticJoined`
  - 简/En 会在同一模式内切换，不会把分体/连体弄丢
  - 手机竖屏不分屏，所以不显示这个按钮；分屏开关关闭时也不显示
- 数字键盘横屏本来就是左右分区，中间空隙调整为 8%
- 数字键盘的返回键使用 `returnLastKeyboard`，会回到进入数字键盘前的分体/连体模式
- 工具栏固定顺序：
  - iPhone 竖屏：效率 / Rime切换 / 符号 / emoji / 关闭
  - iPhone 横屏：分屏切换 / 效率 / Rime切换 / 符号 / emoji / 关闭
  - iPad：地球 / 分屏切换 / 效率 / Rime切换 / 符号 / emoji / 关闭
  - 原来的「面板」入口已移除
- iPad 地球键在工具栏最左边；有候选时工具栏会被候选栏盖住

## 手机端编译

长按皮肤，选择「运行 main.jsonnet」

## PC 端编译

PC 端编译时需要安装 `jsonnet` 等命令行工具。

```shell
# windows
jsonnet -S -m . --tla-code debug=true .\jsonnet\main.jsonnet

# linux/macOS
jsonnet -S -m . --tla-code debug=true ./jsonnet/main.jsonnet
```

## github 仓库地址
- [空山素影](https://github.com/luozikuan/kongshan-suying)
- [最新版本发布地址](https://github.com/luozikuan/kongshan-suying/releases/latest)
- [配套测试方案](https://github.com/luozikuan/rime-tailor)
