# GitHub Actions Collection

A collection of reusable GitHub Actions with robust development practices and automation tooling.

## Available Actions

### FTP Deploy
Deploy files to FTP servers with SSL/TLS support and enhanced logging capabilities.
[View Documentation](actions/ftp-deploy/README.md)

## Development

### Prerequisites
- Node.js ≥20.10.0
- [Bun](https://bun.sh/) ≥1.2.4

### Setup
```bash
git clone https://github.com/atssj/gh-actions.git
cd gh-actions
bun install
```

### Development Workflow
1. Create a feature branch
2. Make changes
3. Create changeset: `bun changeset`
4. Commit and push
5. Create pull request

For detailed guidelines, see our [Contributing Guide](CONTRIBUTING.md).

### Release Process
The project uses Changesets for versioning and release management. See our [Release Process](docs/RELEASE_PROCESS.md) for details.

## Project Structure
```
gh-actions/
├── actions/          # Individual GitHub Actions
├── docs/            # Project documentation
└── scripts/         # Utility scripts
```

## License
This project is released under the [Unlicense](LICENSE).
