#!/bin/bash

rm -rf pkg src st-*
makepkg -si --noconfirm
rm -rf pkg src st-*
