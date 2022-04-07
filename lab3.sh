#!/bin/bash

WYBOR=0
KATALOG="$HOME"
VAR_UZYTKOWNIK=""
VAR_MAX=""
VAR_TIME=""

while [[ $WYBOR != 8 ]]; do
    menu1="1.Nazwa pliku: $NAZWA"
    menu2="2.Katalog: $KATALOG" 
    menu3="3.Maksymalny rozmiar: $MAX"
    menu4="4.Uzytkownik: $USER"
    menu5="5.Utworzone w ciagu (Twoj wybor) dni: $TIME"
    menu6="6.Zawartosc: $ZAWARTOSC"
    menu7="7. Szukaj"
    menu8="8. Koniec"
    MENU=("$menu1" "$menu2" "$menu3" "$menu4" "$menu5" "$menu6" "$menu7" "$menu8")
    WYBOR=$(zenity --list --column=MENU "${MENU[@]}" --height 800 --width 1200)

    case $WYBOR in 
        $menu1)NAZWA=$(zenity --entry --title "Find" --text "Podaj nazwę pliku:") 
            VAR_NAZWA="-name $NAZWA"
			if [ -z $NAZWA ]; then
				VAR_NAZWA=""
			fi
			;;

        $menu2)KATALOG=$(zenity --entry --title "Find" --text "Podaj nazwe katalogu:")
            ;;

        $menu3)MAX=$(zenity --entry --title "Find" --text "Podaj maksymalny rozmiar pliku:")
            if [ $MAX ] ; then
	            VAR_MAX="-size -$MAX"
            else
	            VAR_MAX=""
            fi
            ;;

      
        $menu4)USER=$(zenity --entry --title "Find" --text "Podaj nazwe uzytkownika:") 
            VAR_UZYTKOWNIK="-user $USER"
            ;;

        $menu5)TIME=$(zenity --entry --title "Find" --text "Podaj ile dni minęło od utworzenia:")
            VAR_TIME="-ctime -$TIME"
            if [ -z $TIME ]; then
                VAR_TIME=""
            fi    
            ;;
        
        $menu6)ZAWARTOSC=$(zenity --entry --title "Find" --text "Podaj zawartosc:")
           VAR_ZAWARTOSC="-exec grep -l \"$ZAWARTOSC\" {} \;"
			if [ -z "$ZAWARTOSC" ]; then
				VAR_ZAWARTOSC=""
			fi
			;;

        $menu7)FOUND="find $KATALOG -type f $VAR_NAZWA $VAR_TIME $VAR_UZYTKOWNIK $VAR_MAX $VAR_ZAWARTOSC | \zenity --text-info --title \"Found\" --width 2000"
            eval $FOUND
            ;;

        $menu8)WYBOR=8
            ;;
    esac 
done