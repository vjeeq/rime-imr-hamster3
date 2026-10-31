local settings = import '../Settings.libsonnet';
local symbolicRow = import './Symbolic/SymbolicRow.libsonnet';
local symbolicClassified = import './Symbolic/SymbolicClassified.libsonnet';

{
  new(isDark, isPortrait, options={}):
	if settings.symbolicLayout == 'row' then
	  symbolicRow.new(isDark, isPortrait, symbolicRow.KeyboardType.Chinese, options)
  else if settings.symbolicLayout == 'classified' then
    symbolicClassified.new(isDark, isPortrait, options)
  else
	  assert false : 'wrong symbolic layout type, settings.symbolicLayout=' + settings.symbolicLayout;
	  {}
}
