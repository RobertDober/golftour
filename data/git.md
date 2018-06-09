
# Resetting Git Repo to a certain Commit and Replaying Changes

## Problem

* We have a branch `new` which is completely intermingled with the commit history of upstream merges from branch `dev`.
* We want to have the branches history (possibly leaned out on top of the rest).


## Solution

### Create a delta between `work` and `new` with an upstream history
1. `git fetch upstream dev; gco FETCH_HEAD -b work # One day I will find a way to do this with one git command`
1. `git merge --squash new                         # No commits, working tree is updated but not the index/staging area ???`
1. `git reset                                      # index/staging are too. I can see delta with git diff and git stash \o/`

### Adding things back

1. Repeat adding changes and committing them until `git diff work` is empty.
1. `gco work; git reset --hard work                # --hard is not needed if both branches are clean`


### A Simple Variation on a Theme

Sometimes everything is already in your branch and you want to reorganize, simply identify the commit in question, and...

1. git checkout -b work
1. git checkout &lt;your branch>
1. git reset &lt;the commit in question> # remove all work from index but leave in working dir and reset HEAD to the commit

Join _Adding things back_ above.

