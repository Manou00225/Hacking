#!/bin/bash

while true; do
    echo " ***************** FOOTPRINTING TOOLS **********************"
    echo " *                                                         *"
    echo " * 1    FOOTPRINTING WITH USING WHOIS                      *"
    echo " * 2    FOOTPRINTING WITH USING DIG                        *"
    echo " * 3    FOOTPRINTING WITH USING THE HARVESTER              *"
    echo " * 4    FOOTPRINTING WITH USING TRACE ROUTE                *"
    echo " * 5    FOOTPRINTING WITH USING HOST                       *"
    echo " * 6    FOOTPRINTING WITH USING NSLOOKUP                   *"
    echo " *                                                         *"
    echo " ***********************************************************"
    domaine=$1
    choice=$2

    echo " $1"
    echo " $2"

    dir=footprinting-$domaine
    mkdir -p $dir
    cd $dir

    if [ "$choice" = "1" ]; then
        echo " ************************ FOOTPRINTING WITH WHOIS TOOL ********* "
        whois "$domaine" > whois.txt
    elif [ "$choice" = "2" ]; then
        echo " *********************** FOOTPRINTING WITH DIG *****************"
        dig "$domaine" > dig.txt
    elif [ "$choice" = "3" ]; then
        echo " ********************* FOOTPRINTING WITH THE HARVESTER ******** "
        theHarvester -d "$domaine" -l 200 -b yahoo
    elif [ "$choice" = "4" ]; then
        echo " ******************* FOOTPRINTING WITH TRACE ROUTE *************"
        traceroute "$domaine"
    elif [ "$choice" = "5" ]; then
        echo " ***************** FOOTPRINTING WITH HOST *******************"
        host "$domaine"
    elif [ "$choice" = "6" ]; then
        echo " ***************** FOOTPRINTING WITH NSLOOKUP ****************"
        nslookup "$domaine"
    else
        echo " Choix invalide ! Veuillez sélectionner un numéro entre 1 et 6."
    fi

    echo " "
    echo " Voulez-vous faire une autre session ? (o/n) : "
    read replay
    if [ "$replay" != "o" ]; then
        echo " Merci d'avoir utilisé notre logiciel (*_*) "
        break
    fi
done

exit



