# qubership-apihub-nodejs-dev-image

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/netcracker/qubership-apihub-nodejs-dev-image/docker-ci.yml?label=build)

A development environment Docker image specifically designed for screenshot testing of NodeJS applications with Chrome and Puppeteer support. Used as a base image for development, testing, and CI/CD pipelines in the qubership-apihub ecosystem.

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

To use this image for screenshot testing with Jest and Puppeteer, you can leverage the `@netcracker/qubership-apihub-jest-chrome-in-docker-environment` package:

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

This configuration runs your Jest tests inside the Docker container, ensuring a consistent environment for your screenshot tests.

### Example workflow

1. Create a common Jest configuration for your tests
2. Create a common Puppeteer configuration
3. Set up a Docker-specific Jest configuration using the code above
4. Run your tests with this configuration to ensure consistency

## CI/CD Integration

This image is used in CI/CD pipelines for building and testing JavaScript/TypeScript applications. Here's an example of using it in GitHub Actions:

```yaml
name: Test
jobs:
  test:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/netcracker/qubership-apihub-nodejs-dev-image:1.7.3
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm test
```

## Direct Usage

### Pull the image

```bash
docker pull ghcr.io/netcracker/qubership-apihub-nodejs-dev-image:1.7.3
```

### Run a container

```bash
docker run -it --rm ghcr.io/netcracker/qubership-apihub-nodejs-dev-image:1.7.3 bash
```

### Use in Dockerfile

```dockerfile
FROM ghcr.io/netcracker/qubership-apihub-nodejs-dev-image:1.7.3

WORKDIR /app
COPY . .
RUN npm install
```

## Building the Image

```bash
cd development-environment
docker build -t qubership-apihub-nodejs-dev-image .
```

## License

See the [LICENSE](LICENSE) file for license rights and limitations.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests to us.

## Security

For security issues, please refer to [SECURITY.md](SECURITY.md).