#!/bin/bash

rm -rf pkg src st-*
pushd ../st/
git archive --format=tar.gz -o ../st-installer/st-0.8.3.tar.gz --prefix=st/ master
popd
makepkg -si --noconfirm
rm -rf pkg src st-*
