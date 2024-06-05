#!/bin/bash

EISVOGEL="~/.pandoc/templates/eisvogel.latex"
PDF="/Applications/Adobe Acrobat DC/Adobe Acrobat.app/Contents/MacOS/AdobeAcrobat"

# Eisvogel: https://github.com/enhuiz/eisvogel
# Pandoc2: https://www.pandoc.org/
# Credits: https://github.com/noraj/OSCP-Exam-Report-Template-Markdown/blob/master/src/OSCP-exam-report-template_whoisflynn_v3.2.md
#
if [ "$#" -ne 2 ]; then
	echo "usage: $0 <input.md> <output.pdf>"
	exit
fi

pandoc $1 -o $2 \
--from markdown+yaml_metadata_block+raw_html \
--template $EISVOGEL \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=chapter \
--highlight-style tango

if [ $? -eq 0 ]
then
	nohup "$PDF" $2 &
fi
