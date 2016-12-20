#!/bin/bash

ISHERE="FALSE"
DIRN="fichiers_a_analyser"
DIRP=fichiers_a_analyser/

echo "                                                             "
echo "     ____________     ______     ______     ____________     "
echo "     ||||||||||||      ||||||   ||||||      ||||||||||||     "
echo "          ||            |||||| ||||||            ||          "
echo "          ||             |||||||||||             ||          "
echo "          ||              |||||||||              ||          "
echo "          ||             |||||||||||             ||          "
echo "          ||            |||||| ||||||            ||          "
echo "          ||           ||||||   ||||||           ||          "
echo "                                                             "
echo "                                                             "
echo "                  ANALYZER            3000                   "
echo "                                                             "
echo "                                                             "
echo "                                                             "

for file in $(ls | sort)
do
    if [ $file = $DIRN ]
    then
        echo "Dossier present : $file"
        echo
        ISHERE="TRUE"
    fi
done

if [ $ISHERE = "FALSE" ]
then
    echo "Creation du dossier $DIRN"
    echo "Pour analyser un fichier, veuillez le placer dans ce dossier"
    echo
    mkdir $DIRN
fi

echo "Bonjour $LOGNAME, comment voulez vous proceder ?"
echo "Entrez T pour entrer directement le texte ou F pour lancer le"
echo "programme sur un fichier .txt, puis appuyez sur ENTER"

read CMD

while [ $CMD != "T" ] && [ $CMD != "F" ]
do
    echo
    echo "Entree incorecte, veuillez reessayer:"
    read CMD
done

if [ $CMD = "F" ]
then
    echo
    echo "Ensemble des fichiers disponibles :"
    for file in $(ls $DIRP | sort)
    do
        echo $file
    done
    echo
    echo "Entrez le nom du fichier:"
    echo "(Vous pourrez parcourir le resultat avec les fleches haut"
    echo "et bas, et quitter en appuyant sur 'q')"
    read FILE
    cat $DIRP$FILE | tr " " "\n" | sort | uniq -c | sort -nr | less
else
    echo
    echo "Entrez le texte a etudier:"
    echo "(Vous pourrez parcourir le resultat avec les fleches haut"
    echo "net bas, et quitter en appuyant sur 'q')"
    read TXT
    echo $TXT | tr " " "\n" | sort | uniq -c | sort -nr | less
fi

echo
echo "Analyse terminee, fin du programme."
