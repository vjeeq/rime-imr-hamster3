local buttons = import '../../Buttons/LayoutKeytao.libsonnet';
local commonButtons = import '../../Buttons/CommonKeytao.libsonnet';
local toolbarParams = import '../../Buttons/Toolbar.libsonnet';
local settings = import '../../Settings.libsonnet';
local colors = import '../../Constants/Colors.libsonnet';
local basicStyle = import '../../Styles/BasicStyle.libsonnet';
local preedit = import '../Preedit.libsonnet';
local toolbar = import '../Toolbar.libsonnet';
local utils = import '../../Utils/Utils.libsonnet';

local portraitNormalButtonSize = {
  size: { width: '112.5/1125' },
};

// 枚举键盘类型
local KeyboardType = {
  Chinese: 0,
  English: 1,
  Temp26Key: 2,
};

local getSwitchButton(keyboardType) =
  if keyboardType == KeyboardType.English then
    commonButtons.pinyinButton
  else if keyboardType == KeyboardType.Temp26Key then
    commonButtons.goBackButton
  else
    commonButtons.alphabeticButton;

local isSplitLayout(isPortrait, options) =
  if isPortrait then
    std.get(options, 'splitPortrait', false)
  else
    std.get(options, 'splitLandscape', false);

local keyboardLayout(keyboardType) = {
  keyboardLayout: [
    {
      HStack: {
        subviews: [
          { Cell: buttons.qButton.name },
          { Cell: buttons.wButton.name },
          { Cell: buttons.eButton.name },
          { Cell: buttons.rButton.name },
          { Cell: buttons.tButton.name },
          { Cell: buttons.yButton.name },
          { Cell: buttons.uButton.name },
          { Cell: buttons.iButton.name },
          { Cell: buttons.oButton.name },
          { Cell: buttons.pButton.name },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          { Cell: buttons.aButton.name },
          { Cell: buttons.sButton.name },
          { Cell: buttons.dButton.name },
          { Cell: buttons.fButton.name },
          { Cell: buttons.gButton.name },
          { Cell: buttons.hButton.name },
          { Cell: buttons.jButton.name },
          { Cell: buttons.kButton.name },
          { Cell: buttons.lButton.name },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          { Cell: commonButtons.shiftButton.name },
          { Cell: buttons.zButton.name },
          { Cell: buttons.xButton.name },
          { Cell: buttons.cButton.name },
          { Cell: buttons.vButton.name },
          { Cell: buttons.bButton.name },
          { Cell: buttons.nButton.name },
          { Cell: buttons.mButton.name },
          { Cell: commonButtons.backspaceButton.name },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          { Cell: getSwitchButton(keyboardType).name },
          { Cell: commonButtons.commaButton.name },
          { Cell: commonButtons.spaceButton.name },
          { Cell: commonButtons.semicolonButton.name },
          { Cell: commonButtons.enterButton.name },
        ],
      },
    },
  ],
};

// 分屏布局：左右半边按比例，中间空隙自动占掉剩余宽度
local newSplitHalfStyles(halfPercent) = {
  splitHalfLeft: { size: { width: { percentage: halfPercent } } },
  splitHalfRight: { size: { width: { percentage: halfPercent } } },
};

// 空位：占一格，但背景几乎透明，点了也没有动作
local newSplitSpacerStyle(isDark) = {
  splitSpacer: {
    size: { width: '1/6' },
    backgroundStyle: 'splitSpacerBackground',
    action: 'none',
  },
  splitSpacerBackground: utils.newGeometryStyle({
    normalColor: '#00000001',
    highlightColor: '#00000001',
    cornerRadius: 8.5,
  }, isDark),
};

local splitCells(names) = [{ Cell: name } for name in names];

// 左右各 6 列，重叠 T/Y、G/H、V/B：中间交界处两手都能按
local splitLeftRows(keyboardType) = [
  {
    HStack: {
      subviews: splitCells([
        buttons.qButton.name, buttons.wButton.name, buttons.eButton.name,
        buttons.rButton.name, buttons.tButton.name, buttons.yButton.name,
      ]),
    },
  },
  {
    HStack: {
      subviews: splitCells([
        buttons.aButton.name, buttons.sButton.name, buttons.dButton.name,
        buttons.fButton.name, buttons.gButton.name, buttons.hButton.name,
      ]),
    },
  },
  {
    HStack: {
      subviews: splitCells([
        commonButtons.shiftButton.name,
        buttons.zButton.name, buttons.xButton.name, buttons.cButton.name,
        buttons.vButton.name, buttons.bButton.name,
      ]),
    },
  },
  {
    HStack: {
      subviews: splitCells([
        getSwitchButton(keyboardType).name,
        commonButtons.commaButton.name,
        commonButtons.spaceButton.name,
      ]),
    },
  },
];

local splitRightRows(keyboardType) = [
  {
    HStack: {
      subviews: splitCells([
        buttons.tButton.name, buttons.yButton.name, buttons.uButton.name,
        buttons.iButton.name, buttons.oButton.name, buttons.pButton.name,
      ]),
    },
  },
  {
    HStack: {
      subviews: splitCells([
        buttons.gButton.name, buttons.hButton.name, buttons.jButton.name,
        buttons.kButton.name, buttons.lButton.name,
        // 物理键盘这里还有 ; 键，本皮肤把它放在底部，所以留空
        'splitSpacer',
      ]),
    },
  },
  {
    HStack: {
      subviews: splitCells([
        buttons.vButton.name, buttons.bButton.name, buttons.nButton.name,
        buttons.mButton.name, commonButtons.backspaceButton.name,
      ]),
    },
  },
  {
    HStack: {
      subviews: splitCells([
        commonButtons.spaceRightButton.name,
        commonButtons.semicolonButton.name,
        commonButtons.enterButton.name,
      ]),
    },
  },
];

local keyboardLayoutSplit(keyboardType) = {
  keyboardLayout: [
    { VStack: { style: 'splitHalfLeft', subviews: splitLeftRows(keyboardType) } },
    { VStack: {} },
    { VStack: { style: 'splitHalfRight', subviews: splitRightRows(keyboardType) } },
  ],
};

local getAlphabeticButtonSize(name) =
  local extra = {
    [buttons.aButton.name]: {
      size:
        { width: '168.75/1125' },
      bounds:
        { width: '112.5/168.75', alignment: 'right' },
    },
    [buttons.lButton.name]: {
      size:
        { width: '168.75/1125' },
      bounds:
        { width: '112.5/168.75', alignment: 'left' },
    },
  };
  (
  if std.objectHas(extra, name) then
    extra[name]
  else
    portraitNormalButtonSize
  );

// 分屏时所有字母统一 1/6 半边宽（分母 6 = 半边宽度）
local getSplitAlphabeticButtonSize(name) =
  { size: { width: '1/6' } };

local newKeyLayout(isDark=false, isPortrait=true, keyboardType=KeyboardType.Chinese, options={}) =
  local isAlphabetic = keyboardType == KeyboardType.English;
  local isSplit = isSplitLayout(isPortrait, options);
  {
    keyboardHeight: if isPortrait then commonButtons.keyboardHeight.portrait else commonButtons.keyboardHeight.landscape,
    keyboardStyle: utils.newBackgroundStyle(style=basicStyle.keyboardBackgroundStyleName),
  }
  + (if isSplit then keyboardLayoutSplit(keyboardType) else keyboardLayout(keyboardType))

  // letter Buttons
  + std.foldl(function(acc, button)
      acc +
      basicStyle.newAlphabeticButton(
        button.name,
        isDark,
        (if isSplit then getSplitAlphabeticButtonSize(button.name) else getAlphabeticButtonSize(button.name)) +
        utils.processButtonParams(isAlphabetic, button.params) + basicStyle.hintStyleSize + basicStyle.textCenterWhenShowSwipeText +
        (
          if keyboardType != KeyboardType.English && settings.uppercaseForChinese then
            basicStyle.newAlphabeticButtonUppercaseForegroundStyle(isDark, button.params) + basicStyle.getKeyboardActionText(button.params.uppercased)
          else {}
        )),
      buttons.letterButtons,
      {})

  // Third Row
  + basicStyle.newSystemButton(
    commonButtons.shiftButton.name,
    isDark,
    (
      if isSplit then
      {
        size: { width: '1/6' },
      }
      else if settings.keyboardLayout=='26b' then portraitNormalButtonSize else
      {
        size:
          { width: '168.75/1125' },
      }
    )
    + utils.processButtonParams(isAlphabetic, commonButtons.shiftButton.params)
  )

  + basicStyle.newSystemButton(
    commonButtons.backspaceButton.name,
    isDark,
    (
      if isSplit then
      {
        // 退格占 2 格，正好填满右半第三行
        size: { width: '2/6' },
      }
      else if settings.keyboardLayout=='26b' then
      {
        size: { width: '225/1125' },
      }
      else
      {
        size:
          { width: '168.75/1125' },
      }
    )
    + utils.processButtonParams(isAlphabetic, commonButtons.backspaceButton.params),
  )

  // Fourth Row
  + basicStyle.newAlphabeticButton(
    commonButtons.commaButton.name,
    isDark,
    { size: { width: if isSplit then '1/6' else '130/1125' } } + utils.processButtonParams(isAlphabetic, commonButtons.commaButton.params) + basicStyle.hintStyleSize,
    swipeTextFollowSetting=false,
  )
  + basicStyle.newAlphabeticButton(
    commonButtons.spaceButton.name,
    isDark,
    basicStyle.newSpaceButtonForegroundStyle(
      utils.processButtonParams(isAlphabetic, commonButtons.spaceButton.params),
      if keyboardType == KeyboardType.English then
        'English'
      else if keyboardType == KeyboardType.Temp26Key then
        '临时中文'
      else
        '$rimeSchemaName',
      isDark
    )
    + (if isSplit then { size: { width: '3.5/6' } } else {}),
    needHint=false,
  )
  + (if isSplit then
    basicStyle.newAlphabeticButton(
      commonButtons.spaceRightButton.name,
      isDark,
      { size: { width: '3/6' } }
      + utils.processButtonParams(isAlphabetic, commonButtons.spaceRightButton.params),
      needHint=false,
    )
  else {})
  + basicStyle.newAlphabeticButton(
    commonButtons.semicolonButton.name,
    isDark,
    { size: { width: if isSplit then '1/6' else '168.75/1125' } } + utils.processButtonParams(isAlphabetic, commonButtons.semicolonButton.params) + basicStyle.hintStyleSize,
    swipeTextFollowSetting=false,
  )
  + local switchButton = getSwitchButton(keyboardType);
    local switchParams =
      local target = std.get(options, 'languageTarget', null);
      if target == null then
        switchButton.params
      else
        // 保持当前分体/连体模式，只替换中英切换目标
        utils.replaceKeyboardTypeRecursive(
          switchButton.params,
          if keyboardType == KeyboardType.English then 'pinyin' else 'alphabetic',
          target
        );
    basicStyle.newSystemButton(
    switchButton.name,
    isDark,
    {
      size: { width: if isSplit then '1.5/6' else '168.75/1125' },
    }
    + utils.processButtonParams(isAlphabetic, switchParams)
  )
  + basicStyle.newColorButton(
    commonButtons.enterButton.name,
    isDark,
    {
      size: { width: if isSplit then '2/6' else '250/1125' },
    } + utils.processButtonParams(isAlphabetic, commonButtons.enterButton.params)
  )
;

{
  // 枚举键盘类型
  KeyboardType:: KeyboardType,

  new(isDark, isPortrait, keyboardType=KeyboardType.Chinese, options={}):
	local insets = if isPortrait then commonButtons.backgroundInsets.portrait else commonButtons.backgroundInsets.landscape;

    local extraParams = {
      insets: insets,
    };
    local isSplit = isSplitLayout(isPortrait, options);
    local isPad = std.get(options, 'isPad', false);
    local gapPercent =
      if isPortrait then
        (if isPad then settings.splitGapPercent.padPortrait else settings.splitGapPercent.phonePortrait)
      else
        (if isPad then settings.splitGapPercent.padLandscape else settings.splitGapPercent.phoneLandscape);
    local halfPercent = (1 - gapPercent) / 2;

    preedit.new(isDark)
    + toolbar.new(
        isDark,
        isPortrait,
        if keyboardType == KeyboardType.Chinese then 'pinyin' else 'alphabetic',
        showGlobe=std.get(options, 'showGlobe', false),
        toggleTarget=std.get(options, 'toggleTarget', null),
        toggleIcon=std.get(options, 'toggleIcon', 'rectangle.split.2x1'),
        toggleText=std.get(options, 'toggleText', '分体')
      )
    + (if isSplit then newSplitHalfStyles(halfPercent) + newSplitSpacerStyle(isDark) else {})
    + basicStyle.newKeyboardBackgroundStyle(isDark)
    + basicStyle.newAlphabeticButtonBackgroundStyle(isDark, extraParams)
    + basicStyle.newSystemButtonBackgroundStyle(isDark, extraParams)
    + basicStyle.newColorButtonBackgroundStyle(isDark, extraParams)
    + basicStyle.newAlphabeticHintBackgroundStyle(isDark, { cornerRadius: 10 })
    + basicStyle.newLongPressSymbolsBackgroundStyle(isDark, extraParams)
    + basicStyle.newLongPressSymbolsSelectedBackgroundStyle(isDark, extraParams)
    + basicStyle.newButtonAnimation()
    + {
        keytaoSoftBackgroundStyle: utils.newGeometryStyle({
          insets: insets,
          normalColor: { light: '#D4F4CA', dark: '#33612B' },
          highlightColor: { light: '#BDEAB3', dark: '#407737' },
          cornerRadius: 8.5,
        }, isDark),
      }
    + {
        alphabeticButtonSimplifiedStyle: utils.newTextStyle({
          text: '简/En',
          fontSize: 14,
          normalColor: colors.systemButtonForegroundColor,
          highlightColor: colors.systemButtonHighlightedForegroundColor,
        }, isDark),
        alphabeticButtonTraditionalStyle: utils.newTextStyle({
          text: '繁/En',
          fontSize: 14,
          normalColor: colors.systemButtonForegroundColor,
          highlightColor: colors.systemButtonHighlightedForegroundColor,
        }, isDark),
        pinyinButtonSimplifiedStyle: utils.newTextStyle({
          text: 'En/简',
          fontSize: 14,
          normalColor: colors.systemButtonForegroundColor,
          highlightColor: colors.systemButtonHighlightedForegroundColor,
        }, isDark),
        pinyinButtonTraditionalStyle: utils.newTextStyle({
          text: 'En/繁',
          fontSize: 14,
          normalColor: colors.systemButtonForegroundColor,
          highlightColor: colors.systemButtonHighlightedForegroundColor,
        }, isDark),
        alphabeticButtonTraditionalNotification: {
          notificationType: 'rime',
          rimeNotificationType: 'optionChanged',
          rimeOptionName: 'traditionalization',
          rimeOptionValue: true,
          backgroundStyle: 'systemButtonBackgroundStyle',
          foregroundStyle: 'alphabeticButtonTraditionalStyle',
        },
        pinyinButtonTraditionalNotification: {
          notificationType: 'rime',
          rimeNotificationType: 'optionChanged',
          rimeOptionName: 'traditionalization',
          rimeOptionValue: true,
          backgroundStyle: 'systemButtonBackgroundStyle',
          foregroundStyle: 'pinyinButtonTraditionalStyle',
        },
      }
    + newKeyLayout(isDark, isPortrait, keyboardType, options)
    + {
        // preedit 通知会整体替换前景样式，这里让它也按繁简状态选择，避免输入中显示回「简/En」
        alphabeticButtonPreeditChangedNotification+: {
          foregroundStyle: [
            { conditionKey: 'rime$traditionalization', conditionValue: false, styleName: 'alphabeticButtonSimplifiedStyle' },
            { conditionKey: 'rime$traditionalization', conditionValue: true, styleName: 'alphabeticButtonTraditionalStyle' },
          ],
        },
        pinyinButtonPreeditChangedNotification+: {
          foregroundStyle: [
            { conditionKey: 'rime$traditionalization', conditionValue: false, styleName: 'pinyinButtonSimplifiedStyle' },
            { conditionKey: 'rime$traditionalization', conditionValue: true, styleName: 'pinyinButtonTraditionalStyle' },
          ],
        },
      }
    // Notifications
    + basicStyle.rimeSchemaChangedNotification
    + { keyboardHeight: utils.keyboardHeightFor(settings, isPad, isPortrait) }
}
