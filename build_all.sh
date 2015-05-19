#!/bin/bash


for platform in `ls configs/platforms`
do
    pt=$(echo $platform | sed -e 's/\.rb//g')
    bundle exec build pe-code-manager $pt
done

