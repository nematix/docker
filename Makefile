#!/bin/bash

pushd base && ./Makefile && popd
pushd platforms && ./Makefile && popd
pushd services && ./Makefile && popd
pushd tools && ./Makefile
