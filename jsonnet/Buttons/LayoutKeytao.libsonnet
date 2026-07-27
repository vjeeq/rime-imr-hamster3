# =====================================
# 此文件用于自定义键盘按键功能。
# 可根据需要修改下方内容，调整各类按键的行为
# 修改完成后，保存本文件，然后回到皮肤界面，
# 长按皮肤，选择「运行 main.jsonnet」生效。
#
# 包含中文26键布局和英文26键布局中的字母键
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
      swipeUp: { action: { character: '1' }, text: 'iu ua' },
      swipeDown: { text: 'ZH' },
      longPress: [
        { action: { character: 'Q' } },
      ],
    },
  },
  wButton: {
    name: 'wButton',
    params: {
      action: { character: 'w' },
      uppercased: { action: { character: 'W' } },
      swipeUp: { action: { character: '2' }, text: 'ei un' },
      swipeDown: { text: 'CH' },
      longPress: [
        { action: { character: 'W' } },
      ],
    },
  },
  eButton: {
    name: 'eButton',
    params: {
      action: { character: 'e' },
      uppercased: { action: { character: 'E' } },
      swipeUp: { action: { character: '3' }, text: 'sh e' },
      longPress: [
        { action: { character: 'E' } },
      ],
    },
  },
  rButton: {
    name: 'rButton',
    params: {
      action: { character: 'r' },
      uppercased: { action: { character: 'R' } },
      swipeUp: { action: { character: '4' }, text: 'eng' },
      longPress: [
        { action: { character: 'R' } },
      ],
    },
  },
  tButton: {
    name: 'tButton',
    params: {
      action: { character: 't' },
      uppercased: { action: { character: 'T' } },
      swipeUp: { action: { character: '5' }, text: 'uan' },
      longPress: [
        { action: { character: 'T' } },
      ],
    },
  },
  yButton: {
    name: 'yButton',
    params: {
      action: { character: 'y' },
      uppercased: { action: { character: 'Y' } },
      swipeUp: { action: { character: '6' }, text: 'ong' },
      swipeDown: { text: 'iong' },
      longPress: [
        { action: { character: 'Y' } },
      ],
    },
  },
  uButton: {
    name: 'uButton',
    params: {
      action: { character: 'u' },
      uppercased: { action: { character: 'U' } },
      swipeUp: { action: { character: '7' }, text: '丿月' },
      swipeDown: { text: '十o' },
      longPress: [
        { action: { character: 'U' } },
      ],
    },
  },
  iButton: {
    name: 'iButton',
    params: {
      action: { character: 'i' },
      uppercased: { action: { character: 'I' } },
      swipeUp: { action: { character: '8' }, text: '丨亻' },
      swipeDown: { text: '扌艹 钅' },
      longPress: [
        { action: { character: 'I' } },
      ],
    },
  },
  oButton: {
    name: 'oButton',
    params: {
      action: { character: 'o' },
      uppercased: { action: { character: 'O' } },
      swipeUp: { action: { character: '9' }, text: '丶口' },
      swipeDown: { text: '日i' },
      longPress: [
        { action: { character: 'O' } },
      ],
    },
  },
  pButton: {
    name: 'pButton',
    params: {
      action: { character: 'p' },
      uppercased: { action: { character: 'P' } },
      swipeUp: { action: { character: '0' }, text: 'ang' },
      longPress: [
        { action: { character: 'P' } },
      ],
    },
  },

  // 第二行字母键 (ASDF)
  aButton: {
    name: 'aButton',
    params: {
      action: { character: 'a' },
      uppercased: { action: { character: 'A' } },
      swipeUp: { text: '乛氵' },
      swipeDown: { text: '贝o' },
      longPress: [
        { action: { character: 'A' } },
      ],
    },
  },
  sButton: {
    name: 'sButton',
    params: {
      action: { character: 's' },
      uppercased: { action: { character: 'S' } },
      swipeUp: { text: 'a ia' },
      longPress: [
        { action: { character: 'S' } },
      ],
    },
  },
  dButton: {
    name: 'dButton',
    params: {
      action: { character: 'd' },
      uppercased: { action: { character: 'D' } },
      swipeUp: { text: 'ie ou' },
      longPress: [
        { action: { character: 'D' } },
      ],
    },
  },
  fButton: {
    name: 'fButton',
    params: {
      action: { character: 'f' },
      uppercased: { action: { character: 'F' } },
      swipeUp: { text: 'an' },
      swipeDown: { text: 'ZH' },
      longPress: [
        { action: { character: 'F' } },
      ],
    },
  },
  gButton: {
    name: 'gButton',
    params: {
      action: { character: 'g' },
      uppercased: { action: { character: 'G' } },
      swipeUp: { text: 'ing' },
      swipeDown: { text: 'uai' },
      longPress: [
        { action: { character: 'G' } },
      ],
    },
  },
  hButton: {
    name: 'hButton',
    params: {
      action: { character: 'h' },
      uppercased: { action: { character: 'H' } },
      swipeUp: { text: 'ai üe' },
      longPress: [
        { action: { character: 'H' } },
      ],
    },
  },
  jButton: {
    name: 'jButton',
    params: {
      action: { character: 'j' },
      uppercased: { action: { character: 'J' } },
      swipeUp: { text: 'u er' },
      swipeDown: { text: 'CH' },
      longPress: [
        { action: { character: 'J' } },
      ],
    },
  },
  kButton: {
    name: 'kButton',
    params: {
      action: { character: 'k' },
      uppercased: { action: { character: 'K' } },
      swipeUp: { text: 'i' },
      longPress: [
        { action: { character: 'K' } },
      ],
    },
  },
  lButton: {
    name: 'lButton',
    params: {
      action: { character: 'l' },
      uppercased: { action: { character: 'L' } },
      swipeUp: { text: 'o uo' },
      swipeDown: { text: 'ü' },
      longPress: [
        { action: { character: 'L' } },
      ],
    },
  },

  // 第三行字母键 (ZXCV)
  zButton: {
    name: 'zButton',
    params: {
      action: { character: 'z' },
      uppercased: { action: { character: 'Z' } },
      swipeUp: { text: 'ao' },
      longPress: [
        { action: { character: 'Z' } },
      ],
    },
  },
  xButton: {
    name: 'xButton',
    params: {
      action: { character: 'x' },
      uppercased: { action: { character: 'X' } },
      swipeUp: { text: 'uang' },
      swipeDown: { text: 'iang' },
      longPress: [
        { action: { character: 'X' } },
      ],
    },
  },
  cButton: {
    name: 'cButton',
    params: {
      action: { character: 'c' },
      uppercased: { action: { character: 'C' } },
      swipeUp: { text: 'iao' },
      longPress: [
        { action: { character: 'C' } },
      ],
    },
  },
  vButton: {
    name: 'vButton',
    params: {
      action: { character: 'v' },
      uppercased: { action: { character: 'V' } },
      swipeUp: { text: '一木' },
      swipeDown: { text: '土o' },
      longPress: [
        { action: { character: 'V' } },
      ],
    },
  },
  bButton: {
    name: 'bButton',
    params: {
      action: { character: 'b' },
      uppercased: { action: { character: 'B' } },
      swipeUp: { text: 'in ui' },
      longPress: [
        { action: { character: 'B' } },
      ],
    },
  },
  nButton: {
    name: 'nButton',
    params: {
      action: { character: 'n' },
      uppercased: { action: { character: 'N' } },
      swipeUp: { text: 'en' },
      longPress: [
        { action: { character: 'N' } },
      ],
    },
  },
  mButton: {
    name: 'mButton',
    params: {
      action: { character: 'm' },
      uppercased: { action: { character: 'M' } },
      swipeUp: { text: 'uang' },
      swipeDown: { text: 'ian' },
      longPress: [
        { action: { character: 'M' } },
      ],
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
