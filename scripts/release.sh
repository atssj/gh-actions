#!/bin/bash

set -e

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Starting release process...${NC}"

# Run changeset version and get the new versions
echo -e "${YELLOW}Running changeset version...${NC}"
bun changeset version

# Get all changed packages
changed_packages=$(find actions -name "package.json" -exec sh -c 'jq -r "select(.version != null) | \"\$(dirname {})/\(.version)\"" {}' \;)

if [ -z "$changed_packages" ]; then
  echo -e "${RED}No packages were changed.${NC}"
  exit 0
fi

# Create and push tags for each changed package
echo -e "${GREEN}Creating tags for changed packages...${NC}"
echo "$changed_packages" | while IFS='/' read -r dir version; do
  if [ -n "$dir" ] && [ -n "$version" ]; then
    action_name=$(basename $dir)
    tag="${action_name}/v${version}"
    echo -e "${YELLOW}Creating tag ${tag}...${NC}"
    git tag "$tag"
    git push origin "$tag"
    echo -e "${GREEN}✓ Tag ${tag} created and pushed${NC}"
  fi
done

# Commit and push changes
echo -e "${YELLOW}Pushing version changes...${NC}"
git push --follow-tags

echo -e "${GREEN}Release process completed successfully.${NC}"
echo -e "${BLUE}========================================${NC}"
