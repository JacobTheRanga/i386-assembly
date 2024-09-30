AS=nasm
ASFLAGS=-f elf32
LD=ld
LDFLAGS=-m elf_i386
SRCDIR=./src
OBJDIR=./obj
BINDIR=./bin

SRCS:=$(wildcard $(SRCDIR)/*.s)
OBJS:=$(patsubst $(SRCDIR)/%.s, $(OBJDIR)/%.o, $(SRCS))
BINS:=$(patsubst $(SRCDIR)/%.s, $(BINDIR)/%, $(SRCS))

all: $(BINS)

clean:
	rm -r $(OBJDIR) $(BINDIR)

$(BINDIR)/%: $(OBJDIR)/%.o
	$(LD) $(LDFLAGS) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $^

$(OBJS): | $(OBJDIR)
$(BINS): | $(BINDIR)
$(OBJDIR) $(BINDIR):
	mkdir $@