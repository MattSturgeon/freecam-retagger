# Freecam Re-Tagger

Single use tool to re-tag [Freecam]'s releases

Most functionality has been moved to the `shell` branch. This branch should only be used if you prefer the kotlin implementation of `--migrate-releases`.

## Kotlin app

The kotlin app was used to generate the above initial commands, but its equivalent commands are implemented differently, using `JGit` and java bindings for GitHub's API.

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
