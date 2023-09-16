#!/bin/bash

docker build --progress=plain -t zig-build -f zig.Dockerfile .
