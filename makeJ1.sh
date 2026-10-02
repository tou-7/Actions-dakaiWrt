#!/bin/bash

echo "cancelWorkflow=true" >>$GITHUB_ENV
make -j1 V=s
