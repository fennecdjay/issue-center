#!/bin/sh

# TODO: check environment variables

PAYLOAD="{\"event_type\": \"issue-center-event\", \"client_payload\": {\"repo\": \"${1}\"}}"

curl -d "$PAYLOAD"                                          \
  -H "Content-Type: application/json"                       \
  -H "Authorization: token ${ISSUE_CENTER_TOKEN}"     \
  -H "Accept: application/vnd.github.everest-preview+json"  \
  "https://api.github.com/repos/${ORG}/${REPO}/dispatches"
