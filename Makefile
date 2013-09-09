##################################################
##                           general path settings
##################################################

PROJECT   = main

PWD       = ${shell pwd}
INPUT     = ${PWD}/tex
IMG       = ${PWD}/plots
THEME     = ${PWD}/theme

TEMP      = ${PWD}/temp
OUT       = ${TEMP}/out
CONVIMG   = ${TEMP}/img

export TEXINPUTS := ${TEXINPUTS}:${INPUT}:${THEME}:${CONVIMG}



##################################################
##                                     image rules
##################################################

EPS := $(wildcard ${IMG}/*.eps)
EPS2PDF := $(patsubst ${IMG}/%.eps,${CONVIMG}/%.pdf,$(EPS))

${CONVIMG}/%.pdf: ${IMG}/%.eps
	inkscape --without-gui --file=$< --export-pdf=${CONVIMG}/$*.pdf 



##################################################
##                              build instructions
##################################################

all: ${INPUT}/${PROJECT}.tex ${EPS2PDF}
	pdflatex -output-directory ${OUT} $<
	pdflatex -output-directory ${OUT} $<
	cp ${OUT}/${PROJECT}.pdf ${PWD}

clean:
	rm -rf ${OUT}/*
	if [ -a ${PROJECT}.pdf ] ; then rm ${PROJECT}.pdf ; fi;

reset: clean
	rm -rf ${CONVIMG}/*
