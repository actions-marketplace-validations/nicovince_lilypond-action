#!/bin/bash
ARGS="$@"
OUTPUT=""

function simple_mode()
{
    echo "Lilypond list: ${INPUT_LY_FILES}"
    for f in ${INPUT_LY_FILES}; do
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

    echo "pdfs=${OUTPUT}" >> ${GITHUB_OUTPUT}
}

function make_mode()
{
    make -C $(pwd)/${INPUT_MAKE_DIR} ${INPUT_MAKE_TARGET}
    if [ $? -ne 0 ]; then
        echo "Make based build failed"
        exit 1
    fi
    PDFS=$(find . -name "*.pdf")
    echo "pdfs=${PDFS}" >> ${GITHUB_OUTPUT}
}

if [ "${INPUT_BUILD_MODE}" = "simple" ]; then
    simple_mode
elif [ "${INPUT_BUILD_MODE}" = "make" ]; then
    make_mode
fi
