local pinyinComponent = import 'Components/Pinyin.libsonnet';
local temp26Component = import 'Components/Pinyin/PinyinTemp26.libsonnet';
local alphabeticComponent = import 'Components/Alphabetic.libsonnet';
local numericComponent = import 'Components/Numeric.libsonnet';
local numericRowEnComponent = import 'Components/Numeric/NumericRowEn.libsonnet';
local symbolicComponent = import 'Components/Symbolic.libsonnet';
local symbolicRowEnComponent = import 'Components/Symbolic/SymbolicRowEn.libsonnet';
local panelComponent = import 'Components/Panel.libsonnet';
local settings = import 'Settings.libsonnet';

local isKeytao = settings.keyboardLayout == 'keytao';

local nameToComponent = {
  pinyin: pinyinComponent,
  alphabetic: alphabeticComponent,
  numeric: numericComponent,
  panel: panelComponent,
  [if settings.symbolicLayout != 'default' then 'symbolic']: symbolicComponent,

  // 键道专用：分体 / 连体两种键盘类型
  [if isKeytao then 'pinyinJoined']: pinyinComponent,
  [if isKeytao then 'alphabeticJoined']: alphabeticComponent,

  // 这几个组件只有在特定条件下才会被使用
  [if !std.startsWith(settings.keyboardLayout, '26') then 'temp26Key']: temp26Component,
  [if settings.numericLayout == 'row' then 'numericRowEn']: numericRowEnComponent,
  [if settings.symbolicLayout == 'row' then 'symbolicRowEn']: symbolicRowEnComponent,
};

local variants = ['phone', 'pad'];

local variantOptions = {
  phone: {
    isPad: false,
    showGlobe: false,
  },
  pad: {
    isPad: true,
    showGlobe: settings.showNextKeyboardOnPad,
  },
};

// 分体 / 连体的 2x2 交叉切换：
//   简/En:      pinyin <-> alphabetic, pinyinJoined <-> alphabeticJoined
//   工具栏按钮: pinyin <-> pinyinJoined, alphabetic <-> alphabeticJoined
local typeOptions =
  if isKeytao then {
    pinyin: {
      split: true,
      languageTarget: 'alphabetic',
      toggleTarget: 'pinyinJoined',
      toggleIcon: 'rectangle',
      toggleText: '连体',
    },
    pinyinJoined: {
      split: false,
      languageTarget: 'alphabeticJoined',
      toggleTarget: 'pinyin',
      toggleIcon: 'rectangle.split.2x1',
      toggleText: '分体',
    },
    alphabetic: {
      split: true,
      languageTarget: 'pinyin',
      toggleTarget: 'alphabeticJoined',
      toggleIcon: 'rectangle',
      toggleText: '连体',
    },
    alphabeticJoined: {
      split: false,
      languageTarget: 'pinyinJoined',
      toggleTarget: 'alphabetic',
      toggleIcon: 'rectangle.split.2x1',
      toggleText: '分体',
    },
  } else {};

local fileOptions(name, variant, isPortrait) =
  local device = variantOptions[variant];
  local type = std.get(typeOptions, name, null);
  if type == null then {
    isPad: device.isPad,
    showGlobe: device.showGlobe,
  } else
    local splitPortraitEnabled = variant == 'pad' && settings.splitPadPortrait;
    local splitLandscapeEnabled = if variant == 'pad' then settings.splitPadLandscape else settings.splitPhoneLandscape;
    local splitEnabled = if isPortrait then splitPortraitEnabled else splitLandscapeEnabled;
    {
      isPad: device.isPad,
      showGlobe: device.showGlobe,
      splitPortrait: type.split && splitPortraitEnabled,
      splitLandscape: type.split && splitLandscapeEnabled,
      languageTarget: type.languageTarget,
      // 手机竖屏本身不分屏，且分屏关闭时也不显示分体/连体按钮
      toggleTarget: if splitEnabled && (!isPortrait || variant == 'pad') then type.toggleTarget else null,
      toggleIcon: type.toggleIcon,
      toggleText: type.toggleText,
    };

local getFileName(componentName, isPortrait, variant) =
  componentName + (if variant == 'pad' then 'Pad' else '') + (if isPortrait then 'Portrait' else 'Landscape');

local config = {
  fontFace: [
    { url: 'PlangothicP1-Regular.ttf' },
    { url: 'PlangothicP2-Regular.ttf' },
  ],
} + {
  [name]: {
    iPhone: {
      portrait: getFileName(name, isPortrait=true, variant='phone'),
      landscape: getFileName(name, isPortrait=false, variant='phone'),
    },
    iPad: {
      portrait: getFileName(name, isPortrait=true, variant='pad'),
      landscape: getFileName(name, isPortrait=false, variant='pad'),
      // 浮动键盘空间小，不分屏，也不加地球键 / 分体按钮，直接用手机竖屏布局
      floating: getFileName(name, isPortrait=true, variant='phone'),
    },
  } for name in std.objectFields(nameToComponent)
};

// std.toString 生成的内容紧凑，生成速度快，但不易阅读，适合发布时使用
// std.manifestYamlDoc 生成的内容格式化良好，易于阅读，但生成速度慢，也更占用内存，适合在电脑上调试时使用
// 如果想让 debug=true，需要在命令行中使用 --tla-code debug=true 参数传入
function(debug=false)
  local toString =
    if debug then
      function(x) std.manifestYamlDoc(x, indent_array_in_object=false, quote_keys=false)
    else
      function(x) std.toString(x);
{
  'config.yaml': std.manifestYamlDoc(config, indent_array_in_object=true, quote_keys=false),
}
// 键盘布局文件: light/dark × portrait/landscape × phone/pad
+ std.foldl(function(acc, x) acc + x, [
  {
    [theme + '/' + getFileName(name, isPortrait=isPortrait, variant=variant) + '.yaml']:
      toString(nameToComponent[name].new(
        isDark=(theme == 'dark'),
        isPortrait=isPortrait,
        options=fileOptions(name, variant, isPortrait),
      ))
    for name in std.objectFields(nameToComponent)
  }
  for theme in ['light', 'dark']
  for isPortrait in [true, false]
  for variant in variants
], {})
