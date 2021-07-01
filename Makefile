GRCOV_IMAGE := alphahydrae/grcov

all: build check

build:
	docker build -t alphahydrae/grcov .

check:
	docker run --rm -v "$$PWD/tests:/usr/src/app" $(GRCOV_IMAGE)
	test -f tests/target/debug/coverage/index.html
	test -f tests/target/debug/coverage/rust.lcov
