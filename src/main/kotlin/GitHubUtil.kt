package dev.mattsturgeon

import org.kohsuke.github.GHRelease

object GitHubUtil {

    fun migrateReleaseTags(release: GHRelease) {
        val old = release.tagName
        val new = Versions.toNewFormat(old)

        if (old == new) {
            println("""Ignoring already migrated release "$old".""")
            return
        }

        println("""Release has has old format tag "$old". Migrating to "$new".""")

        // Sanity check before doing anything
        if (!App.tags.containsKey(new)) {
            println("""Error: new tag "$new" does not exist on remote yet!""")
            return
        }

        println("""  - Updating release...""")
        App.waitAndDoWrite {
            release.update().tag(new).update()
        }
    }
}