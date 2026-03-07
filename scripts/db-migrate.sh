#!/bin/bash

cd $HOME/cargonerds/cargonerds-hub/

if ip -br addr | grep -q tun; then
    echo "Vpn is active. turn off the vpn before mirgrating the db"
    exit 0;
fi



AuthBaseCmd=$(grep -- "Authentication .* --fixtures" ./README.md | sed 's/--reset .*//')
HubBaseCmd=$(grep -- "Hub .* --fixtures" ./README.md | sed 's/--reset .*//')
CalcDataBaseCmd=$(grep -- "CalculatedData --migrate" ./README.md | head -n 1 | sed 's/--migrate.*//')
SystemProgressBaseCmd=$(grep -- "SystemProgress --migrate" ./README.md | head -n 1 | sed 's/--migrate.*//')

AuthFixtures=$(grep -- "Authentication .* --fixtures" ./README.md |  sed 's/.* --migrate//')
HubFixtures=$(grep -- "Hub .* --fixtures" ./README.md |  sed 's/.* --migrate//')
CalcDataFixtures=$(grep -- "CalculatedData .* --fixtures" ./README.md |  sed 's/.* --migrate//')
SystemProgressFixtures=$(grep -- "SystemProgress .* --fixtures" ./README.md |  sed 's/.* --migrate//')

echo -e "\e[36m[1] Authentication: \e[0m$(grep -- "Authentication .* --fixtures" ./README.md | head -n 1)"
echo -e "\e[36m[2] Hub           : \e[0m$(grep -- "Hub .* --fixtures" ./README.md | head -n 1)"
echo -e "\e[36m[3] SystemProgress: \e[0m$(grep -- "SystemProgress --migrate" ./README.md | head -n 1)"
echo -e "\e[36m[4] CalculatedData: \e[0m$(grep  -- "CalculatedData --migrate" ./README.md | head -n 1)"
echo -e "\e[36m[5] All"


read -e -p $'\e[36mSelect an option:\e[0m ' OPTION

CMD=""
FIXTURE=""

if [ $OPTION -eq 1 ]; then
    CMD=$(echo "$AuthBaseCmd")
    FIXTURE=$(echo "$AuthFixtures")
elif [ $OPTION -eq 2 ]; then
    CMD=$(echo "$HubBaseCmd")
    FIXTURE=$(echo "$HubFixtures")
elif [ $OPTION -eq 3 ]; then
    CMD=$(echo "$SystemProgressBaseCmd")
    FIXTURE=$(echo "$CalcDataFixtures")
elif [ $OPTION -eq 4 ]; then
    CMD=$(echo "$CalcDataBaseCmd")
    FIXTURE=$(echo "$SystemProgressFixtures")
else 
    echo "Invalid Option"
fi

CMD=$(printf "$CMD --migrate")

if [ $OPTION -eq 1 ] || [ $OPTION -eq 2 ]; then
    read -e -p $'\e[36mReset database?:[y/n]\e[0m ' RESET
    if [ "$RESET" == 'y' ]; then
        CMD=$(printf "$CMD --reset")
    fi

    read -e -p $'\e[36mApply Fixtures?:[y/n]\e[0m ' FIXTURES
    if [ "$FIXTURES" == "y" ]; then
        CMD=$(printf "$CMD $FIXTURE")
    fi
fi

echo $CMD

read -e -p $'\e[36mExecute this?:[y/n]\e[0m ' EXECUTE

if [ "$EXECUTE" = "y" ]; then
    bash -c "$CMD"
fi
