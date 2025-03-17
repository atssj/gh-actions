# Contributing to gh-actions

Thank you for your interest in contributing to our GitHub Actions collection! This document will guide you through the contribution process.

## Development Setup

1. Ensure you have the following installed:
   - Node.js (>=20.10.0)
   - [Bun](https://bun.sh/) (>=1.2.4)

2. Clone the repository and install dependencies:
   ```bash
   git clone https://github.com/atssj/gh-actions.git
   cd gh-actions
   bun install
   ```

## Project Structure

```
gh-actions/
├── actions/           # Individual GitHub Actions
│   ├── action-template/  # Template for new actions
│   └── ftp-deploy/      # FTP deployment action
├── scripts/          # Utility scripts
└── .changeset/       # Changeset files for versioning
```

## Development Workflow

1. Create a new branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes following our coding standards and commit guidelines.

3. Run formatter before committing:
   ```bash
   bun run format
   ```

4. Create a changeset for your changes:
   ```bash
   bun changeset
   ```

5. Push your changes and create a pull request.

## Commit Message Convention

We use conventional commits for consistent commit messages. Each commit message should be structured as follows:

```
type(scope): description

[optional body]

[optional footer]
```

### Types
- `feat`: New features
- `fix`: Bug fixes
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding/updating tests
- `chore`: Maintenance tasks
- `ci`: CI/CD changes

### Scopes
- `ftp`: FTP deployment action
- `core`: Core functionality
- `auth`: Authentication related
- `ci`: CI/CD related
- `deps`: Dependencies
- `release`: Release related

Example:
```
feat(ftp): add SSL verification option
```

## Adding a New Action

1. Copy the `actions/action-template` directory
2. Update the following files:
   - `action.yml`: Action metadata
   - `README.md`: Action documentation
   - `package.json`: Action details

3. Implement your action logic
4. Add tests in the `tests` directory
5. Update workflow files as needed

## Testing

Each action should include its own workflow test file in the `tests` directory. Run tests locally using [act](https://github.com/nektos/act):

```bash
act -j test -W ./actions/your-action/tests/workflow-test.yml
```

## Documentation

- Each action must have its own README.md with:
  - Clear description
  - Input/output parameters
  - Usage examples
  - Any special requirements or notes

## Release Process

1. Changes are tracked using [changesets](https://github.com/changesets/changesets)
2. Create a changeset for your changes:
   ```bash
   bun changeset
   ```
3. Version packages when ready:
   ```bash
   bun version
   ```
4. Release will be automatically handled by our CI/CD pipeline

## Questions?

If you have any questions or need help, please open an issue in the repository.

Thank you for contributing!