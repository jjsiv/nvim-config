#!/usr/bin/env bash
set -o pipefail

function log() {
    local timestamp=$(date +%FT%X)
    local level=${1^^}
    local msg=${2}

    jq \
        --compact-output \
        --null-input \
        --arg timestamp ${timestamp} \
        --arg level ${level} \
        --arg msg ${msg} \
        '{"timestamp": $timestamp, "level": $level, "message": $msg}'

}

log "info" "test"


