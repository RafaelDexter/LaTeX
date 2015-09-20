#!/bin/bash
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
# created     : 2015/09/20													   #
# last update : 2015/09/22													   #
# author      : Rafael Dexter <dexter.nba@gmail.com>						   #
# notes       :	378 modelos de apresentção : beamer					 		   # 
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

TEMA=$(echo 'default AnnArbor Antibes Bergen Berkeley Berlin Boadilla CambridgeUS Copenhagen
Darmstadt Dresden Frankfurt Goettingen Hannover Ilmenau JuanLesPins Luebeck Madrid
Malmoe Marburg Montpellier PaloAlto Pittsburgh Rochester Singapore Szeged Warsaw')
#
COR=$(echo 'albatross beaver beetle crane dolphin dove fly lily orchid rose
seagull seahorse whale wolverine')
#

mkdir beamer ; cd beamer
for XX in $TEMA; do
	for YY in $COR; do
		#echo "Tema = $XX 	Cor = $YY"
		cat ../MODEL.tex | sed "s/DEXTERTHEME/"$XX"/" > TEMP
		cat TEMP | sed "s/DEXTERCOLOR/"$YY"/" > $XX-$YY.tex
		pdflatex $XX-$YY.tex
		rm *.aux *.log *.nav *.out *.snm *.toc *.vrb TEMP
	done
done
rm *.tex
