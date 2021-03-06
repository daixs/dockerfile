#!/bin/sh
set -e
cat > /etc/etcd.conf < EOF
# [member]
ETCD_NAME="${ETCD_NAME}"
ETCD_DATA_DIR="/etcd"
ETCD_LISTEN_PEER_URLS="${ETCD_LISTEN_PEER_URLS}"
ETCD_LISTEN_CLIENT_URLS="${ETCD_LISTEN_CLIENT_URLS}"

#[cluster]
ETCD_INITIAL_ADVERTISE_PEER_URLS="${ETCD_INITIAL_ADVERTISE_PEER_URLS}"
ETCD_INITIAL_CLUSTER_STATE="${ETCD_INITIAL_CLUSTER_STATE}"
ETCD_INITIAL_CLUSTER_TOKEN="${ETCD_INITIAL_CLUSTER_TOKEN}"
ETCD_ADVERTISE_CLIENT_URLS="${ETCD_ADVERTISE_CLIENT_URLS}"

# ETCD_INITIAL_CLUSTER="etcd1=http://k8s_master_ip1,etcd2=http://k8s_master_ip2:2380"
EOF
echo /etc/etcd.conf 
exec etcd --config-file /etc/etcd.conf
