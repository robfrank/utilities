# Command line commands

## Git
### git pull on each subdir
```shell
ls -d ./* | xargs -I {} bash -c "cd '{}' && pwd &&  git pull"
```

### git pull on each subdir if it is a git repo
```shell
ls -d ./*/.git | xargs -I {} dirname {} | xargs -I {} bash -c "cd '{}' && pwd &&  git pull"
```

## Maven
### mvn clean install skipping tests on each subdir
```shell
ls -d ./*/pim.xml | xargs -I {} bash -c "cd '{}' && pwd &&  mvn clean install -DskipTests"
```

## GitHub
### gh approve a PR
```shell
gh pr review --approve <pr_number>
```

### gh add a label to a PR
```shell
gh pr edit --add-label <label> <pr_number>
```

### gh remove a label to a PR
```shell
gh pr edit --remove-label <label> <pr_number>
```

### gh rebase a dependabot pr
```shell
gh pr comment -b "@dependabot rebase" <pr_number>
```

### gh squash and merge
```shell
gh pr merge -s <pr_number>
```