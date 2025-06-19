#!/bin/bash

ROLE=${1:-default}
OUTDIR=./output
TMPFILES=./tmpfiles
JOBNAME="resume_${ROLE}"

mkdir -p $TMPFILES

cp template/resume.tex $TMPFILES/resume_build.tex

# Replace the default role include with the selected role file.
# GNU sed (used on Linux) doesn't require a backup suffix for -i.
# The previous "-i ''" syntax was BSD-specific and caused errors on Linux.
sed -i "s|\\\input{roles/.*}|\\\input{../roles/${ROLE}.tex}|g" \
    "$TMPFILES/resume_build.tex"

# Run latexmk: send all aux output to $TMPDIR, set jobname
latexmk -pdf -silent \
        -jobname="$JOBNAME" \
        -outdir="$TMPFILES" \
        $TMPFILES/resume_build.tex

# Move the finished PDF where we want it
mv "${TMPFILES}/${JOBNAME}.pdf" "$OUTDIR/${JOBNAME}.pdf"

rm -rf $TMPFILES

echo "Successfully built $OUTDIR/${JOBNAME}.pdf"
