echo "my own bachrc"

# In Mac OS X, what network location is set?
if [ -f "/usr/sbin/scselect" ]; then
  export LOCATION=$(/usr/sbin/scselect 2>&1 | perl -ne 'if (m/^\s+\*\s+(\S+)\s+\((.+)\)$/) { print "$2\n"; }')
fi

# Location-specific settings
if [ ! -z "$LOCATION" -a "$LOCATION" = "SAP Office Berlin" ]; then
  export ALL_PROXY="http://proxy.wdf.sap.corp:8080"
  # cp "$HOME/.ssh/config.microsoft" "$HOME/.ssh/config"
else
  unset http_proxy
  # cp "$HOME/.ssh/config.default" "$HOME/.ssh/config"
fi

alias ll='ls -laG'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
