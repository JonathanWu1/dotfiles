## https://help.ubuntu.com/community/OCR
# Tesseract
sudo apt install xclip
sudo apt install gnome-screenshot
sudo apt install tesseract-ocr


cp extrakt.sh ~/.local/bin/extrakt.sh
chmod +x ~/.local/bin/extrakt.sh

# Add a custom shortcut to trigger on key press
# Go to Settings -> Keyboard - Custom shortcuts
# Name: Screenshot OCR
# /home/ago/.local/bin/extrakt.sh
# Shortcut Shift + Super (windows) + T