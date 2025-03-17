# Release Process Documentation

## Overview
This document details the release process for the gh-actions repository, which uses Changesets for version management and automated release workflows.

## Key Components

### 1. Changesets Configuration
Located in `.changeset/config.json`:
- Fixed versioning for all `@gh-actions/*` packages
- Linked dependencies between actions
- Public access for all packages
- Patch-level updates for internal dependencies
- Snapshots enabled with calculated versions

### 2. Release Scripts
The project uses multiple release-related scripts:

```bash
# In package.json
bun run changeset     # Create new changesets
bun run version      # Update versions based on changesets
bun run release      # Execute full release process
```

### 3. Release Process Steps

#### A. Creating Changes
1. Make your changes in a feature branch
2. Create a changeset for your changes:
   ```bash
   bun changeset
   ```
3. Select the type of change:
   - major: Breaking changes
   - minor: New features
   - patch: Bug fixes
4. Write a detailed change description
5. Commit the generated changeset file

#### B. Version Management
1. When ready to release, run:
   ```bash
   bun run version
   ```
   This will:
   - Read all changesets
   - Update package versions
   - Generate/update CHANGELOG.md files
   - Remove processed changeset files

2. Tag Creation:
   The release script (`scripts/release.sh`) will:
   - Create tags for each changed package
   - Push tags to remote
   - Format: `{action-name}-v{version}` (e.g., `ftp-deploy-v1.0.0`)

#### C. Release Publication
1. GitHub Actions workflow (`release.yml`) triggers on tag push
2. Creates GitHub Release with:
   - Changelog from commit messages
   - Release name based on tag
   - Published state (not draft/prerelease)

#### D. Docker Image Publication
For actions using Docker:
1. `docker-publish.yml` workflow triggers on release
2. Publishes to GitHub Container Registry
3. Tags format:
   - Exact version: `v1.0.0`
   - Minor version: `v1.0`
   - Major version: `v1`

### 4. Version Tracking

#### Package Versions
- Stored in individual `package.json` files
- Example for FTP Deploy:
  ```json
  {
    "name": "@gh-actions/ftp-deploy",
    "version": "0.1.0"
  }
  ```

#### Action Versions
- Defined in `action.yml` files
- Referenced in workflow files using tags
- Example usage:
  ```yaml
  - uses: atssj/gh-actions/actions/ftp-deploy@v1
  ```

### 5. Maintenance

#### A. Best Practices
1. Always create changesets for modifications
2. Use conventional commit messages
3. Keep changelog entries clear and user-focused
4. Test actions before releasing

#### B. Troubleshooting
Common issues and solutions:
1. Failed version update:
   - Check for merge conflicts in package.json files
   - Verify changeset format
2. Tag conflicts:
   - Delete conflicting local/remote tags
   - Re-run release process

### 6. Example Release Workflow

1. Development Phase:
   ```bash
   git checkout -b feature/new-feature
   # Make changes
   bun changeset  # Create changeset
   git add .
   git commit -m "feat(scope): description"
   git push
   ```

2. Release Phase:
   ```bash
   git checkout main
   git pull
   bun run version
   git push --follow-tags
   ```

3. Automated processes:
   - GitHub Actions create releases
   - Docker images are published
   - Documentation is updated

### 7. CI/CD Integration

The release process is integrated with CI/CD through:
- GitHub Actions workflows
- Automated testing
- Docker image builds
- Release creation
- Package publishing

## Support and Resources

- Changesets Documentation: https://github.com/changesets/changesets
- GitHub Actions Documentation: https://docs.github.com/en/actions
- Internal Tools:
  - Release script: `scripts/release.sh`
  - Version script: `scripts/version.ps1`