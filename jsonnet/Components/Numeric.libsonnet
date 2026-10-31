local settings = import '../Settings.libsonnet';
local numeric9 = import './Numeric/Numeric9.libsonnet';
local numericRow = import './Numeric/NumericRow.libsonnet';
local numericHex = import './Numeric/NumericHex.libsonnet';

{
  new(isDark, isPortrait, options={}):
    if settings.numericLayout == 'row' then
      numericRow.new(isDark, isPortrait, numericRow.KeyboardType.Chinese, options)
    else if settings.numericLayout == 'hex' then
      numericHex.new(isDark, isPortrait, options)
    else
      numeric9.new(isDark, isPortrait, options)
}
