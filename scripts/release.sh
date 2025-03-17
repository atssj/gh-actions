#!/bin/bash

set -e

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to create and push a tag for a Docker image
create_and_push_tag() {
  local image_name=$1
  local version=$(node -p "require('./actions/${image_name}/package.json').version")
  local tag="${image_name}-v${version}"

  echo -e "${BLUE}----------------------------------------${NC}"
  echo -e "${GREEN}Creating tag ${tag} for ${image_name}...${NC}"
  # git tag ${tag}
  # git push origin ${tag}
  echo -e "${GREEN}Tag ${tag} created and pushed for ${image_name}.${NC}"
  echo -e "${BLUE}----------------------------------------${NC}"
}

# Function to check if there are changes in a specific directory
has_changes() {
  local dir=$1
  echo -e "${YELLOW}Checking for changes in ${dir}...${NC}"
  if git diff --quiet HEAD^ HEAD -- $dir; then
    echo -e "${RED}No changes detected in ${dir}.${NC}"
    return 1
  else
    echo -e "${GREEN}Changes detected in ${dir}.${NC}"
    return 0
  fi
}

# Iterate over all subdirectories in the actions folder
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Starting release process...${NC}"
for dir in actions/*; do
  if [ -d "$dir" ]; then
    image_name=$(basename "$dir")
    echo -e "${BLUE}----------------------------------------${NC}"
    echo -e "${YELLOW}Processing ${image_name}...${NC}"
    if has_changes "$dir"; then
      echo -e "${GREEN}Changes found in ${dir}, creating tag...${NC}"
      create_and_push_tag "$image_name"
    else
      echo -e "${RED}No changes found in ${dir}, skipping tag creation.${NC}"
    fi
    echo -e "${BLUE}----------------------------------------${NC}"
  else
    echo -e "${RED}${dir} is not a directory, skipping...${NC}"
  fi
done
echo -e "${BLUE}Release process completed.${NC}"
echo -e "${BLUE}========================================${NC}"
