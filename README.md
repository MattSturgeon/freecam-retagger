# Freecam Re-Tagger

Single use tool to re-tag [Freecam]'s releases

## Shell commands

In addition to the java app, some shell scripts have been generated too.

These may work better since they use the normal `git` command rather than `JGit` (and my dodgy code).

They assume you have `git`, `gh`, & `sleep` on your `PATH`.
They are formatted as shell scripts, but since they're basically just a list of commands it should be simple to reformat them as batch files if needed.

**Important**: Shell scripts do not have a dry-run option. Make sure you read what they will do before running them!!  
You should probably read the kotlin too if you plan on running that...

First create tags using one of
- `create_tags_signed.sh` create signed tags with the `1.2.3` format. Note: `1.2.3` is not replaced even though the current tag isn't signed...
- `create_tags_unsigned.sh` creates unsigned tags with the `1.2.3` format.
- `create_v_tags_signed.sh` creates signed tags with the `v1.2.3` format.
- `create_v_tags_unsigned.sh` creates unsigned tags with the `v1.2.3` format.

Next push tags. This [pushes _all_ tags you have locally](https://git-scm.com/docs/git-push#Documentation/git-push.txt---tags).

```shell
git push origin --tags
```

Now, update the GH Releases to use the new tags. If you have `gh` installed, run one of:
Otherwise, you can run the kotlin app with `--migrate-releases` and `--token <pa-token>`.

- `update_release_tags.sh` update releases to use the new `1.2.3` format.
- `update_release_tags_v.sh` update releases to use the new `v1.2.3` format.

Finally, run one of these to remove the old tags:
- `delete_all_old_tags_remote.sh` deletes all "old" tags on the remote, including `1.2.3`
- `delete_old_fmt_tags_remote.sh` deletes all `-mc` style tags on the remote

If you really want to, you can also remove tags locally.
This might be useful so that you can run `git push origin --tags` without pushing them up again, however you probably shouldn't rush into deleting stuff until we're sure things have migrated correctly.
Pushing [with `--tags`](https://git-scm.com/docs/git-push#Documentation/git-push.txt---tags) probably isn't good practice either, since sometimes you create tags locally to refer to non-release commits.

- `delete_all_old_tags_local.sh` deletes locally (don't rush into this, backups are good)
- `delete_old_fmt_tags_local.sh` deletes locally (don't rush into this, backups are good)

## Kotlin app

The kotlin app was used to generate the above commands, but its equivalent commands are implemented differently, using `JGit` and java bindings for GitHub's API.

The current implementation is setup to target non-`v`-prefixed tags, while the shell commands have options for either format.

Some commands are more fleshed out than others. The `--migrate-releases` command in particular should be good to go, and may be easier to run than the `gh`-based shell script.


### Commands
- `--all` runs all the commands below in the appropriate order. You probably don't want this while the tool is half-finished.
- `--create-tags` will create "new format" tags in `build/Freecam.git`. Tested ok,
  - doesn't sign commits yet...
  - Probably clunkier than using the shell scripts
- `--migrate-releases` will update all releases to point to the new format. Tested ok
  - May be worth using if you don't have `gh` installed on your `PATH`, but you'll still need to provide a PA Token via `--token`.
  - Only implemented non-`v`-prefixed tags for now, but easy to modify.
- `--push-tags` is supposed to push created tags
  - not fully tested/working yet. Better off using shell scripts above.
- `--delete-tags` is supposed to delete old tags
  - not fully tested/working yet. Better off using shell scripts above.

### Options
- `--dry-run` do not do destructive actions or modify the actual remote
- `--token` GitHub personal access token with write access to the repo
