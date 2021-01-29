# Docker Codecept Multimocha Playwright

This Image uses the official Playwright Image and setups [Codecept](https://codecept.io/) and [Multimocha](https://codecept.io/reports/#multi-reports). You can mount your Codecept project into a container where it will get executed without additional setup.

## How to use

Run your codecept project

```sh
docker run -it --rm -v /path/to/your/codecept/folder:/tests codecept-multimocha-playwright:latest
```

Run one of the example tests:

```sh
docker run -it --rm -v $(pwd)/test/chromium:/tests codecept-multimocha-playwright:latest

docker run -it --rm -v $(pwd)/test/firefox:/tests codecept-multimocha-playwright:latest

docker run -it --rm -v $(pwd)/test/webkit:/tests codecept-multimocha-playwright:latest
```

Note that you need Playwright in your Codecept config and multimocha:

```js
exports.config = {
  tests: "./*.test.js",
  output: "./output",
  helpers: {
    Playwright: {
      url: "http://localhost",
      show: false,
      browser: "webkit",
    },
  },
  mocha: {
    reporterOptions: {
      "codeceptjs-cli-reporter": {
        stdout: "-",
        options: {
          verbose: false,
          steps: true,
        },
      },
      "mocha-junit-reporter": {
        stdout: "./output/console.log",
        options: {
          mochaFile: "./output/result.xml",
        },
        attachments: true,
      },
    },
  },
  ...
};
```

[Full example config](./test/webkit/codecept.conf.js)

## Development

Build Image

```sh
docker build . -t codecept-multimocha-playwright
```

Debug:

```sh
docker run -it --rm -v $(pwd)/test/webkit:/tests codecept-multimocha-playwright:latest /bin/bash
```

## Tests

```sh
sudo ./run_tests.sh
```
