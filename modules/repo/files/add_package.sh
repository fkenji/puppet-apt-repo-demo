#!/bin/bash

set -e

PACKAGE_PATH=$1

if [ "q$PACKAGE_PATH" == "q" ]; then
    PACKAGE_PATH="/vagrant/modules/repo/files/myapp_1.0_all.deb"
fi

pushd /var/apt/
    `sudo /usr/bin/reprepro includedeb seibzhen $PACKAGE_PATH`
popd