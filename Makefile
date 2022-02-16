HTML := 1-development-platform.html    \
        data-structures-in-c.html      \
        2-general-purpose-io.html      \
        3-interrupts.html              \
        4-analog-input-output.html     \
        5-hardware-timers.html         \
        6-pwm.html                     \
        7-serial-communication.html    \
        8-microcontroller-on-fpga.html \
        seven-segment-libraries.html   \
        distance-sensor.html         \
        lab-manual.html

PDF  := 1-development-platform.pdf    \
        data-structures-in-c.pdf      \
        2-general-purpose-io.pdf      \
        3-interrupts.pdf              \
        4-analog-input-output.pdf     \
        5-hardware-timers.pdf         \
        6-pwm.pdf                     \
        7-serial-communication.pdf    \
        8-microcontroller-on-fpga.pdf \
        seven-segment-libraries.pdf   \
        distance-sensor.pdf         \
        lab-manual.pdf


all: html pdf

html: $(HTML)
pdf: $(PDF)

HTML_OPTS := -v -a toc=left -a sectnums -a icons=font -a frame=topbot -a grid=rows -a source-highlighter=highlight.js -a highlightjs-theme=atom-one-light -d article -a stem
PDF_OPTS := -v -a toc=left -a sectnums -a icons=font -a frame=topbot -a grid=rows -a source-highlighter=coderay -d article -a stem
# -a source-highlighter=rouge -a rouge-theme=colorful
# -a source-highlighter=pygments -a pygments-style=autumn

%.html: %.adoc
	asciidoctor $(HTML_OPTS) -n -a data-uri $<

%.pdf: %.adoc pdf-theme.yml
	asciidoctor-pdf $(PDF_OPTS) -a pdf-stylesdir=. -a pdf-style=pdf $<

clean:
	rm -f $(HTML) $(PDF)

.PHONY: all clean html pdf
