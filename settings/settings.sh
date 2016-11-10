#!/bin/bash

set -e

unity-control-center display
unity-control-center power
unity-control-center screen
unity-control-center sound
software-properties-gtk --open-tab=4

exit 0
