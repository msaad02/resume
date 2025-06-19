#!/bin/bash

NAME="Matthew_Saad"
ROLE=${1:-default}
OUTDIR=./output
TMPFILES=./tmpfiles
JOBNAME="resume_${ROLE}"
YYYYMM=$(date '+%Y%m')

mkdir -p $TMPFILES

cp template/resume.tex $TMPFILES/resume_build.tex

sed -i'' -e "s/ROLE_PLACEHOLDER/${ROLE}/g"  "$TMPFILES/resume_build.tex"

# Run latexmk to create PDF
latexmk -pdf -silent \
        -jobname="$JOBNAME" \
        -outdir="$TMPFILES" \
        $TMPFILES/resume_build.tex

# Check sucessful creation, if not, error out
if [ $? -ne 0 ]; then
    echo "LaTeX build failed."
    # rm -rf $TMPFILES
    exit 1
fi

# Move the finished PDF where we want it
mv "$TMPFILES/$JOBNAME.pdf" "$OUTDIR/$NAME-$ROLE-$YYYYMM.pdf"

# Get rid of logfiles, ..., junk. Useful for local dev
rm -rf $TMPFILES

echo "Successfully built $OUTDIR/${JOBNAME}.pdf"
