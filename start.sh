#!/usr/bin/env bash

set -e

docker build . --tag spammer

docker run -ti spammer
