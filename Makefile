BLACK=black

.PHONY : check \
	all \
	install \
	check-format \
	format

all: check-format check

install:
	python3 -m pip install --user --upgrade .

check:
	$(MAKE) -C tests check

check-format:
	${BLACK} --version
	${BLACK} --check sdl2promela
	${BLACK} --check tests

format:
	${BLACK} sdl2promela
	${BLACK} tests
