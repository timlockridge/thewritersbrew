BUILD = build
BOOKNAME = thewritersbrew
TITLE = title.txt
METADATA = metadata.xml
CHAPTERS = ebook.md
TOC = --toc --toc-depth=2
COVER_IMAGE = img/media/cover-image.jpg
LATEX_CLASS = report
CLEVEL = --epub-chapter-level=2
CSS = --css=epub.css

all: book

book: epub

clean:
	rm -r $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) $(CSS) $(CLEVEL) -f markdown+smart --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) --epub-embed-font="fonts/*.ttf" --epub-embed-font="fonts/*.txt" -o $@ $^

.PHONY: all book clean epub
