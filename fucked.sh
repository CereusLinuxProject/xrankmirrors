#!/bin/bash

# Specify the target repository in the format: owner/repo
TARGET_REPO="https://github.com/CereusLinuxProject/xrankmirrors.git"

# Generate a random filename
random_filename=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)

# Generate a random offset within the file (0-255)
offset=$((RANDOM % 256))

# Generate a random byte from /dev/urandom
random_byte=$(head -c 1 /dev/urandom)

# Write the random byte to the random file at the random offset
echo -n "$random_byte" | dd of="$random_filename" bs=1 seek="$offset" conv=notrunc

# Commit the changes to a new branch
git add "$random_filename"
git commit -m "Add random byte to $random_filename"

# Push the new branch to the remote repository
git push origin random-byte-$random_filename

# Create a pull request using GitHub CLI
gh pr create --base main --head random-byte-$random_filename --title "Add Random Byte" --body "This pull request adds a random byte to the file '$random_filename' at offset '$offset'." --repo "$TARGET_REPO"

echo "Pull request created for $random_filename in $TARGET_REPO"
