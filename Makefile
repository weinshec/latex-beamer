##################################################
##                           general path settings
##################################################

NAME      = main

PWD       = ${shell pwd}
IMG       = ${PWD}/img
THEME     = ${PWD}/theme

TEMP      = ${PWD}/temp

export TEXINPUTS := ${TEXINPUTS}:${THEME}:${TEMP}:${IMG}



##################################################
##                                     image rules
##################################################

EPS := $(wildcard ${IMG}/*.eps)
EPS2PDF := $(patsubst ${IMG}/%.eps,${TEMP}/%.pdf,$(EPS))

${TEMP}/%.pdf: ${IMG}/%.eps
	inkscape --without-gui --file=$< --export-pdf=${TEMP}/$*.pdf 



##################################################
##                              build instructions
##################################################

all: ${NAME}.pdf

view: ${NAME}.pdf
	zathura ${NAME}.pdf &

${NAME}.pdf: ${NAME}.tex ${EPS2PDF}
	pdflatex -file-line-error -output-directory ${TEMP} $<
	pdflatex -file-line-error -output-directory ${TEMP} $<
	cp ${TEMP}/${NAME}.pdf ${PWD}

clean:
	rm -rf ${TEMP}/*
	if [ -a ${NAME}.pdf ] ; then rm ${NAME}.pdf ; fi;

