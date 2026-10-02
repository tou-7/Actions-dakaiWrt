#!/bin/bash

echo "j1模式"
echo "cancelWorkflow=true" >>$GITHUB_ENV
make -j1 V=s
