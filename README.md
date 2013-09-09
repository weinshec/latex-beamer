latex-beamer
============

Makefile based LaTeX-Beamer template


## Description

This repository contains a basic latex beamer template developed during my diploma thesis. It uses only basic LaTeX-packages that should be included in every LaTeX distribution. A custom theme for the beamer has been included introducing two new environments, the **wideitemize** and the **colorTable**. Have a look at tex/main.tex for demonstration. For image conversion inkscape is used, but maybe replaced with a converter of your choice.

**Features:**
+ Custom beamer theme
+ 2 new environments
+ Makefile for simple compiling
+ Automatic converting .eps images to .pdf



## Installation

Just clone this repository and disconnect it from git. Run *make* to build the main.pdf

    git clone https://github.com/weinshec/latex-beamer.git
    cd latex-beamer
    rm -rf .git
    make

## Building
To build the .pdf file simply run make in the main directory.

    make

If you intend to rename the tex/main.tex file, remind to change the projects name in the Makefile as well.

Makefile:

    PROJECT   = main    # change this to the new docments name w/o .tex extension

The Makefile takes care of .eps images and uses inkscape to convert them to .pdf files. You may include images in the tex file just by typing the name w/o folder or extension

    \includegraphics[width=1.0\textwidth]{imageName}

If you have no inkscape installation ready change the line in the Makefile to the image converter of your choice.

## Cleaning
To clean the build there are two jump marks available

    make clean      # cleans the latex outputs and removes the .pdf
    make reset      # removes the converted images too

Use the latter command when you update an image that was already converted.
