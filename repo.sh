# require one argument
if [ $# -lt 1 ]
then
  echo "usage $0 <github_repo>"
  exit 1
fi

# unconditionnaly create directory for owner
mkdir -p "$(dirname $1)"

# list issues of a repo as markdown links
list_issues() {
  curl "https://api.github.com/repos/$1/issues" |
  jq '.[] | "* ["+.title+"]("+.url+")"' |
  tr '"' ' ' # remove double-quotes
}

# write to file
cat << EOF > "${1}.md"
## $1

$(list_issues "$1")
EOF