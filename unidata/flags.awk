#!/usr/bin/awk

function chr(codepoint) {
  if (codepoint<128) return sprintf("%c", codepoint)
  else if (codepoint>=128 && codepoint<2048) return sprintf("%c%c", int(codepoint/64)+192, (codepoint%64)+128)
  else if (codepoint>=2048 && codepoint<65536) return sprintf("%c%c%c", int(codepoint/4096)+224, int((codepoint%4096)/64)+128, (codepoint%64)+128)
  else if (codepoint>=65536 && codepoint<2097152) return sprintf("%c%c%c%c", int(codepoint/262144)+240, int(codepoint/4096)+128, int((codepoint%4096)/64)+128, (codepoint%64)+128)
  else return "�"
}

BEGIN {
  FS = ","

  split("ABCDEFGHIJKLMNOPQRSTUVWXYZ", alphabet, "");
  for (i=1; i<=26; i++) regionalindicators[alphabet[i]] = chr(127461 + i) # 127462 is U+1F1E6 is regional indicator A
}

function flag(iso) {
  out = ""
  split(iso, code, "");
  for (i=1; i<=length(code); i++) out = out regionalindicators[code[i]]
  return out
}

NR>1 {
  if ($1~/"/) {
    iso = $3
  } else {
    iso = $2
  }
  country = $1
  sub(/\([^()]*\)/, "", country)
  sub(/ $/, "", country)
  sub(/  /, "", country)
  sub(/'/, "", country)
  sub(/Å/, "A", country)
  sub(/ç/, "c", country)
  sub(/é/, "e", country)
  sub(/"/, "", country)
  if (iso=="VG") {
    country = "british " country
  } else if (iso=="VI") {
    country = "us " country
  } else if (iso=="LA") {
    country = "laos"
  } else {}
  print flag(iso) "|" toupper(country), "FLAG"
}
