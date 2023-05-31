ACME=acme

PROGS	= c64robots

all: $(PROGS)

c64robots: C64ROBOTS.ASM
	$(ACME) $<

clean:
	rm -f c64robots

check: all
	@echo "Verifying checksums....(you should look for errors below)"
	@./checksum.sh

