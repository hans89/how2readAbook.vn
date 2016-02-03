BUILD = build
BOOKNAME = h2rab.vn
FRONT = front.md
CHAPTERS = part1/*.md part2/*.md part3/*.md part4/*.md
BACK = back.md
CONTENTS = $(FRONT) $(CHAPTERS) $(BACK)
TOC = --toc --toc-depth=2
METADATA = metadata.xml
LATEX_CLASS = book

all: book

book: pdf html

clean:
	rm -r $(BUILD)

epub: $(BUILD)/$(BOOKNAME).epub

html: $(BUILD)/$(BOOKNAME).html

pdf: $(BUILD)/$(BOOKNAME).pdf

$(BUILD)/$(BOOKNAME).epub: $(CONTENTS)
	mkdir -p $(BUILD)
	pandoc $(TOC) -S -o $@ $^

$(BUILD)/$(BOOKNAME).html: $(CONTENTS)
	mkdir -p $(BUILD)
	pandoc $(TOC) -s --to=html5 -o $@ $^

$(BUILD)/$(BOOKNAME).pdf: $(CONTENTS)
	mkdir -p $(BUILD)
	pandoc -V documentclass=$(LATEX_CLASS) -s -o $@ $^

.PHONY: all book clean epub html pdf
