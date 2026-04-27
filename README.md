# git_tools

A family of ksh scripts to automate common git operations from the command line.
Written and maintained by [Steve Price](mailto:SuperStevePrice@gmail.com) (SuperStevePrice).

All scripts are written for **ksh (Korn Shell)** and tested on macOS and Linux.

---

## Scripts

### git_clone.ksh
Clone a GitHub repository to the local machine.

**Usage:**
```
git_clone.ksh repository
```

**Notes:**
- Clones into `~/Projects/<repository>`
- If the target directory already exists, it is backed up to `<repository>.backup` before cloning
- Requires SSH key authentication to GitHub

---

### git_config.ksh
Set global git user name, email, and editor.

**Usage:**
```
git_config.ksh [username email]
```

**Notes:**
- If no arguments are provided, defaults to `SuperStevePrice` and `SuperStevePrice@gmail.com`
- Sets `core.editor` to `vim`
- Run this once per machine after a fresh git install

---

### git_mail.ksh
Set global git user name, email, and editor — with verbose command echo.

**Usage:**
```
git_mail.ksh [username email]
```

**Notes:**
- Functionally identical to `git_config.ksh`
- Prints each git command before executing it, useful for debugging or learning
- If no arguments are provided, defaults to `SuperStevePrice` and `SuperStevePrice@gmail.com`

---

### git_merge.ksh
Merge a branch into the main branch and push to remote.

**Usage:**
```
git_merge.ksh git_repository branch_name
```

**Notes:**
- Automatically detects whether the main branch is named `main` or `master`
- Checks out the main branch, merges the named branch, commits, and pushes
- Handles fast-forward merges gracefully (nothing to commit is not treated as an error)

---

### git_new.ksh
Initialize a new local directory as a GitHub repository and push the initial commit.

**Usage:**
```
git_new.ksh repository
```

**Notes:**
- The local directory `~/Projects/<repository>` must already exist and contain files
- Prompts for confirmation before staging files with `git add .`
- Automatically detects the default branch name
- Adds the remote origin and pushes with `-u` to set upstream tracking

---

### git_pull.ksh
Pull the latest changes from GitHub to a local repository.

**Usage:**
```
git_pull
```

**Notes:**
- Prompts interactively for the repository name
- Checks for the presence of a `.git` directory before attempting to pull
- If the directory exists but has no `.git`, exits with a clear error message
- If the directory does not exist, directs the user to use `git_clone.ksh` first

---

### git_push.ksh
Stage, commit, and push changes to GitHub.

**Usage:**
```
git_push
```

**Notes:**
- Prompts interactively for the repository name and commit message
- Shows a short status of files to be staged before proceeding
- Prompts for confirmation before running `git add .`
- Handles the case where there is nothing to commit gracefully — push still proceeds
- Runs `git status` after push to confirm clean working tree

---

## SSH Authentication

All scripts use SSH key authentication. Before using any script, verify your
SSH key is registered with GitHub:

```
ssh -T git@github.com
```

Expected response:
```
Hi SuperStevePrice! You've successfully authenticated, but GitHub does not provide shell access.
```

If authentication fails, add your public key to GitHub under:
**Settings → SSH and GPG keys → New SSH key**

Each machine requires its own SSH key registered separately.

To copy your public key:
```
cat ~/.ssh/id_rsa.pub
```

---

## Quick Reference

Raw git commands used by these scripts:

```
git add .
git checkout -b <branch>
git clone git@github.com:SuperStevePrice/<repo>.git ~/<repo>
git commit -m "<message>"
git init
git ls-remote git@github.com:SuperStevePrice/<repo>.git
git push
git push -u origin main
git push -u origin <branch>
git remote set-url origin git@github.com:SuperStevePrice/<repo>.git
git status
ssh -T git@github.com
```

---

## Installation

These scripts are also part of the
[ShellSetup](https://github.com/SuperStevePrice/ShellSetup) project,
which provides a full Unix/Linux shell environment setup including installation
and permission management via `setup.ksh`.

To use standalone, copy the desired scripts to a directory in your `$PATH` and
make them executable:

```
cp git_*.ksh ~/bin/
chmod 755 ~/bin/git_*.ksh
```

Create symlinks for convenience:
```
ln -s ~/bin/git_clone.ksh  ~/bin/git_clone
ln -s ~/bin/git_config.ksh ~/bin/git_config
ln -s ~/bin/git_mail.ksh   ~/bin/git_mail
ln -s ~/bin/git_merge.ksh  ~/bin/git_merge
ln -s ~/bin/git_new.ksh    ~/bin/git_new
ln -s ~/bin/git_pull.ksh   ~/bin/git_pull
ln -s ~/bin/git_push.ksh   ~/bin/git_push
```

---

## License

GNU General Public License v3.0 — see [LICENSE](LICENSE) for details.
