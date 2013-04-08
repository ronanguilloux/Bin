#!/bin/sh

echo "Writing PHP Statistics in a new STATS file..."
phploc src/ > STATS
phpmd src/ text codesize,unusedcode,naming >> STATS
phpcpd src/ >> STATS
pdepend src/ >> STATS
php-cs-fixer fix src/ --dry-run >> STATS
git add STATS
echo "Done."
