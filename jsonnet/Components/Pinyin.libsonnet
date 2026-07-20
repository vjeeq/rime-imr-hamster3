local settings = import '../Settings.libsonnet';
local layout9  = import './Pinyin/Pinyin9.libsonnet';
local layout17 = import './Pinyin/Pinyin17.libsonnet';
local layout26 = import './Pinyin/Pinyin26.libsonnet';
local layoutSigma = import './Pinyin/PinyinSigma.libsonnet';

{
  new(isDark, isPortrait):
    if settings.keyboardLayout == '9' then
      layout9.new(isDark, isPortrait)
    else if settings.keyboardLayout == '17' then
      layout17.new(isDark, isPortrait)
    else if settings.keyboardLayout == 'sigma' then
      layoutSigma.new(isDark, isPortrait)
    else
      layout26.new(isDark, isPortrait),
}
