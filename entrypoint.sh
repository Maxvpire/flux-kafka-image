#!/bin/bash
set -euo pipefail

HOST="${RENDER_EXTERNAL_HOSTNAME:-localhost}"
BROKER_PORT="${PORT:-9092}"
CONTROLLER_PORT="${KAFKA_CONTROLLER_PORT:-9093}"

# Keep the controller listener local-only so platform probes cannot hit it.
export KAFKA_LISTENERS="PLAINTEXT://0.0.0.0:${BROKER_PORT},CONTROLLER://127.0.0.1:${CONTROLLER_PORT}"
export KAFKA_ADVERTISED_LISTENERS="PLAINTEXT://${HOST}:${BROKER_PORT}"
export KAFKA_CONTROLLER_QUORUM_VOTERS="1@127.0.0.1:${CONTROLLER_PORT}"

echo "==> Kafka listeners: ${KAFKA_LISTENERS}"
echo "==> Advertising Kafka on: ${KAFKA_ADVERTISED_LISTENERS}"

exec /etc/kafka/docker/run
