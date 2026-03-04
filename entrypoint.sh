#!/bin/bash
set -e

HOST="${RENDER_EXTERNAL_HOSTNAME:-localhost}"
export KAFKA_ADVERTISED_LISTENERS="PLAINTEXT://${HOST}:9092"

echo "==> Advertising Kafka on: ${KAFKA_ADVERTISED_LISTENERS}"

exec /etc/kafka/docker/run