local settings = import '../../Settings.libsonnet';
local symbolicRow = import 'SymbolicRow.libsonnet';
local symbolicClassified = import 'SymbolicClassified.libsonnet';

{
  new(isDark, isPortrait):
    if settings.symbolicLayout == 'classified' then
      symbolicClassified.new(isDark, isPortrait)
    else
      symbolicRow.new(isDark, isPortrait)
}
