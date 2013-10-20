#!/bin/bash

set -e

PACKAGE_NAME=$1

if [ "q$PACKAGE_NAME" == "q" ]; then
    PACKAGE_NAME="myapp_1.0_all.deb"
fi

pushd /var/apt/
    `sudo /usr/bin/reprepro includedeb seibzhen /vagrant/modules/repo/files/$PACKAGE_NAME`
popd