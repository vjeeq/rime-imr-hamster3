#======================================
# 皮肤设置文件。改完保存后，长按皮肤 →「运行 main.jsonnet」
#======================================
{
  # 键盘布局:  9=九键  26=全键（KeyTao 布局）
  keyboardLayout: '26',

  # 数字键盘:  9=九宫格  row=横排  hex=十六进制
  numericLayout: '9',

  # 符号键盘:  default=系统自带  row=横排  classified=分类
  symbolicLayout: 'default',

  # 打字时空格键显示的文字（仅 26 布局有效）
  spaceButtonComposingText: '选定',

  # iPad 模式（影响内边距、数字键长按；键盘高度现在由 keyboardHeight 控制）
  iPad: false,

  # 键盘高度（不含预编辑区和工具栏）
  keyboardHeight: {
    phonePortrait: 216,
    phoneLandscape: 160,
    padPortrait: 216,
    padLandscape: 240,  # iPad 横屏比手机横屏高 50%
  },

  # 分屏键盘（左右手分开，横屏时中间留空）
  # iPhone / iPad 横屏是否分屏
  splitPhoneLandscape: true,
  splitPadLandscape: true,
  # iPad 竖屏是否也分屏
  splitPadPortrait: true,

  # 分屏中间空隙占整个键盘宽度的比例（左右各占剩下的半边）
  splitGapPercent: {
    phonePortrait: 0.12,  # 手机竖屏不分屏，占位
    phoneLandscape: 0.12,
    padPortrait: 0.12,
    padLandscape: 0.35,
  },

  # iPad 工具栏是否显示地球键（切换输入法）
  # iPhone 下面有系统自带的地球键，所以不需要
  showNextKeyboardOnPad: true,

  # 方案名显示位置：{ x: 0~1, y: 0~1 }，null=不显示
  spaceButtonSchemaNameCenter: { x: 0.5, y: 0.7 },  # 水平居中，靠下

  # 上划提示位置:  hide/top/topLeft/topRight/bottom/bottomLeft/bottomRight
  swipeUpTextCenter: 'top',
  # 下划提示位置:  同上
  swipeDownTextCenter: 'bottom',


  # 工具栏按钮固定为：
  #   iPhone 竖屏：效率 / Rime切换 / 符号 / emoji / 关闭
  #   iPhone 横屏：分屏切换 / 效率 / Rime切换 / 符号 / emoji / 关闭
  #   iPad：      地球键 / 分屏切换 / 效率 / Rime切换 / 符号 / emoji / 关闭

  # 优先显示图标 (true=图标  false=文字)
  preferIcon: true,

  # 主题色:  0无  1红  2绿  3橙  4蓝  5紫
  accentColor: 4,

  # 中文模式下字母键大写 (true=大写  false=小写，仅 26 键有效)
  uppercaseForChinese: true,

  # Shift 键行为
  shiftButtonParams: {
    systemImageName: 'shift',
    action: 'shift',
    uppercased: { systemImageName: 'shift.fill', },
    capsLocked: { systemImageName: 'capslock.fill', },
    whenPreeditChanged: {
      action: 'shift',
      systemImageName: 'shift',
      swipeUp: { action: { sendKeys:'tab' } },
      swipeDown: { action: { sendKeys: 'Shift+tab' } },
    },
  },

  # 快符（分号）
  quickAction: { character: ';' },
}
