#!/bin/sh

PAYLOAD="{\"event_type\": \"${EVENT}\", \"client_payload\": {\"repo\": \"${1}\"}}"

curl -d "$PAYLOAD"                                          \
  -H "Content-Type: application/json"                       \
  -H "Authorization: token ${{ secrets.ISSUE_CENTER }}"     \
  -H "Accept: application/vnd.github.everest-preview+json"  \
  "https://api.github.com/repos/${ORG}/${REPO}/dispatches"
