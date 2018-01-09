latex-beamer
============

Makefile based LaTeX-Beamer template


## Description
This repository contains my latex beamer template developed during my PhD
thesis. The m4ck-theme heavily uses tikz and its design was inspired by 
https://github.com/FuzzyWuzzie/Beamer-Theme-Execushares

## Installation
Just clone this repository and run `make` to build the example `main.pdf`

    git clone https://github.com/weinshec/latex-beamer.git
    cd latex-beamer
    make

## Usage
The accompanying example file `main.tex` shows the basic usage and can be
modified right away to host your content. However, the following subsections
describe the features and option not available in vanilla beamer

### Optional components
The m4ck-theme allows to toggle several optional components such as a
progress bar at the bottom of every frame or cover slides at the beginning of
each content section. You may activate or deactivate those components using the
following commands after theme declaration.

```latex
\usetheme{m4ck}

\progressbartrue%    enable progressbar at the bottom
\slidenumberstrue%   enable slidenumbers
\sectionpagestrue%   enable section cover pages
```

The corresponding `-false` commands (e.g. `\progressbarfalse`) are used to
deactivate the respective component.

### Color scheme
There are four basic colors defined in m4ck-theme named
`mPrimary`, `mSecondary`, `mText`, `mTextGray`. Feel free to change these to
whatever suits you, e.g.

```latex
\definecolor{mPrimary}{RGB}{81,132,217}
\definecolor{mSecondary}{RGB}{255,156,0}
```

For a more granular control over the used colors, please refer to the original
[Beamer Documentation](http://mirrors.ctan.org/macros/latex/contrib/beamer/doc/beameruserguide.pdf).


### Additional commands
In addition to the default LaTeX/beamer command set there are several custom
commands defined.

+ Itemize with increased vertical space between bullets
  ```latex
  \begin{wideitemize}
    \item foobar
  \end{wideitemize}
  ```

+ Backup slides, never show the progress bar and correct for slide numbering
  ```latex
  \backupbegin

  % add backp slides here

  \backupend
  ```

+ Shadow image, draws a light shadow behind the image
  ```latex
  \begin{figure}[ht]
    \centering
    \shadowimage[width=0.9\textwidth]{myImage.pdf}
    \caption{Caption of the image}
  \end{figure}
  ```
