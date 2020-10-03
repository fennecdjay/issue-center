show_repo() {
  for issue in "$1"/*.md
  do cat "$issue"
  done
}

show_repos() {
  for owner in */
  do show_repo "$owner"
  done
}

cat << EOF > README.md
# Issue Center

This is repository to centralize issues related to a project.
For more information, please read [ISSUE_CENTER.md](ISSUE_CENTER.md).  

Following is the list of issues by repo.  

$(show_repos)
EOF
