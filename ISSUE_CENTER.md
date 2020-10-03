# Issue Center

Sometimes projects span over multiple repositories,
or may contain sub-modules, which may not be as visible
as the main project to potential contributor.

This is an effort to address this problem.

## Installing

for each of the repos you want to follow:
  * Create a personnal access token with `repo` scope,
    add it in the repo secrets, as ISSUE_CENTER.

  * Simply create a file like this one in `.github.workflows`
    (don't forget to edit ORG and REPO)

```yml
name: 'issue-center'

on:
  issues:
    types: [opened, reopened, closed]

jobs:
    steps:

    - name: call the other repo
      env:
        GITHUB_TOKEN: ${{ secrets.ISSUE_CENTER }}
        EVENT: issue-center-event
        ORG: fennecdjay
        REPO: issue-center
      run: |
        echo "{\"event_type\": \"${EVENT}\", \"client_payload\": {\"repo\": \"${{ github.repository }}\"}}" > issue_info
        curl -d "@issue_info" -H "Content-Type: application/json" -H "Authorization: token ${{ secrets.BENCHMARK_TOKEN }}" -H "Accept: application/vnd.github.everest-preview+json" "https://api.github.com/repos/${ORG}/${REPO}/dispatches"
```
