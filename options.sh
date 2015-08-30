#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
export DIALOG='
<window title="configure TTQS" image-name="TTQS_48.png">
  <vbox>
    <hbox>
      <pixmap>
        <input file>TTQS_48.png</input>
      </pixmap>
      <text>
        <label>"Thomas Text-quiz system"</label>
      </text>
    </hbox>
    <text>
      <label>"     terminal emulator to use     "</label>
    </text>
    <entry>
      <variable>TERM</variable>
      <input file>TERM.CONFIG.TXT</input>
    </entry>
    <hbox>
      <button ok></button>
      <button cancel></button>
    </hbox>
  </vbox>
</window>'
I=$IFS; IFS=""
for STATEMENTS in  $(gtkdialog --program DIALOG); do
  eval $STATEMENTS
done
IFS=$I

if [ "$EXIT" = "OK" ]; then
  echo "$TERM" > TERM.CONFIG.TXT
else
  echo ""
fi