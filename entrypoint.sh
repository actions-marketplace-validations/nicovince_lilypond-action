#!/bin/bash
ARGS="$@"
OUTPUT=""
for f in ${ARGS}; do
    if [ ! -f ${f} ]; then
        echo "Error: ${f} does not exists"
        exit 1
    fi

    lilypond -o $(dirname ${f}) ${f}
    if [ $? -ne 0 ]; then
        echo "Error: Compilation failure on ${f}"
    fi

    OUTPUT="${OUTPUT}${f%%ly}pdf "
done

echo "::set-output name=pdfs::${OUTPUT}"
