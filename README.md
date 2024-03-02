# Retagging Freecam

## Contents

- [Requirements](#requirements)
  - [Linux](#linux)
  - [Windows](#windows)
  - [GPG](#gpg)
- [Usage](#usage)
  - [Enable GPG signing](#enable-gpg-signing)
  - [Working Directory](#working-directory)
  - [Create new tags](#create-new-tags)
  - [Push the new tags](#push-the-new-tags)
  - [Migrate the releases](#migrate-the-releases)
  - [Delete the old tags](#delete-the-old-tags)

## Requirements

- Bash
- Git
- GitHub CLI

`git` and `gh` should be available on your `PATH` environment variable.

**Optionally** have GPG/PGP setup and enabled in git & GitHub.

### Linux

Essentially all linux distros include `bash` out-of-the box. Many include `git` too, however all will have `git` available in the distro's repositories.

Most will also have GitHub's CLI available in repositories too.

### Windows

#### Git & Bash

[Git for Windows](https://gitforwindows.org) includes a "Git Bash" (based on msys2 & mingw), with `git` and many coreutils available on the `PATH`.
Git for Windows is an SDK that includes the [windows build](https://git-scm.com/download/win) of `git` along with other useful tools such as Git Bash, Git GUI, Git Credentials Manager, etc.

#### GitHub CLI

If you use a Windows package manager, [see the `gh` README](https://github.com/cli/cli/blob/trunk/README.md#windows).
Otherwise download the MSI Installer from their [Releases]](https://github.com/cli/cli/releases/latest).

Once installed refer to the [gettign started guide](https://cli.github.com/manual/#configuration), in particular run [ `gh authlogin`](https://cli.github.com/manual/gh_auth_login).

You'll also need to set the "default repo" to `"MinecraftFreecam/Freecam"` in your local repo.

#### `PATH`

The installation process should offer to add things to your `PATH`. If this fails and anything ends up missing from your `PATH`,
see [one of many guides](https://www.java.com/en/download/help/path.html) on editing the Windows user `PATH`.

### GPG

_**TODO**_

## Usage

There are a number of scripts included, each one does a distinct task and therefore should be used in order, checking they have worked correctly before continuing.

### Enable GPG signing

If you want git to default to signing commits, run `git config --global commit.gpgsign true`. This won't effect these scripts since none of them create new commits.

If you want git to default to signing tags, run `git config --global tag.gpgsign true`. The `create-tags.sh` script will offer to do this for you.

Note on credentials: if your GPG key has a passphrase and you don't have a PGP credentials manager setup, signing stuff will be frustrating as you'll need to enter your passphrase every time!

### Working Directory

The scripts assume they are being run from the Freecam git repo and that GitHub is setup as a remote named `origin`. To access the scripts from Freecam's repo you could do any of the following:

- Clone this as a sibling and use `../<retagger-repo>/<script-name>.sh`
- Clone this to `$HOME` and use `~/<retagger-repo>/<script-name>.sh`
- Copy these scripts into your Freecam repo and use `./<script-name>.sh` (just make sure not to stage them for commit)
- Add this repo to your `PATH` and use `<script-name>.sh` (then remove from `PATH` when done)

### Create new tags
The first step is to create the new tags. `create_tags.sh` will create 47 new tags, in the format `v1.2.3`, each backdated to when the version was _released_.

Can be re-run and will re-create new-format tags.

```shell
./create_tags.sh
```

#### Sanity checks
You can get a full list of tags (including the 184 old ones) using `git tag --list`:

You should have 47 tags starting with `"v"`:

```shell
$ git tag --list | grep -e "^v" | wc --lines
47

$ git tag --list | grep -e "^v"
v0.2.2
v0.2.3
v0.2.4
v0.2.5
v0.3
v0.3.1
v0.3.2
v0.3.3
v0.3.4
v0.3.5
v0.4.0
v0.4.1
v0.4.2
v0.4.3
v0.4.4
v0.4.4.1
v0.4.5
v0.4.6
v0.4.7
v0.4.8
v0.4.9
v1.0.0
v1.0.1
v1.0.2
v1.0.3
v1.0.4
v1.0.5
v1.0.6
v1.0.7
v1.0.8
v1.0.9
v1.1.0
v1.1.1
v1.1.10
v1.1.2
v1.1.3
v1.1.4
v1.1.5
v1.1.6
v1.1.7
v1.1.8
v1.1.9
v1.2.0
v1.2.1
v1.2.1.1
v1.2.2
v1.2.3
```

You should be able to run `git show --no-patch --show-signature <tag>` for any of the new-format tags and see something like this:

_Note:_ you'll only have a PGP signature if you signed your tags. If it's missing you can re-run `create_tags.sh` after correcting your GPG setup.

```shell
$ git show --no-patch --show-signature v1.2.3
tag v1.2.3
Tagger: hashalite <hashalite@gmail.com>
Date:   Mon Feb 5 02:26:10 2024 +0000

Version 1.2.3
-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEcIIi6hgI45qDrIsYT5GETO0agpkFAmXjHSoACgkQT5GETO0a
gpnyHQ//ZN8pDO2dg0wDJ7+FPr9oNneXJpf3WaoywIB50s2fY6pow8CvJmjvp3yD
Z90nxpbh38JOl9N71jbY+kupNCc8lhg5rH+pM3cVpH0nfzVHkbp7j/O1mixsSLR5
TMNoOJFuj7uopuseniplVnNhUfTuD9BlEn/PjlNqpETAjPjkfA6RESOUgyhAANqI
tag v1.2.3
Tagger: hashalite <hashalite@gmail.com>
Date:   Mon Feb 5 02:26:10 2024 +0000

Version 1.2.3
-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEcIIi6hgI45qDrIsYT5GETO0agpkFAmXjHSoACgkQT5GETO0a
gpnyHQ//ZN8pDO2dg0wDJ7+FPr9oNneXJpf3WaoywIB50s2fY6pow8CvJmjvp3yD
Z90nxpbh38JOl9N71jbY+kupNCc8lhg5rH+pM3cVpH0nfzVHkbp7j/O1mixsSLR5
TMNoOJFuj7uopuseniplVnNhUfTuD9BlEn/PjlNqpETAjPjkfA6RESOUgyhAANqI
bIjvV9sWcl3ysvLmD1jc8N8HZGDtwg74U2M9nSoOgA4Ku0Jc5Z6tI3sWgFgPHZPv
zu3bDF1XeYabF0FSiW2VOM5rq+b76NAZUdc5mXg453aFfB3F9YwPSxOsjMF+k9VO
o/Y6fdnN1Ucciai5S+9OonL04tXjbJD3/S01VZgdwieTTr3Th11WUAnAXVI4t4kb
EurokuvwdOWtl6BYsIE40k0iHus/wbmalNXobftnxkNWDrFrWbGB/Oo0l+Z6y4Ca
5YsXgy7CdVYvbIQro4xTr0fZOczHOxqVyyjM9PYG+thC5hlf/9GNx+0mCh9FcDag
zzT+ZzoL34+5n2dAaccHHs3QVRKaa0AvwP2M7o1Wnq6Q26I+iCyE5gdFb0LUu+D3
L6qavanLcPWOzd3qthGNtSS7vPDUvNzH0uGA0nqwrCR0mBPA7Kuc32TUt+C50fYP
Vp+UVjmLxb/a2HTtAh1DeEoNLZmSfoBek4n3BIdY8LJiEwzJrD8=
=sUrt
-----END PGP SIGNATURE-----

commit 74719169ef6e4d8583beb26487da15938c2b4ef8 (tag: v1.2.3, tag: 1.2.3+mc1.19.4, tag: 1.2.3+mc1.18.2, tag: 1.2.3+mc1.17.1, tag: 1.2.3+mc1.16.5, tag: 1.2.3)
Author: hashalite <hashalite@gmail.com>
Date:   Sun Feb 4 21:26:10 2024 -0500

    Bump version and patch changelog
```

Note how the tag date broardly matches the commit date\*. Note the PGP signature. Note the commit still shows the old-format tags in addition to the new one.

You should spot check a few tags before continuing.

_\* The tag date is actually taken from the GH Release's date, I could've used the commit date but I felt this made more sense..._

### Push the new tags
Once created (and verified locally), push the new tags up to GitHub. `push_new_tags.sh` will push the new tags using a single `git push` command (and a lot of escaped linebreaks lol).

```shell
./push_new_tags.sh
```

#### Sanity checks
Browsing GitHub, the new tags should be shown with the appropriate "created at" date. If you signed them, they should also have a green checkmark ✅.

![image](https://github.com/MattSturgeon/freecam-retagger/assets/5046562/b870a603-7d9d-4ed9-907a-cfba0cbf4eca)

### Migrate the releases

This step uses the GitHub CLI to update all of the releases. This will run 56 commands, one at a time, and sleep for one second after each (to avoid hitting ratelimits).
I'll be the slowest step, probably taking around one or two minutes.

```shell
./update_release_tags.sh
```

#### Sanity checks

You can check releases using `gh release list`, you should see something like:

```shell
$ gh releases list --limit 50
TITLE            TYPE    TAG NAME  PUBLISHED          
Freecam 1.2.3    Latest  v1.2.3    about 26 days ago
Freecam 1.2.2            v1.2.2    about 2 months ago
Freecam 1.2.1.1          v1.2.1.1  about 4 months ago
Freecam 1.2.1            v1.2.1    about 7 months ago
Freecam 1.2.0            v1.2.0    about 8 months ago
Freecam 1.1.10           v1.1.10   about 8 months ago
Freecam 1.1.9            v1.1.9    about 11 months ago
Freecam 1.1.8            v1.1.8    about 1 year ago
Freecam 1.1.7            v1.1.7    about 1 year ago
Freecam 1.1.6            v1.1.6    about 1 year ago
Freecam 1.1.5            v1.1.5    about 1 year ago
Freecam 1.1.4            v1.1.4    about 1 year ago
Freecam 1.1.3            v1.1.3    about 1 year ago
Freecam 1.1.2            v1.1.2    about 1 year ago
Freecam 1.1.1            v1.1.1    about 1 year ago
Freecam 1.1.0            v1.1.0    about 1 year ago
Freecam 1.0.9            v1.0.9    about 1 year ago
Freecam 1.0.8            v1.0.8    about 1 year ago
Freecam 1.0.7            v1.0.7    about 1 year ago
Freecam 1.0.6            v1.0.6    about 1 year ago
Freecam 1.0.5            v1.0.5    about 1 year ago
Freecam 1.0.4            v1.0.4    about 1 year ago
Freecam 1.0.3            v1.0.3    about 1 year ago
Freecam 1.0.2            v1.0.2    about 1 year ago
Freecam 1.0.1            v1.0.1    about 1 year ago
Freecam 1.0.0            v1.0.0    about 1 year ago
Freecam 0.4.9            v0.4.9    about 1 year ago
Freecam 0.4.8            v0.4.8    about 2 years ago
Freecam 0.4.7            v0.4.7    about 2 years ago
Freecam 0.4.6            v0.4.6    about 2 years ago
Freecam 0.4.5            v0.4.5    about 2 years ago
Freecam 0.4.4.1          v0.4.4.1  about 2 years ago
Freecam 0.4.4            v0.4.4    about 2 years ago
Freecam 0.4.3            v0.4.3    about 2 years ago
Freecam 0.4.2            v0.4.2    about 2 years ago
Freecam 0.4.1            v0.4.1    about 2 years ago
Freecam 0.4.0            v0.4.0    about 2 years ago
Freecam 0.3.5            v0.3.5    about 2 years ago
Freecam 0.3.4            v0.3.4    about 2 years ago
Freecam 0.3.3            v0.3.3    about 2 years ago
Freecam 0.3.2            v0.3.2    about 2 years ago
Freecam 0.3.1            v0.3.1    about 2 years ago
Freecam 0.3              v0.3      about 2 years ago
Freecam 0.2.5            v0.2.5    about 2 years ago
Freecam 0.2.4            v0.2.4    about 2 years ago
Freecam 0.2.3            v0.2.3    about 2 years ago
Freecam 0.2.2            v0.2.2    about 2 years ago
```

If something went wrong (e.g. ratelimit), you'll have to manually edit `update_release_tags.sh` and **remove lines** related to successfully migrated releases before running again.

As an alternative, you can use the Kotlin retagger I wrote; that tool filters for un-migrated releases automatically and only updates the releases that are still using old-format tags.
This is available in the `kotlin` branch.

### Delete the old tags

This step is **optional**, and should only be done once you're sure everything has gone to plan so far.

The  `delete_old_tags.sh` script will delete 194 tags from GitHub using a single `git push` command. You _may_ need to disable any tag-protection rules configured in your repo settings for this to work.
The command explicitly lists the tags to delete, so it should be safe assuming all releases have been successfully migrated to new tags.

**DO NOT** run this until all releases are fully migrated to new-format tags.
```shell
./delete_old_tags.sh
```

If you also want to delete your local tags, you can run the following:
```shell
./delete_old_tags_local.sh
```

If you'd rather ensure you don't have _any_ tags that aren't pushed to GitHub, you can do:
```shell
git tag --delete --all
git fetch --tags origin
```

Deleting your local copy of the old tags is _even more_ optional, since (other than forks) they are the only backup of the old tags.

