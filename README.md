# speedup_git

Where to find:
https://github.com/holygeek/git-number

How to configure tool:
```
brew install git-number
```

`git status` - it’s a pain to have to provide this full name each time.

What `git-number` does:

>git-number will number each file and allow you to use just that number in future git commands instead of having to type out the full filename.

With short aliases you can complete commands even more faster (see examples)
Add `.speedup_git.bash` into `.bashrc` like [this](https://github.com/KES777/speedup_git/commit/d1caf949706c085cce46c47c6c3b1f7cd2fd948e#diff-b7cf3e96e1f74fc148d130e98db1c65c7b8eb4f5b668668fa71f26768796a5b0R122)


Examples:

```
gn
gc -b
gd
gn -c cat 1
gdc
gap
gds
gds --staged
gr
git stashs
git stashu
cm
ca
gl
glc
grb/grbc
```

More commands to fix mistakes: https://ohshitgit.com/

Do not merge master into your branch, otherwise you will get weird history.
```
git tree
git fullchanges
git changes
git erb
git prb
```

[A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)
[More about it](https://jeffkreeftmeijer.com/git-flow/)

[Bash completion for git flow](https://github.com/petervanderdoes/git-flow-completion)


[FIXED screenshot](https://github.com/petervanderdoes/gitflow-avh/issues/287#issuecomment-259153469)

[Another description](http://tleyden.github.io/blog/2014/04/09/a-successful-git-branching-model-with-enterprise-support/)
