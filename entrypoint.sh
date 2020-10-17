#!/bin/bash
ARGS="$@"
OUTPUT=""
echo "Lilypond list: ${ARGS}"
for f in ${ARGS}; do
    echo "Processing ${f}"
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
