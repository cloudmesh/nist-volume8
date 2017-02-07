UNAME := $(shell uname)

OPEN=open
ifeq ($(UNAME), Darwin)
OPEN=open
endif
ifeq ($(UNAME), Linux)
OPEN=xdg-open
endif



FILE=nist-volume-8

all: json
	pdflatex ${FILE}
	bibtex ${FILE}
	pdflatex ${FILE}
	pdflatex ${FILE}

real-clean: clean
	rm -rf *.pdf

clean:
	rm -rf *~ *.aux *.bbl *.dvi *.log *.out *.blg *.toc *.fdb_latexmk *.fls *.tdo *.bcf

view:
	$(OPEN) ${FILE}.pdf

# all dependce tracking taking care of by Latexmk
fast:
	latexmk -pdf ${FILE}

watch:
	latexmk -pvc -view=pdf ${FILE}

.PHONY: all clean view fast watch

genie:
	git clone https://github.com/drud/evegenie.git
	cd evegenie; pip install -r requirements.txt
json:
	make -C resources

columns=fullflexiblesed '/PATTERN/q' FILE
