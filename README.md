# qubership-apihub-nodejs-dev-image

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/netcracker/qubership-apihub-nodejs-dev-image/docker-ci.yml?label=build)

This Docker image provides a development environment primarily designed for screenshot testing of frontend applications, featuring Chrome and Puppeteer support. However, it is also well-suited for general development purposes whenever an environment with the specific pre-installed software (listed in the 'Installed Software' section below) is needed.

## Features

- Pre-installed Chrome browser for automated screenshot testing
- Puppeteer integration for headless browser automation
- Ready-to-use Node.js development environment
- Based on CentOS 8.4.2105

## Installed Software

| Software name | Version        |
|---------------|----------------|
| Node          | 20.11.1        |
| NPM           | 10.2.4         |
| Yarn          | 1.22.21        |
| Chrome        | 125.0.6422.141 |
| Puppeteer     | 21.11.0        |

## Screenshot Testing

This image is primarily built for running screenshot tests in a consistent environment. It provides a pre-configured Chrome browser with Puppeteer support, ensuring reliable test results across different CI/CD environments.

### Using with Jest and Puppeteer

To use this image for screenshot testing with Jest and Puppeteer, you can leverage the [@netcracker/qubership-apihub-jest-chrome-in-docker-environment](https://github.com/Netcracker/qubership-apihub-jest-chrome-in-docker-environment) package:

```javascript
// it-test-docker.jest.config.cjs
const path = require('path')
const { prepareJestConfig } = require('@netcracker/qubership-apihub-jest-chrome-in-docker-environment')

module.exports = prepareJestConfig(
  path.resolve(__dirname, './common-it-test.jest.config.cjs'),
  path.resolve(__dirname, './common-puppeteer.config.cjs'),
  {
    dockerImage: 'ghcr.io/netcracker/qubership-apihub-nodejs-dev-image:1.7.3',
  },
)
```

This configuration runs your Jest tests inside the Docker container.

### Example workflow

1. Create a common Jest configuration for your tests
2. Create a common Puppeteer configuration
3. Set up a Docker-specific Jest configuration using the code above
4. Run your tests with this configuration to ensure consistency

## CI/CD Integration

This image is used in CI/CD pipelines for building and testing frontend applications. For an example of using this image in GitHub Actions, see the [screenshot-tests.yaml](https://github.com/Netcracker/qubership-apihub-ci/blob/main/.github/workflows/screenshot-tests.yaml) workflow file.

## Building the Image

You can also build the image locally, without using the image from the registry, by executing the commands below:

```bash
cd development-environment
docker build -t qubership-apihub-nodejs-dev-image .
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests to us.
