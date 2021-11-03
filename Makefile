BLACK=black

.PHONY : check \
	all \
	install \
	format

all: format check

install:
	python3 -m pip install --user --upgrade .

check:
	$(MAKE) -C tests check

format:
	${BLACK} sdl2promela
	${BLACK} tests
