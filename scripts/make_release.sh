#!/bin/sh

data_file='registry.json'
compressed="${data_file}.zip"
checksum='checksums.txt'
yq eval-all '[.]' -o json packages/*/package.yaml >${data_file}
zip -r ${compressed} ${data_file}
sha256sum ${data_file} ${compressed} >${checksum}

release_dir='./release'
mkdir -p ${release_dir}
mv ${data_file} ${compressed} ${checksum} ${release_dir}
