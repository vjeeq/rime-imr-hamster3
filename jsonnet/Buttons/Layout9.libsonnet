# =====================================
# 此文件用于自定义键盘按键功能。
# 可根据需要修改下方内容，调整各类按键的行为
# 修改完成后，保存本文件，然后回到皮肤界面，
# 长按皮肤，选择「运行 main.jsonnet」生效。
#
# 包含中文9键布局的按键
# =====================================

local colors = import '../Constants/Colors.libsonnet';
local fonts = import '../Constants/Fonts.libsonnet';
local settings = import '../Settings.libsonnet';
local commonButtons = import './Common.libsonnet';

{
  local root = self,

  // T9 按键
  t9OneButton: {
    name: 't9OneButton',
    params: {
      text: 'by*',
      action: { character: '1' },
      swipeUp: { text: '1' },
      swipeDown: { text: '⼀' },
      longPress: [
        { text: 'b', action: { symbol: 'b' }, selected: true },
        { text: 'y', action: { symbol: 'y' } },
      ],
    },
  },
  t9TwoButton: {
    name: 't9TwoButton',
    params: {
      text: 'kvc',
      action: { character: '2' },
      swipeUp: { text: '2' },
      swipeDown: { text: '⼁' },
      longPress: [
        { text: 'k', action: { symbol: 'k' } },
        { text: 'v', action: { symbol: 'v' }, selected: true },
        { text: 'c', action: { symbol: 'c' } },
      ],
    },
  },
  t9ThreeButton: {
    name: 't9ThreeButton',
    params: {
      text: 'qso',
      action: { character: '3' },
      swipeUp: { text: '3' },
      swipeDown: { text: '⼃' },
      longPress: [
        { text: 'q', action: { symbol: 'q' } },
        { text: 's', action: { symbol: 's' }, selected: true },
        { text: 'o', action: { symbol: 'o' } },
      ],
    },
  },
  t9FourButton: {
    name: 't9FourButton',
    params: {
      text: 'fnz',
      action: { character: '4' },
      swipeUp: { text: '4' },
      swipeDown: { text: '⼂' },
      longPress: [
        { text: 'f', action: { symbol: 'f' }, selected: true },
        { text: 'n', action: { symbol: 'n' } },
        { text: 'z', action: { symbol: 'z' } },
      ],
    },
  },
  t9FiveButton: {
    name: 't9FiveButton',
    params: {
      text: 'pix',
      action: { character: '5' },
      swipeUp: { text: '5' },
      swipeDown: { text: '⼄' },
      longPress: [
        { text: 'p', action: { symbol: 'p' } },
        { text: 'i', action: { symbol: 'i' }, selected: true },
        { text: 'x', action: { symbol: 'x' } },
      ],
    },
  },
  t9SixButton: {
    name: 't9SixButton',
    params: {
      text: 'gte',
      action: { character: '6' },
      swipeUp: { text: '6' },
      swipeDown: { text: '*' },
      longPress: [
        { text: 'g', action: { symbol: 'g' } },
        { text: 't', action: { symbol: 't' } },
        { text: 'e', action: { symbol: 'e' }, selected: true },
      ],
    },
  },
  t9SevenButton: {
    name: 't9SevenButton',
    params: {
      text: 'jml',
      action: { character: '7' },
      swipeUp: { text: '7' },
      longPress: [
        { text: 'j', action: { symbol: 'j' }, selected: true },
        { text: 'm', action: { symbol: 'm' } },
        { text: 'l', action: { symbol: 'l' } },
      ],
    },
  },
  t9EightButton: {
    name: 't9EightButton',
    params: {
      text: 'ruw',
      action: { character: '8' },
      swipeUp: { text: '8' },
      longPress: [
        { text: 'r', action: { symbol: 'r' } },
        { text: 'u', action: { symbol: 'u' }, selected: true },
        { text: 'w', action: { symbol: 'w' } },
      ],
    },
  },
  t9NineButton: {
    name: 't9NineButton',
    params: {
      text: 'hda',
      action: { character: '9' },
      swipeUp: { text: '9' },
      longPress: [
        { text: 'h', action: { symbol: 'h' } },
        { text: 'd', action: { symbol: 'd' } },
        { text: 'a', action: { symbol: 'a' }, selected: true },
      ],
    },
  },
  t9ZeroButton: {
    name: 't9ZeroButton',
    params: {
      text: '0',
      action: { character: '0' },
      longPress: [
        { text: ';', action: { character: ';' } },
      ],
      size: {
        width: { percentage: 0.25 },
      },
    },
  },


  // t9拼音符号列表兼拼音候选
  t9SymbolsCollection: {
    name: 't9SymbolsCollection',
    params: {
      type: 't9Symbols',
    },
  },

  // 横屏时的 T9 候选列表
  t9CandidatesCollection: {
    name: 't9CandidatesCollection',
    params: {
      type: 'verticalCandidates',
    },
  },

  // 空格，增加上划输入数字 0 功能
  spaceButton: {
    name: 'spaceButton',
    params: {
      action: 'space',
      systemImageName: 'space',
      center: { x: 0.5, y: 0.5 },
    },
  },

  // 光标右移
  cursorRightButton: {
    name: 'cursorRightButton',
    params: {
      action: { sendKeys: 'Down' },
      text: '选择',
    }
  },

  t9aButton: {
    name: 't9aButton',
    params: {
      action: { symbol: '，' },
      text: '，',
      swipeUp: { action: { character: 'a', text: 'a' } },
      whenPreeditChanged: {
        action: { character: 'a' },
        text: 'A¹',
        swipeUp: {
          action: { character: 'A' },
          text: '',
        },
      },
    },
  },
  t9bButton: {
    name: 't9bButton',
    params: {
      action: { symbol: '。' },
      text: '。',
      swipeUp: { action: { character: 'b', text: 'b' } },
      whenPreeditChanged: {
        action: { character: 'b' },
        text: 'B²',
        swipeUp: {
          action: { character: 'B' },
          text: '',
        },
      },
    },
  },
  t9cButton: {
    name: 't9cButton',
    params: {
      action: { symbol: '？' },
      text: '？',
      swipeUp: { action: { character: 'c', text: 'c' } },
      whenPreeditChanged: {
        action: { character: 'c' },
        text: 'C³',
        swipeUp: {
          action: { character: 'C' },
          text: '',
        },
      },
    },
  },
  t9dButton: {
    name: 't9dButton',
    params: {
      action: { symbol: '：' },
      text: '：',
      swipeUp: { action: { character: 'd', text: 'd' } },
      whenPreeditChanged: {
        action: { character: 'd' },
        text: 'D⁴',
        swipeUp: {
          action: { character: 'D' },
          text: '',
        },
      },
    },
  },

  t9eButton: {
    name: 't9eButton',
    params: {
      action: { symbol: '～' },
      text: '～',
      swipeUp: { action: { character: 'e', text: 'e' } },
      whenPreeditChanged: {
        action: { character: 'e' },
        text: 'E⁰',
        swipeUp: {
          action: { character: 'E' },
          text: '',
        },
      },
    },
  },

  t9fButton: {
    name: 't9fButton',
    params: {
      action: { character: 'f' },
      text: 'f',
    },
  },


  t9Buttons: [
    self.t9OneButton,
    self.t9TwoButton,
    self.t9ThreeButton,
    self.t9FourButton,
    self.t9FiveButton,
    self.t9SixButton,
    self.t9SevenButton,
    self.t9EightButton,
    self.t9NineButton,
    self.t9ZeroButton,
    self.t9aButton,
    self.t9bButton,
    self.t9cButton,
    self.t9dButton,
    self.t9eButton,
    self.t9fButton,
  ],
}
