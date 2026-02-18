#!/bin/bash

cd $HOME/cargonerds/cargonerds-hub/

echo -e "\e[36m[1] Authentication: \e[0m$(grep -- "Authentication .* --fixtures" ./README.md | head -n 1)"
echo -e "\e[36m[2] Hub           : \e[0m$(grep -- "Hub .* --fixtures" ./README.md | head -n 1)"
echo -e "\e[36m[3] SystemProgress: \e[0m$(grep -- "SystemProgress --migrate" ./README.md | head -n 1)"
echo -e "\e[36m[4] CalculatedData: \e[0m$(grep  -- "CalculatedData --migrate" ./README.md | head -n 1)"
echo -e "\e[36m[5] All"

read -e -p $'\e[36mSelect an option:\e[0m ' OPTION

CMD=""

if [ $OPTION -eq 1 ]; then
    CMD=$(grep -- "Authentication .* --fixtures" ./README.md)
elif [ $OPTION -eq 2 ]; then
    CMD=$(grep -- "Hub .* --fixtures" ./README.md)
elif [ $OPTION -eq 3 ]; then
    CMD=$(grep -- "SystemProgress --migrate" ./README.md)
elif [ $OPTION -eq 4 ]; then
    CMD=$(grep -- "CalculatedData --migrate" ./README.md)
else
  echo "Invalid Option"
fi

read -e -p $'\e[36mReset database?:[y/n]\e[0m ' RESET 

CMD=$(printf "%s\n" "$CMD" | head -n 1)


if [ "$RESET" != "y" ]; then
    CMD=$(printf "%s\n" "$CMD" | sed 's/ --reset//')
fi

echo ""
echo $CMD

read -e -p $'\e[36mExecute this?:[y/n]\e[0m ' EXECUTE

if [ "$EXECUTE" = "y" ]; then
    bash -c "$CMD"
fi














