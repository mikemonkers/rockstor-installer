#!/bin/bash
set -e
set -u
#set -x

PROFILE=${1:-x86_64}
#PROFILE="RaspberryPi4"

KIWI_BUILD_DIR="/home/vagrant/kiwi-images/"
REPO_DIR="/home/vagrant/rockstor-installer/"

echo '============================================='
echo 'Starting Build'
echo '============================================='
cd ${REPO_DIR}
if [ -e ${KIWI_BUILD_DIR} ]; then
    sudo rm -rf "${KIWI_BUILD_DIR}/build";
fi
sudo kiwi-ng --profile=Leap15.2."${PROFILE}" --type oem system build --description ./ --target-dir "${KIWI_BUILD_DIR}/"
sudo find ${KIWI_BUILD_DIR} -name "*.iso" -exec cp {} /vagrant/ \;
echo '============================================='
echo 'Finished Build'
echo '============================================='
