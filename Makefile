# _____________________________________________________________________________
#                                                              PROJECT SETTINGS
PROJECT = main

PWD        = ${shell pwd}
EXTRA      = ${PWD}/extra
IMG        = ${PWD}/img
BUILD      = ${PWD}/build

TEX_FILES   = ${PWD}/${PROJECT}.tex
EXTRA_FILES = $(shell find ${EXTRA} -type f -name '*')
IMG_FILES   = $(shell find ${IMG} -type f -name '*')

LATEX_CMD   = xelatex
LATEX_FLAGS = -shell-escape -halt-on-error -file-line-error -output-directory ${BUILD}
PDF_VIEWER  = zathura

export TEXINPUTS   := ${EXTRA}:${TEXINPUTS}


# _____________________________________________________________________________
#                                                            BUILD INSTRUCTIONS
all: ${PROJECT}.pdf

${PROJECT}.pdf: ${BUILD}/${PROJECT}.pdf
	cp $< $@

${BUILD}/${PROJECT}.pdf: ${BUILD}/${PROJECT}.aux
	$(LATEX_CMD) ${LATEX_FLAGS} ${PROJECT}

${BUILD}/${PROJECT}.aux: ${TEX_FILES} ${EXTRA_FILES} ${IMG_FILES} | ${BUILD}
	$(LATEX_CMD) ${LATEX_FLAGS} ${PROJECT}

${BUILD}:
	mkdir -p ${BUILD}

view: ${PROJECT}.pdf
	($(PDF_VIEWER) ${PROJECT}.pdf &)

clean:
	rm -rf ${BUILD}
	if [ -f ${PROJECT}.pdf ] ; then rm ${PROJECT}.pdf ; fi;
