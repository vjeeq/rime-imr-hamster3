local layout26 = import './Pinyin/Pinyin26.libsonnet';

{
  new(isDark, isPortrait, options={}):
    layout26.new(isDark, isPortrait, layout26.KeyboardType.English, options),
}
