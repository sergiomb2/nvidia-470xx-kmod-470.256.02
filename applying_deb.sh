dir="../../nvidia-graphics-drivers.debian/debian/module/debian/patches"
cd kernel
grep 00 "$dir/series.in" |
while read -r patchfile; do
    echo "==> Applying $patchfile"
    patch --no-backup-if-mismatch -p1 < "$dir/$patchfile"
    git commit -m "Apply $patchfile" .
done
