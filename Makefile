all: build check

build:
	docker build -t alphahydrae/grcov .

check:
	docker run --rm -v "$$PWD/tests:/usr/src/app" alphahydrae/grcov
	test -f tests/target/debug/coverage/index.html
	test -f tests/target/debug/coverage/rust.lcov
