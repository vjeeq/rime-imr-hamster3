local symbolicRow = import 'SymbolicRow.libsonnet';

{
  new(isDark, isPortrait, options={}):
    symbolicRow.new(isDark, isPortrait, symbolicRow.KeyboardType.English, options),
}
