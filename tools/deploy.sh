#!/bin/bash

set -e

sed -i "s/#define VERSION.*/#define VERSION \"${TRAVIS_TAG}\"/" cScripts/script_component.hpp

python3 tools/build.py -b release -d -y --deploy

python3 tools/build.py -b release -p -d -y --deploy

sed -i "s/DEVBUILD/${TRAVIS_TAG}/g" Compositions/*/header.sqe

# Make a patch release
PREV_TAG=$(git describe --abbrev=0 --tags `git rev-list --tags --skip=1 --max-count=1`)
zip release/cScripts_PATCH_v${PREV_TAG}_to_v${TRAVIS_TAG}.zip `git diff --name-only tags/${TRAVIS_TAG}^ tags/${PREV_TAG}` -x=*Compositions* -x=*tools* -x=*resourses* -x=*.github* -x=*.travis.yml* -x=*.gitignore* -x=*.gitattributes* -x=*.editorconfig*

# Pack Compositions
zip release/Compositions-${TRAVIS_TAG}.zip -r Compositions
