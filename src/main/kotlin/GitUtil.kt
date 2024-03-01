package dev.mattsturgeon

import org.eclipse.jgit.api.Git
import org.eclipse.jgit.errors.MissingObjectException
import org.eclipse.jgit.errors.RepositoryNotFoundException
import org.eclipse.jgit.lib.Constants.typeString
import org.eclipse.jgit.lib.Ref
import org.eclipse.jgit.revwalk.RevCommit
import org.eclipse.jgit.revwalk.RevTag
import org.eclipse.jgit.revwalk.RevWalk
import org.eclipse.jgit.transport.TagOpt.FETCH_TAGS
import org.kohsuke.github.GHRelease
import java.io.File

object GitUtil {

    fun clone(uri: String): Git {
        val git = cloneOrOpen(uri)
        git.fetch()
            .setCredentialsProvider(App.gitCred)
            .setRemoveDeletedRefs(true)
            .setTagOpt(FETCH_TAGS)
            .call()
        return git
    }

    private fun cloneOrOpen(uri: String): Git {
        val repoDir = File("build").resolve(uri.substringAfterLast('/'))
        repoDir.parentFile.mkdirs()

        try {
            return Git.open(repoDir)
        } catch (_: RepositoryNotFoundException) {
            // Ignored
        } catch (e: Exception) {
            // Remove and clone
            repoDir.deleteRecursively()
        }

        return Git.cloneRepository()
            .setCredentialsProvider(App.gitCred)
            .setURI(uri)
            .setGitDir(repoDir)
            .setCloneAllBranches(true)
            .setTagOption(FETCH_TAGS)
            .setBare(true)
            .call()
    }

}

/**
 * Get the commit object referenced by the [ref] string.
 *
 * Will follow annotated tags to the tagged commit
 */
fun Git.getCommit(ref: String): RevCommit? {
    repository.resolve(ref)?.let { objectId ->
        RevWalk(repository).use { walk ->
            try {
                // Get the referenced object
                var obj = walk.parseAny(objectId)

                // Resolve annotated tag objects until we have a commit object
                while (obj is RevTag) {
                    obj = obj.`object`
                }

                // Return the resolved commit
                if (obj is RevCommit) {
                    return obj
                }

                // Found a tree or a blob object, expected a commit
                println("Error: $ref points to a ${typeString(obj.type)}, expected a commit.")
            } catch (_: MissingObjectException) {
                println("Error: $ref is missing")
            }
        }
    }
    return null
}

/**
 * Get the annotated tag referred to by [ref].
 *
 * Lightweight tags will not be resolved by this method, since they do not have a git object.
 *
 * For lightweight tags, you can use [getCommit] to get the commit object.
 */
fun Git.getAnnotatedTag(ref: String): RevTag? {
    repository.resolve(ref)?.let { objectId ->
        RevWalk(repository).use { rw ->
            try {
                val obj = rw.parseAny(objectId)
                if (obj is RevTag) {
                    return obj
                }

                // Could be a lightweight tag, since that'd resolve to a commit object
                println("Error: $ref points to a ${typeString(obj.type)}, expected an annotated tag.")
            } catch (_: MissingObjectException) {
                println("Error: $ref is missing")
            }
        }
    }
    return null
}

fun Git.getAllTags(ref: String): List<Ref> {
    return getCommit(ref)?.let { commit ->
            tagList().call()?.filter { commit.id == (it.peeledObjectId ?: it.objectId) }
        } ?: emptyList()
}

/**
 * Create a new format annotated tag for the given GitHub release.
 *
 * Does nothing if the release is already tagged with the new format. Even if the tag isn't annotated.
 *
 * Does **not** push the tag to the remote.
 *
 * Does **not** update the release to point to the new tag.
 */
fun Git.createNewFormatTag(release: GHRelease) {
    // Turns out GitHub's (dumb) UI has been creating lightweight tags
    // this means there's no useful data on the tag;
    // more specifically a lightweight tag is _just_ a ref and doesn't have its own object
    //
    // We'll have to use release metadata or commit metadata instead

    if (!Versions.isOldFormat(release.tagName)) {
        println("""  - Already new format""")
        // FIXME this won't replace 1.2.3 with an annotated tag
        return // old
    }

    val version = Versions.stripSuffix(release.tagName)
    println("""  - New name will be "$version".""")

    // Get the commit to be tagged
    val commit = getCommit(release.tagName)
        ?: run {
            println("""Error: cannot make new version of "${release.tagName}" - ref does not exist!""")
            return  //throw
        }

    println("""  - Tagging commit "${commit.shortMessage}" (${commit.name.substring(0, 6)}).""")
    println("""  - Committed ${commit.commitTime}""")
    println("""  - Committer ${commit.committerIdent}""")
    println("""  - Author ${commit.authorIdent}""")

    println("""Tagging... $version -m "${release.name}".""")
    App.doWrite {
        tag().apply {
            name = version // Tag name
            objectId = commit // Tag points to commit

            message = "Version $version" // Annotated tag
            tagger = commit.committerIdent // Re-use committer and time info from commit

            setSigned(false) //TODO GPG sign
            setForceUpdate(true) // Overwrite (if run multiple times)
        }.call()
    }
}

fun Git.listOldTags() = tagList().call().filter { Versions.isOldFormat(it.name.substringAfterLast('/')) }
fun Git.listOldTagNames() = listOldTags().map { it.name.substringAfterLast('/') }
