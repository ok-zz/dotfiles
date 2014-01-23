#!/bin/bash

# Switch proxy
# Switches between SAP proxy config and no proxy config at all

if [ -z "$all_proxy" ]; then
  echo "SAP Proxy enabled!"
  export all_proxy="http://proxy.wdf.sap.corp:8080"
  export http_proxy="http://proxy.wdf.sap.corp:8080"
  export https_proxy="http://proxy.wdf.sap.corp:8080"
  export no_proxy=".sap.corp,localhost"
else
  echo "SAP Proxy disabled!"
  unset all_proxy
  unset http_proxy
  unset https_proxy
fi
