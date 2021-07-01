# grcov Docker image

[![Latest Build](https://github.com/AlphaHydrae/grcov/actions/workflows/latest-build.yml/badge.svg)](https://github.com/AlphaHydrae/grcov/actions/workflows/latest-build.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/alphahydrae/grcov.svg)](https://hub.docker.com/repository/docker/alphahydrae/grcov)
[![MIT License](https://img.shields.io/static/v1?label=license&message=MIT&color=informational)](https://opensource.org/licenses/MIT)

[Docker][docker] image with [grcov][grcov] installed to quickly run [Rust][rust]
tests and generate [code coverage][code-coverage] reports.

## Usage

You can mount your source code's directory into the image; it will run the tests
and generate code coverage reports:

```bash
cd /path/to/rust/project
docker run --rm --volume "$(pwd):/usr/src/app" alphahydrae/grcov:1
```

This will basically run `cargo test` on your project and then generate the code
coverage reports with `grcov` (note that this will modify your `target`
directory). See
[`./fs/usr/local/bin/docker-command.sh`](./fs/usr/local/bin/docker-command.sh)
for more information.

By default, two reports will be generated:

* An HTML report directory in `./target/debug/coverage`. You can open the
  `index.html` file within it in your favorite browser.
* An [LCOV][lcov] report file in `./target/debug/coverage/rust.lcov`. This
  report can be uploaded to a cloud platform like [Codecov][codecov].

## Configuration

These environment variables can be used to customize the behavior of the image:

| Variable          | Default value                       | Description                                                                             |
| :---------------- | :---------------------------------- | :-------------------------------------------------------------------------------------- |
| `GRCOV_HTML_DIR`  | `./target/debug/coverage`           | Target directory to generate the HTML coverage report to. Set to `false` to disable.    |
| `GRCOV_LCOV_FILE` | `./target/debug/coverage/rust.lcov` | Target file to generate the [LCOV][lcov] coverage report to. Set to `false` to disable. |

[code-coverage]: https://en.wikipedia.org/wiki/Code_coverage
[codecov]: https://codecov.io
[docker]: https://www.docker.com
[grcov]: https://github.com/mozilla/grcov
[lcov]: http://ltp.sourceforge.net/coverage/lcov.php
[rust]: https://www.rust-lang.org
