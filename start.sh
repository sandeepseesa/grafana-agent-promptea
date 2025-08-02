echo ">> Starting Grafana Alloy (Flow Mode)"
exec /usr/bin/alloy run \
  --server.http.listen-addr=0.0.0.0:${PORT} \
  /etc/alloy-config.river

