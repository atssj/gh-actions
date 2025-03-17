# gh-actions Codebase Documentation

## Project Overview
This repository contains a collection of reusable GitHub Actions, with robust development practices and automation tooling. The project uses Bun as its package manager and follows a monorepo structure for managing multiple actions.

## Technology Stack
- **Runtime**: Node.js ≥20.10.0
- **Package Manager**: Bun ≥1.2.4
- **Development Tools**:
  - Prettier for code formatting
  - Husky for git hooks
  - Commitlint for commit message validation
  - Changesets for versioning

## Project Structure
```
gh-actions/
├── actions/                 # GitHub Actions
│   ├── action-template/    # Template for new actions
│   └── ftp-deploy/        # FTP deployment action
├── scripts/                # Utility scripts
├── .changeset/            # Changeset files
└── .github/               # GitHub workflows and templates
```

## Core Components

### 1. FTP Deploy Action
- **Purpose**: Deploys files to FTP servers with SSL/TLS support
- **Key Features**:
  - FTPS support with SSL verification options
  - Configurable directory mapping
  - File exclusion patterns
  - Enhanced logging
- **Implementation**: Uses `lftp` in an Alpine Linux container
- **Status**: In development (v0.1.0)

### 2. Development Workflow

#### Version Control & Commits
- Uses conventional commits
- Enforced scopes: ftp, core, auth, ci, deps, release
- Commit types: feat, fix, docs, style, refactor, test, chore, ci
- Husky hooks enforce commit message standards

#### CI/CD Pipeline
1. **Testing**: Automated tests for each action using act
2. **Release Process**:
   - Changesets for version management
   - Automated changelog generation
   - Docker image publishing to GHCR
   - GitHub release creation

#### Quality Assurance
- Prettier for consistent code formatting
- EditorConfig for editor standardization
- Dependabot for dependency updates
- Automated tests before releases

## Build & Release Process

### Local Development
1. Clone and setup:
   ```bash
   git clone https://github.com/atssj/gh-actions.git
   cd gh-actions
   bun install
   ```

2. Create new action:
   - Copy action-template directory
   - Update action.yml, README.md, package.json
   - Implement action logic
   - Add tests

### Release Process
1. Create changesets for modifications
2. Version update triggers:
   - Changelog generation
   - Package version bumps
   - Git tags
   - GitHub releases
   - Docker image publishing

## Configuration Files

### Key Configuration Files
- **package.json**: Project metadata and scripts
- **commitlint.config.js**: Commit message rules
- **.changeset/config.json**: Changeset configuration
- **.editorconfig**: Editor standards
- **renovate.json**: Dependency update rules

### GitHub Workflows
1. **test.yml**: Runs tests for modified actions
2. **release.yml**: Handles release automation
3. **docker-publish.yml**: Publishes Docker images
4. **action-release.yml**: Template for action releases

## Development Guidelines

### Adding New Actions
1. Use action-template as base
2. Follow naming conventions
3. Include comprehensive documentation
4. Add workflow tests
5. Update changeset

### Testing
- Local testing with act
- Integration tests with test FTP server
- CI validation on pull requests

### Documentation Requirements
- README.md for each action
- Input/output parameters
- Usage examples
- Implementation details
- Troubleshooting guides

## Maintenance

### Dependency Management
- Weekly Dependabot updates for:
  - Bun packages
  - Docker images
  - GitHub Actions

### Version Control
- Protected main branch
- Pull request requirements
- Conventional commits
- Automated versioning

## Future Considerations
1. Expanding action collection
2. Enhanced testing coverage
3. Documentation improvements
4. Performance optimizations

This documentation serves as a comprehensive guide for developers working with the gh-actions codebase. It should be updated as the project evolves.