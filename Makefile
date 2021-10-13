.PHONY : check \
	all \
	install

all: check

install:
	python3 -m pip install --user --upgrade .

check:
	$(MAKE) -C tests check
