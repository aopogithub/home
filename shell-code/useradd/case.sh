#!/bin/bash
case $1 in redhat)
  echo "fedora" ;;
           fedora)
  echo "redhat" ;;
                *) 
  echo "/root/foo.sh redhat|fedora" >&2
  exit 3
esac
