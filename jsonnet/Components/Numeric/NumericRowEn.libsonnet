local numericRow = import 'NumericRow.libsonnet';

{
  new(isDark, isPortrait, options={}):
    numericRow.new(isDark, isPortrait, numericRow.KeyboardType.English, options),
}
