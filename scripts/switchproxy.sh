#!/bin/bash

# Switch proxy
# Switches between SAP proxy config and no proxy config at all

if [ -z "$ALL_PROXY"]; then
  echo -n "SAP Proxy enabled!"
  export ALL_PROXY="http://proxy.wdf.sap.corp:8080"
  export HTTP_PROXY="http://proxy.wdf.sap.corp:8080"
  export HTTPS_PROXY="http://proxy.wdf.sap.corp:8080"
  export NO_PROXY=".sap.corp,localhost"
else
  echo -n "SAP Proxy disabled!"
  unset ALL_PROXY
  unset HTTP_PROXY
  unset HTTPS_PROXY
fi
