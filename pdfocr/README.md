Folgende Scripte durchwandern alle PDFs in einem Verzeichnisbaum und führen eine Texterkennung für die PDFs durch, die weder eigene Texte haben noch einen Text-Layer.

Diese PDFs werden von Scannern ohne OCR-Möglichkeit gerne mal produziert - das Script erkennt den Text und bastelt eine Text-Ebene dazu.

Effekt: Diese PDFs können durch Desktop-Suchmaschinen (bspw. recoll oder spotlight) indexiert und damit durchsucht und gefunden werden.

Wenn ich mich richtig erinnere, folgende Tools werden gebraucht (hier Ubuntu/Debian):

<code>sudo apt install ghostscript poppler-utils cuneiform pdfsandwich</code>
