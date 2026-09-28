cd kernel
grep -E '^[[:space:]]*Patch[0-9]*:' ../../*.spec |
sed 's/^[^:]*:[[:space:]]*//' |
while read -r patchfile; do
    echo "==> Applying $patchfile"
    patch --no-backup-if-mismatch -p1 < "../../$patchfile"
    git add .
    git commit -m "Apply $patchfile"
done
