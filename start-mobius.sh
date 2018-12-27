#!/bin/sh

# start mosquitto broker
service mosquitto start

# start mobius
node ${MOBIUS_BASE}/mobius.js
