#!/bin/bash

source ./detect-os.sh;


OS=$(detect_os|awk '{print tolower($0)}');
echo $OS
