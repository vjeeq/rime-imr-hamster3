local settings = import '../Settings.libsonnet';
local layout26 = import './Pinyin/Pinyin26.libsonnet';
local layoutKeytao = import './Pinyin/PinyinKeytao.libsonnet';

{
  new(isDark, isPortrait):
    if settings.keyboardLayout == 'keytao' then
      layoutKeytao.new(isDark, isPortrait, layoutKeytao.KeyboardType.English)
    else
      layout26.new(isDark, isPortrait, layout26.KeyboardType.English),
}
