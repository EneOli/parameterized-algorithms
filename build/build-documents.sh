#!/bin/bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
MAIN_PATH=$SCRIPT_PATH/../

cd $MAIN_PATH
mkdir -p dist/short-talk
mkdir -p dist/main-talk
mkdir -p dist/text


cd "$MAIN_PATH"short-talk
pdflatex -interaction nonstopmode -output-directory ../dist/short-talk presentation.tex
bibtex presentation
pdflatex -interaction nonstopmode -output-directory ../dist/short-talk presentation.tex

cd ..
cd "$MAIN_PATH"main-talk
pdflatex -interaction nonstopmode -output-directory ../dist/main-talk presentation.tex
bibtex presentation
pdflatex -interaction nonstopmode -output-directory ../dist/main-talk presentation.tex

cd ..
cd "$MAIN_PATH"text
pdflatex -interaction nonstopmode -output-directory ../dist/text "text.tex"
bibtex "text"
pdflatex -interaction nonstopmode -output-directory ../dist/text "text.tex"