#!/bin/bash

# Argument: 1- testmode 1/0
# Argument: 2- URL of captcha

cat <<- _EOF_

  ____    _    ____ _____ ____ _   _    _    
 / ___|  / \  |  _ \_   _/ ___| | | |  / \   
| |     / _ \ | |_) || || |   | |_| | / _ \  
| |___ / ___ \|  __/ | || |___|  _  |/ ___ \ 
 \____/_/   \_\_|    |_| \____|_| |_/_/   \_\
                                             
 ______   ______   _    ____ ____  
| __ ) \ / /  _ \ / \  / ___/ ___| 
|  _ \\ V /| |_) / _ \ \___ \___ \ 
| |_) || | |  __/ ___ \ ___) |__) |
|____/ |_| |_| /_/   \_\____/____/ 
                                   


_EOF_


if [ $# -lt 2 ]
  then
    echo "Usage: main.sh <testmode:0/1> <CAPTCHA_URL> <TestMode=1 counter>"
    exit
fi


if [ $1 -eq '0' ]
  then
    tmp=$RANDOM; curl --silent $2 > $tmp.png && tesseract $tmp.png -> $tmp.txt && txt=$(cat $tmp.txt) && echo $txt && rm $tmp.txt && mv $tmp.png $txt.png
else
  # To check test counter argument
  if [ -z "$3" ]
    then
      echo "Usage: main.sh <testmode:0/1> <CAPTCHA_URL> <TestMode=1 counter>"
      exit
  fi

	for i in `seq 1 $3`; do tmp=$RANDOM; curl --silent $2 > $tmp.png && tesseract $tmp.png -> $tmp.txt && txt=$(cat $tmp.txt) && echo $txt && rm $tmp.txt && mv $tmp.png $txt.png; done
fi
