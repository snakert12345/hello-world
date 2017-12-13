# Still learning about make files and so far it is looking good.
IDIR=../include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=obj

_DEPS=func.h
DEPS= $(patsubset %,$(ODIR)/%,$(_OBJ))

_OBJ=main.o func.o
OBJ=$(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hello: $(OBJ)
	$(CC) -o $@ $^  $(CFLAGS)


.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(IDIR)/*~
