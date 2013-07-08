#! /bin/bash
#
# wtf-did-i-do.sh
# Source: https://coderwall.com/p/saylrw


# If you're a develouper who uses git, this little sucker can help you remember wtf you did on a specific date

# Usage: ./wtf-did-i-do {Name} {Date}
find . -type d -maxdepth 1 -exec git --git-dir=./'{}'/.git log --author="$1" --pretty=format:"{} : %an - %ad -> %s" --date=iso --all \; | grep $2




