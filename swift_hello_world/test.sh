#!/usr/bin/env bash

set -eux

swiftc HelloWorld.swift -o HelloWorld
./HelloWorld | grep 'Hello, World'
