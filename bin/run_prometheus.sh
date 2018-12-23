#!/bin/sh

# Replace variable for consul token
sed -i -e 's#\${CONSUL_TOKEN}#'"$CONSUL_TOKEN"'#' /etc/prometheus/prometheus.yml

# Pass all parameters to original command
/bin/prometheus $@