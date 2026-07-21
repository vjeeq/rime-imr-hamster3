#======================================
# 皮肤设置文件。改完保存后，长按皮肤 →「运行 main.jsonnet」
#======================================
{
  # 键盘布局:  9=九键  17=17键  26=全键  sigma=西戈拼音
  keyboardLayout: '26',

  # 数字键盘:  9=九宫格  row=横排  hex=十六进制
  numericLayout: '9',

  # 符号键盘:  default=系统自带  row=横排  classified=分类
  symbolicLayout: 'default',

  # 打字时空格键显示的文字（仅 26/17/sigma 布局有效）
  spaceButtonComposingText: '选定',

  # iPad 模式 (true=是  false=否)
  iPad: false,

  # 方案名显示位置：{ x: 0~1, y: 0~1 }，null=不显示
  spaceButtonSchemaNameCenter: { x: 0.5, y: 0.7 },  # 水平居中，靠下

  # 上划提示位置:  hide/top/topLeft/topRight/bottom/bottomLeft/bottomRight
  swipeUpTextCenter: 'top',
  # 下划提示位置:  同上
  swipeDownTextCenter: 'bottom',


  # toolbar 按钮配置
  # 注意第一个和最后一个按键是固定的，不可配置
  # 按钮代号列表如下：
  # 【元书相关】
  # 1-脚本  2-常用语  3-剪贴板
  # 4-皮肤  5-文件管理器  6-方案切换
  # 7-数字键盘  8-符号键盘  9-表情键盘
  # 10-查看性能  11-左手模式  12-右手模式
  # 【Rime 相关】
  # 13-Rime同步  14-Rime部署  15-方案管理
  # 16-快符  17-RimeSwitcher
  # 【皮肤相关】
  # 18-皮肤微调  19-按键功能定义
  # 【文本编辑相关】
  # 20-全选  21-复制  22-剪切
  # 23-粘贴  24-撤销  25-重做
  # 26-左移  27-右移
  #
  # 将上述代号填入下面的数组即可
  toolbarSlideButtons: [ 17, 8, 9, 12 ],
  # 工具栏滑动区宽度（占几个按钮位）
  toolbarSlideButtonsMaxCount: { portrait: 5, landscape: 8 },

  # 优先显示图标 (true=图标  false=文字)
  preferIcon: true,

  # 主题色:  0无  1红  2绿  3橙  4蓝  5紫
  accentColor: 4,

  # 中文模式下字母键大写 (true=大写  false=小写，仅 26键/西戈 有效)
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
