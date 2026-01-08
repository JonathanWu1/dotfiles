#!/bin/bash
gnome-screenshot -a -f /tmp/ocr_temp.png
tesseract /tmp/ocr_temp.png stdout 2>/dev/null | xclip -selection clipboard 
notify-send "OCR Complete" "Copied to clipboard ✅"
rm /tmp/ocr_temp.png
