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
ls -d ./*/pom.xml | xargs -I {} bash -c "cd '{}' && pwd &&  mvn clean install -DskipTests"
```

## GitHub

### gh approve a PR

```shell
gh pr review --approve <pr_number>
```

### gh approve multiple PRs

```shell
./approve-pr.sh <pr_number_1> <pr_number_2> <pr_number_3>
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

### gh rebase multiple dependabot prs

```shell
./dependanbot-rebase.sh <pr_number_1> <pr_number_2> <pr_number_3>
```

### gh squash and merge

```shell
gh pr merge -s <pr_number>
```

### gh squash and merge multiple prs

```shell
./squash_merge.sh <pr_number_1> <pr_number_2> <pr_number_3>
```

### gh squash and merge list of approved prs

```shell
./squash_merge.sh $(gh pr list --json number --label "dependency_approved" | jq -r '[.[].number] | join(" ")')
```

### approve all the Dependabot's PRs

```shell
 gh pr list  -A app/dependabot  --json number,state,title,url --jq '.[] | select(.state=="OPEN") | .number' | xargs -I {} ./approve-pr.sh {}
```
