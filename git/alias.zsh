alias zomg="git add . -A && git reset --hard"
function diff() {
  for file in `git diff origin/master --name-only`;
  do;
    git diff origin/master $file;
  done;
}
