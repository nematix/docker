#!/bin/bash

pushd platforms && ./Makefile && popd
pushd tools && ./Makefile
