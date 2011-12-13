OPTFLAGS=-g

include src/config.o

OBJ=src/sakura.o

CFLAGS=$(OPTFLAGS) $(VTEINC) -DICON_DIR=\"$(ICON_DIR)\" -DEVILVTE_VERSION=\"$(EVILVTE_VERSION)\"

all: evilvte

evilvte: $(OBJ)
	$(CC) -o $(PROG) $(OBJ) $(LDFLAGS)

install:
	install -d $(bindir)
	install -m 755 $(PROG) $(bindir)
	install -d $(ICON_DIR_INSTALL)
	install -m 644 src/evilvte.png $(ICON_DIR_INSTALL)
	install -d $(mandir)
	install -m 644 src/evilvte.1 $(mandir)

clean: src/config.o
	rm -f $(PROG) src/*.o

src/config.o:
	./configure
