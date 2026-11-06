local settings = import '../Settings.libsonnet';
local layout9 = import './Pinyin/Pinyin9.libsonnet';
local layout26 = import './Pinyin/Pinyin26.libsonnet';

{
  new(isDark, isPortrait, options={}):
    if settings.keyboardLayout == '9' then
      layout9.new(isDark, isPortrait, options)
    else
      layout26.new(isDark, isPortrait, options=options),
}
