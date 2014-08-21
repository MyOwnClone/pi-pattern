CFLAGS = -std=c99 -Wall -O3
LDLIBS = -lsqlite3

pipattern : pipattern.o sqlite_index.o flat.o

pipattern.o : pipattern.c flat.h sqlite_index.h
sqlite_index.o : sqlite_index.c sqlite_index.h
flat.o : flat.c flat.h

.PHONY : clean distclean run

clean :
	$(RM) pipattern *.o

distclean : clean
	$(RM) pi.sqlite pi.sqlite-journal

run : pipattern
	./$^
