# =====================================
# 此文件用于自定义键盘按键功能。
# 可根据需要修改下方内容，调整各类按键的行为
# 修改完成后，保存本文件，然后回到皮肤界面，
# 长按皮肤，选择「运行 main.jsonnet」生效。
#
# KeyTao 布局
# 无 preedit 时 = 符号版 (Layout26)
# 有 preedit 时 = 拼音提示版
# =====================================

local colors = import '../Constants/Colors.libsonnet';
local fonts = import '../Constants/Fonts.libsonnet';
local settings = import '../Settings.libsonnet';

{
  local root = self,

  // 按键定义
  qButton: {
    name: 'qButton',
    params: {
      action: { character: 'q' },
      uppercased: { action: { character: 'Q' } },
      swipeUp: { action: { character: '1' } },
      swipeDown: { text: 'ZH' },
      longPress: [
        { action: { character: 'Q' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'iu ua' },
        swipeDown: { text: 'ZH' },
      },
    },
  },
  wButton: {
    name: 'wButton',
    params: {
      action: { character: 'w' },
      uppercased: { action: { character: 'W' } },
      swipeUp: { action: { character: '2' } },
      swipeDown: { text: 'CH' },
      longPress: [
        { action: { character: 'W' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'ei un' },
        swipeDown: { text: 'CH' },
      },
    },
  },
  eButton: {
    name: 'eButton',
    params: {
      action: { character: 'e' },
      uppercased: { action: { character: 'E' } },
      swipeUp: { action: { character: '3' } },
      swipeDown: { text: 'SH' },
      longPress: [
        { action: { character: 'E' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'e' },
        swipeDown: { text: 'SH' },
      },
    },
  },
  rButton: {
    name: 'rButton',
    params: {
      action: { character: 'r' },
      uppercased: { action: { character: 'R' } },
      swipeUp: { action: { character: '4' } },
      longPress: [
        { action: { character: 'R' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'eng' },
      },
    },
  },
  tButton: {
    name: 'tButton',
    params: {
      action: { character: 't' },
      uppercased: { action: { character: 'T' } },
      swipeUp: { action: { character: '5' } },
      longPress: [
        { action: { character: 'T' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'uan' },
      },
    },
  },
  yButton: {
    name: 'yButton',
    params: {
      action: { character: 'y' },
      uppercased: { action: { character: 'Y' } },
      swipeUp: { action: { character: '6' } },
      longPress: [
        { action: { character: 'Y' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'ong' },
        swipeDown: { text: 'iong' },
      },
    },
  },
  uButton: {
    name: 'uButton',
    params: {
      action: { character: 'u' },
      uppercased: { action: { character: 'U' } },
      swipeUp: { action: { character: '7' } },
      longPress: [
        { action: { character: 'U' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: '丿月' },
        swipeDown: { text: '十o' },
      },
    },
  },
  iButton: {
    name: 'iButton',
    params: {
      action: { character: 'i' },
      uppercased: { action: { character: 'I' } },
      swipeUp: { action: { character: '8' } },
      longPress: [
        { action: { character: 'I' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: '丨亻' },
        swipeDown: { text: '扌艹 钅' },
      },
    },
  },
  oButton: {
    name: 'oButton',
    params: {
      action: { character: 'o' },
      uppercased: { action: { character: 'O' } },
      swipeUp: { action: { character: '9' } },
      longPress: [
        { action: { character: 'O' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: '丶口' },
        swipeDown: { text: '日i' },
      },
    },
  },
  pButton: {
    name: 'pButton',
    params: {
      action: { character: 'p' },
      uppercased: { action: { character: 'P' } },
      swipeUp: { action: { character: '0' } },
      longPress: [
        { action: { character: 'P' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'ang' },
      },
    },
  },

  // 第二行字母键 (ASDF)
  aButton: {
    name: 'aButton',
    params: {
      action: { character: 'a' },
      uppercased: { action: { character: 'A' } },
      swipeUp: { action: { character: '+' } },
      swipeDown: { action: { character: '=' } },
      longPress: [
        { action: { character: 'A' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: '乛氵' },
        swipeDown: { text: '贝o' },
      },
    },
  },
  sButton: {
    name: 'sButton',
    params: {
      action: { character: 's' },
      uppercased: { action: { character: 'S' } },
      swipeUp: { action: { character: '*' } },
      swipeDown: { action: { character: '^' } },
      longPress: [
        { action: { character: 'S' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'a ia' },
      },
    },
  },
  dButton: {
    name: 'dButton',
    params: {
      action: { character: 'd' },
      uppercased: { action: { character: 'D' } },
      swipeUp: { action: { character: '"' } },
      swipeDown: { action: { character: "'" } },
      longPress: [
        { action: { character: 'D' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'ie ou' },
      },
    },
  },
  fButton: {
    name: 'fButton',
    params: {
      action: { character: 'f' },
      uppercased: { action: { character: 'F' } },
      swipeUp: { action: { character: '<' } },
      swipeDown: { text: '> ZH' },
      longPress: [
        { action: { character: 'F' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'an' },
        swipeDown: { text: 'ZH' },
      },
    },
  },
  gButton: {
    name: 'gButton',
    params: {
      action: { character: 'g' },
      uppercased: { action: { character: 'G' } },
      swipeUp: { action: { character: '(' } },
      swipeDown: { action: { character: ')' } },
      longPress: [
        { action: { character: 'G' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'ing' },
        swipeDown: { text: 'uai' },
      },
    },
  },
  hButton: {
    name: 'hButton',
    params: {
      action: { character: 'h' },
      uppercased: { action: { character: 'H' } },
      swipeUp: { action: { character: '[' } },
      swipeDown: { action: { character: ']' } },
      longPress: [
        { action: { character: 'H' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'ai üe' },
      },
    },
  },
  jButton: {
    name: 'jButton',
    params: {
      action: { character: 'j' },
      uppercased: { action: { character: 'J' } },
      swipeUp: { action: { character: '{' } },
      swipeDown: { text: '} CH' },
      longPress: [
        { action: { character: 'J' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'u er' },
        swipeDown: { text: 'CH' },
      },
    },
  },
  kButton: {
    name: 'kButton',
    params: {
      action: { character: 'k' },
      uppercased: { action: { character: 'K' } },
      swipeUp: { action: { character: ':' } },
      longPress: [
        { action: { character: 'K' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'i' },
      },
    },
  },
  lButton: {
    name: 'lButton',
    params: {
      action: { character: 'l' },
      uppercased: { action: { character: 'L' } },
      swipeUp: { action: { character: ';' } },
      longPress: [
        { action: { character: 'L' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'o uo' },
        swipeDown: { text: 'ü' },
      },
    },
  },

  // 第三行字母键 (ZXCV)
  zButton: {
    name: 'zButton',
    params: {
      action: { character: 'z' },
      uppercased: { action: { character: 'Z' } },
      swipeUp: { action: { character: '/' } },
      longPress: [
        { action: { character: 'Z' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'ao' },
      },
    },
  },
  xButton: {
    name: 'xButton',
    params: {
      action: { character: 'x' },
      uppercased: { action: { character: 'X' } },
      swipeUp: { action: { character: '-' } },
      swipeDown: { action: { character: '\\' } },
      longPress: [
        { action: { character: 'X' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'uang' },
        swipeDown: { text: 'iang' },
      },
    },
  },
  cButton: {
    name: 'cButton',
    params: {
      action: { character: 'c' },
      uppercased: { action: { character: 'C' } },
      swipeUp: { action: { character: '_' } },
      swipeDown: { action: { character: '|' } },
      longPress: [
        { action: { character: 'C' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'iao' },
      },
    },
  },
  vButton: {
    name: 'vButton',
    params: {
      action: { character: 'v' },
      uppercased: { action: { character: 'V' } },
      swipeUp: { action: { character: '&' } },
      swipeDown: { action: { character: '$' } },
      longPress: [
        { action: { character: 'V' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: '一木' },
        swipeDown: { text: '土o' },
      },
    },
  },
  bButton: {
    name: 'bButton',
    params: {
      action: { character: 'b' },
      uppercased: { action: { character: 'B' } },
      swipeUp: { action: { character: '%' } },
      swipeDown: { action: { character: '`' } },
      longPress: [
        { action: { character: 'B' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'in ui' },
      },
    },
  },
  nButton: {
    name: 'nButton',
    params: {
      action: { character: 'n' },
      uppercased: { action: { character: 'N' } },
      swipeUp: { action: { character: '!' } },
      swipeDown: { action: { character: '@' } },
      longPress: [
        { action: { character: 'N' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'en' },
      },
    },
  },
  mButton: {
    name: 'mButton',
    params: {
      action: { character: 'm' },
      uppercased: { action: { character: 'M' } },
      swipeUp: { action: { character: '?' } },
      swipeDown: { action: { character: '#' } },
      longPress: [
        { action: { character: 'M' } },
      ],
      whenPreeditChanged: {
        swipeUp: { text: 'uang' },
        swipeDown: { text: 'ian' },
      },
    },
  },

  letterButtons: [
    self.qButton, self.wButton, self.eButton, self.rButton, self.tButton,
    self.yButton, self.uButton, self.iButton, self.oButton, self.pButton,
    self.aButton, self.sButton, self.dButton, self.fButton, self.gButton,
    self.hButton, self.jButton, self.kButton, self.lButton,
    self.zButton, self.xButton, self.cButton, self.vButton, self.bButton,
    self.nButton, self.mButton,
  ],
}
