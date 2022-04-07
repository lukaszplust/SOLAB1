#!/bin/bash

WYBOR=0
KATALOG="$HOME"
VAR_UZYTKOWNIK=""
VAR_MAX=""
VAR_ZAWARTOSC=""
VAR_TIME=""

while  [ $WYBOR -ne 8 ];do
echo "
1.Nazwa pliku: $NAZWA
2.Katalog: $KATALOG 
3.Maksymalny rozmiar: $MAX
4.Uzytkownik: $USER
5.Utworzone w ciagu (Twoj wybor) dni: $TIME
6.Zawartosc: $ZAWARTOSC
7. Szukaj
8. Koniec"
echo -e -n "Wybierz numer opcji, ktora chcesz zeby sie wykonala: " 
read WYBOR


case $WYBOR in 


1*) 
echo -n "Podaj nazwę pliku: "
read NAZWA
;;

2*)
echo -n "Podaj sciezke katalogu do pliku: "
read KATALOG
;;

3*)
echo -n "Podaj maksymalny rozmiar w formacie xk/xM/xG (x - liczba_wpisywana, k = KB, M = MB, G = GB)"
read MAX
if [ $MAX ] ; then
	VAR_MAX="-size -$MAX"
else
	VAR_MAX=""
fi
;;

4*) 
echo -n "Podaj nazwe uzytkownika: "
read USER
VAR_UZYTKOWNIK="-user $USER"
;;

5*)
echo -n "Podaj ile dni minęło od utworzenia: "
read TIME
VAR_TIME="-ctime -$TIME"
;;

6*)
echo -n "Podaj zawartosc: "
read ZAWARTOSC
if [ $ZAWARTOSC ]; then
        VAR_ZAWARTOSC="-exec grep -l -i $ZAWARTOSC {} +"
else
        VAR_ZAWARTOSC=""
fi                
;;

7*)
echo "Lista plików: "
echo 
find $KATALOG -type f -iname "*$NAZWA*" $VAR_UZYTKOWNIK $VAR_MAX $VAR_ZAWARTOSC $VAR_TIME 
echo 
;;

8*)
echo "Narazie bylo fajnie";;
esac 
done