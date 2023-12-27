#!/usr/bin/awk -f

# Returns a utf-8 string corresponding to the given codepoint.
function chr(codepoint) {
  if (codepoint<128) return sprintf("%c", codepoint)
  else if (codepoint>=128 && codepoint<2048) return sprintf("%c%c", int(codepoint/64)+192, (codepoint%64)+128)
  else if (codepoint>=2048 && codepoint<65536) return sprintf("%c%c%c", int(codepoint/4096)+224, int((codepoint%4096)/64)+128, (codepoint%64)+128)
  else if (codepoint>=65536 && codepoint<2097152) return sprintf("%c%c%c%c", int(codepoint/262144)+240, int(codepoint/4096)+128, int((codepoint%4096)/64)+128, (codepoint%64)+128)
  else return "�"
}

# Returns an integer for corresponding hexadecimal number
function hex(literal) {
  return ("0x" literal)+0
}

BEGIN { FS = ";" }

$2~/^[A-Z][A-Z -]*$/ && $2!~/^TAG |LANGUAGE TAG|CANCEL TAG/ {
  print chr(hex($1)) "|" $2
}
