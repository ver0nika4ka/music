CC ?= clang
CFLAGS ?= -fsanitize=integer -fsanitize=undefined -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wshadow
LDLIBS ?= -lm

.PHONY: all
all: notes synthesize

notes: helpers.c helpers.h notes.c wav.c wav.h cs50.c
	$(CC) $(CFLAGS) -o notes helpers.c notes.c wav.c cs50.c $(LDLIBS)

synthesize: synthesize.c wav.c wav.h helpers.c helpers.h cs50.c
	$(CC) $(CFLAGS) -o synthesize helpers.c synthesize.c wav.c cs50.c $(LDLIBS)

.PHONY: clean
clean:
	rm -f notes synthesize *.wav
