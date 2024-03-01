package dev.mattsturgeon

import org.eclipse.jgit.api.Git
import org.eclipse.jgit.errors.RepositoryNotFoundException
import org.eclipse.jgit.transport.TagOpt.FETCH_TAGS
import java.io.File

object GitUtil {

    fun clone(uri: String): Git {
        val git = cloneOrOpen(uri)
        git.fetch()
            .setRemoveDeletedRefs(true)
            .setTagOpt(FETCH_TAGS)
            .call()
        return git
    }

    private fun cloneOrOpen(uri:String): Git {
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
            .setURI(uri)
            .setGitDir(repoDir)
            .setCloneAllBranches(true)
            .setTagOption(FETCH_TAGS)
            .setBare(true)
            .call()
    }

}