latex-beamer
============

Makefile based LaTeX-Beamer template


## Description

This repository contains my latex beamer template developed during my PhD
thesis. The theme heavily uses tikz and is based on
https://github.com/FuzzyWuzzie/Beamer-Theme-Execushares

## Installation

Just clone this repository and Run *make* to build the main.pdf

    git clone https://github.com/weinshec/latex-beamer.git
    cd latex-beamer
    make

## Usage

Include the theme by using
```latex
\mode<presentation>
{%
  \usetheme{m4ck}
  \setcounter{showProgressBar}{1}
  \setcounter{showSlideNumbers}{1}
}
```
The options `showProgressBar` and `showSlideNumbers` define whether to show
(`1`) or not (`0`) the progress bar and slide numbers on the bottom of each
slide.

In addition to the default LaTeX/beamer command set there are several custom
functions defined.

+ Itemize with more space between bullets
  ```latex
  \begin{wideitemize}
    \item foobar
  \end{wideitemize}
  ```

+ Backup slides
  ```latex
  \backupbegin

  % add backp slides here

  \backupend
  ```
  doesn't show progress bar and uses correct slide numbering

+ Shadow image
  ```latex
  \begin{figure}[ht]
    \centering
    \shadowimage[width=0.9\textwidth]{myImage.pdf}
    \caption{Caption of the image}
  \end{figure}
  ```
  Draws a light shadow behind the image

