#!/usr/bin/env bash

pushd /source
    echo "clearing build dir"
    rm -rf build

    echo "creating build dir"
    mkdir build
    mkdir build/package

    echo "copying source files"
    find . -name '*.py' -exec cp --parents {} build/package \;

    if [[ ${BUILD_TYPE} == "local" ]]; then
        echo "installing included packages for local testing"
        pip --disable-pip-version-check install boto3 -t build/package
    fi

    if [ -s requirements.txt ]; then
        echo "installing lambda requiements from requirements.txt"
        pip --disable-pip-version-check install -r requirements.txt -t build/package
    else 
        echo "requirements.txt is empty, no libraries to install in the package"
    fi
popd

echo "zipping the lambda package"
pushd /source/build/package
    zip ../lambda.zip -r .
popd
