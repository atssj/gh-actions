# Release Process Documentation

## Overview
This repository uses a combination of changesets and GitHub Actions for managing releases of GitHub Actions.

## Key Components

### 1. Release Script (`scripts/release.sh`)
Handles the core release process:
- Runs changeset version updates
- Creates action-specific tags
- Pushes changes and tags

### 2. Release Workflow (`.github/workflows/release.yml`)
Triggers on tag push and:
- Generates changelog from commits
- Creates GitHub releases
- Updates action-specific changelogs

### 3. Docker Publishing (`.github/workflows/docker-publish.yml`)
Triggers on release publish and:
- Builds Docker images
- Tags with semantic versions
- Publishes to GitHub Container Registry

## Release Process Steps

### 1. Local Development
```bash
# Create changeset for your changes
bun changeset

# Format your code
bun run format

# Commit with conventional format
git commit -m "feat(ftp): add new feature"
```

### 2. Release Creation
```bash
# Run the release script
bun run release
```
This will:
- Update versions via changesets
- Create appropriate tags
- Push changes to GitHub

### 3. Automated Steps
The following happens automatically:
1. `release.yml` workflow:
   - Generates changelog from commits
   - Creates GitHub Release
   - Updates action CHANGELOG.md

2. `docker-publish.yml` workflow:
   - Builds new Docker image
   - Tags with semantic versions
   - Publishes to GHCR

## Version Management

### Tags Format
- Root releases: `v1.0.0`
- Action releases: `action-name-v1.0.0`

### Changelog Management
- Root CHANGELOG.md for repository changes
- Action-specific CHANGELOG.md in each action directory
- Generated from conventional commits

## Best Practices

1. **Commit Messages**
   - Follow conventional commits
   - Include scope: `feat(ftp): description`
   - Use allowed types and scopes

2. **Changesets**
   - Create for feature/fix changes
   - Include clear descriptions
   - Link related changes

3. **Version Updates**
   - Use `bun run release` for all releases
   - Never manually create tags
   - Let workflows handle releases

## Support and Resources

- Changesets Documentation: https://github.com/changesets/changesets
- GitHub Actions Documentation: https://docs.github.com/en/actions
- Internal Tools:
  - Release script: `scripts/release.sh`
  - Version script: `scripts/version.ps1`