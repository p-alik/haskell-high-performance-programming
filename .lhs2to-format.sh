#!/usr/bin/env bash

if [ -z "$1" ]
then
  echo -e "usage:\n$0 X.lhs"
  exit
fi

CSS=css/pandoc.css
BN=$(basename "$0" ".sh")
#remove lhs2 prefix
TO_FORMAT=${BN#*2}

pandoc --template=template/default.$TO_FORMAT \
      --css=$CSS                              \
      --from=markdown+lhs                     \
      --output=$1.$TO_FORMAT                  \
      --standalone                            \
      --to=$TO_FORMAT                         \
      --toc                                   \
      --verbose                               \
      $1
