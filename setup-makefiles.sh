#!/bin/bash

set -e

export VENDOR=htc
export DEVICE=leo
./../../$VENDOR/qsd8k-common/setup-makefiles.sh $@
