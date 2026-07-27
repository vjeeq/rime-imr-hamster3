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
        swipeUp: { action: { character: 'q' }, text: 'iu ua' },
        swipeDown: { action: { character: 'q' }, text: 'ZH' },
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
        swipeUp: { action: { character: 'w' }, text: 'ei un' },
        swipeDown: { action: { character: 'w' }, text: 'CH' },
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
        swipeUp: { action: { character: 'e' }, text: 'sh e' },
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
        swipeUp: { action: { character: 'r' }, text: 'eng' },
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
        swipeUp: { action: { character: 't' }, text: 'uan' },
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
        swipeUp: { action: { character: 'y' }, text: 'ong' },
        swipeDown: { action: { character: 'y' }, text: 'iong' },
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
        swipeUp: { action: { character: 'u' }, text: '丿月' },
        swipeDown: { action: { character: 'u' }, text: '十o' },
      },
      whenAlphabetic: {
        longPress: [
          { action: { character: 'U' } },
        ],
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
        swipeUp: { action: { character: 'i' }, text: '丨亻' },
        swipeDown: { action: { character: 'i' }, text: '扌艹 钅' },
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
        swipeUp: { action: { character: 'o' }, text: '丶口' },
        swipeDown: { action: { character: 'o' }, text: '日i' },
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
        swipeUp: { action: { character: 'p' }, text: 'ang' },
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
        swipeUp: { action: { character: 'a' }, text: '乛氵' },
        swipeDown: { action: { character: 'a' }, text: '贝o' },
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
        swipeUp: { action: { character: 's' }, text: 'a ia' },
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
        swipeUp: { action: { character: 'd' }, text: 'ie ou' },
      },
    },
  },
  fButton: {
    name: 'fButton',
    params: {
      action: { character: 'f' },
      uppercased: { action: { character: 'F' } },
      swipeUp: { action: { character: '<' } },
      swipeDown: { action: { character: '> ZH' } },
      longPress: [
        { action: { character: 'F' } },
      ],
      whenPreeditChanged: {
        swipeUp: { action: { character: 'f' }, text: 'an' },
        swipeDown: { action: { character: 'f' }, text: 'ZH' },
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
        swipeUp: { action: { character: 'g' }, text: 'ing' },
        swipeDown: { action: { character: 'g' }, text: 'uai' },
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
        swipeUp: { action: { character: 'h' }, text: 'ai üe' },
      },
    },
  },
  jButton: {
    name: 'jButton',
    params: {
      action: { character: 'j' },
      uppercased: { action: { character: 'J' } },
      swipeUp: { action: { character: '{' } },
      swipeDown: { action: { character: '} CH' } },
      longPress: [
        { action: { character: 'J' } },
      ],
      whenPreeditChanged: {
        swipeUp: { action: { character: 'j' }, text: 'u er' },
        swipeDown: { action: { character: 'j' }, text: 'CH' },
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
        swipeUp: { action: { character: 'k' }, text: 'i' },
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
        swipeUp: { action: { character: 'l' }, text: 'o uo' },
        swipeDown: { action: { character: 'l' }, text: 'ü' },
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
        swipeUp: { action: { character: 'z' }, text: 'ao' },
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
        swipeUp: { action: { character: 'x' }, text: 'uang' },
        swipeDown: { action: { character: 'x' }, text: 'iang' },
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
        swipeUp: { action: { character: 'c' }, text: 'iao' },
      },
      whenAlphabetic: {
        longPress: [
          { action: { character: 'C' } },
        ],
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
        swipeUp: { action: { character: 'v' }, text: '一木' },
        swipeDown: { action: { character: 'v' }, text: '土o' },
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
        swipeUp: { action: { character: 'b' }, text: 'in ui' },
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
        swipeUp: { action: { character: 'n' }, text: 'en' },
        longPress: [
          { action: { character: 'N' } },
        ],
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
        swipeUp: { action: { character: 'm' }, text: 'uang' },
        swipeDown: { action: { character: 'm' }, text: 'ian' },
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
