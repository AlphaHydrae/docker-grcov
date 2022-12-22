FROM rust:1.66.0

ENV RUSTC_BOOTSTRAP=1 \
    RUSTFLAGS="-Cinstrument-coverage" \
    LLVM_PROFILE_FILE="target/debug/rust-%p-%m.profraw" \
    GRCOV_HTML_DIR=./target/debug/coverage \
    GRCOV_LCOV_FILE=./target/debug/coverage/rust.lcov

WORKDIR /usr/src/app

# Install tools required to instrument code and generate coverage reports.
RUN rustup component add llvm-tools-preview && \
    cargo install grcov

COPY fs/ /

CMD [ "/usr/local/bin/docker-command.sh" ]
