package dev.mattsturgeon

import com.github.ajalt.clikt.core.CliktCommand
import com.github.ajalt.clikt.parameters.arguments.argument
import com.github.ajalt.clikt.parameters.arguments.help
import com.github.ajalt.clikt.parameters.arguments.optional
import com.github.ajalt.clikt.parameters.options.flag
import com.github.ajalt.clikt.parameters.options.help
import com.github.ajalt.clikt.parameters.options.option
import org.eclipse.jgit.transport.RefSpec
import org.eclipse.jgit.transport.TagOpt
import org.kohsuke.github.GitHubBuilder
import java.lang.Thread.sleep

fun main(args: Array<String>) {
    App.main(args)
}

object App : CliktCommand() {
    private const val DEFAULT_REPO = "https://github.com/MinecraftFreecam/Freecam.git"

    private val token by option("-t", "--token")
        .help("GitHub Personal Access Token")

    private val dryrun by option("--dry-run")
        .help("Don't make any write requests")
        .flag()

    private val all by option("-a", "--all")
        .help("Run all actions")
        .flag()

    private val migrateReleases by option("--migrate-releases", "--retag-releases")
        .help("Migrate releases to new tag format. Has no effect if the new tags don't exist yet.")
        .flag()

    private val createNewTags by option("--create-tags", "--retag-tags")
        .help("Create new tags using the new format.")
        .flag()

    private val pushTags by option("--push-tags")
        .help("Pushes local tags to the remote.")
        .flag()

    private val deleteTags by option("--delete-old-tags")
        .help("Deletes \"old\" format tags from the remote.")
        .flag()

    private val repoArg by argument("repository")
        .help("""Repository URI. Defaults to "$DEFAULT_REPO".""")
        .optional()

    val github by lazy {
        val owner = (repoArg ?: DEFAULT_REPO)
            .split("[:/]".toRegex())
            .dropLast(1)
            .last()

        GitHubBuilder()
            .withOAuthToken(token, owner)
            .build()
    }

    val repo by lazy {
        val parts = (repoArg ?: DEFAULT_REPO).split("[:/]".toRegex())
        assert(parts.size > 1)
        val slug = parts.subList(parts.size - 2, parts.size).joinToString("/").removeSuffix(".git")
        github.getRepository(slug)
    }

    val releases by lazy { repo.listReleases().associateBy { it.tagName } }

    val tags by lazy { repo.listTags().associateBy { it.name } }

    val git by lazy { GitUtil.clone(repoArg ?: DEFAULT_REPO) }

    override fun run() {
        if (all || createNewTags) {
            println("Creating new format tags")
            // TODO consider using GH API to checkout?
            releases.values.forEach { release ->
                git.createNewFormatTag(release)
            }
            println("Done")
        }
        if (all || pushTags) {
            println("Pushing local tags")
            git.push()
                .setDryRun(dryrun)
                .setPushTags()
                .call()
            println("Done")
        }
        if (all || migrateReleases) {
            println("Migrating releases to the new format")
            releases.values.forEach { release ->
                GitHubUtil.migrateReleaseTags(release)
            }
            println("Done")
            println()
        }
        if (all || deleteTags) {
            println("Deleting tags on remote")
            val old = git.listOldTags()

            // Warn
            println("Will delete ${old.size} tags: ")
            old.forEach { println("  - ${it.name}") }

            // Prompt for confirmation
            val quit: Boolean
            while (true) {
                println("Continue? [y/N]:")
                val answer = readlnOrNull()?.lowercase()
                if (answer.isNullOrEmpty() || answer == "n" || answer == "no") {
                    quit = true
                    break
                }
                if (answer == "y" || answer == "yes") {
                    quit = false
                    break
                }
            }

            if (!quit) {
                git.push()
                    .setDryRun(dryrun)
                    .setRefSpecs(old.map {
                        // null source will delete
                        RefSpec().setSource(null).setDestination(it.name)
                    })
                    .call()
                println("Done")
            }
        }
    }

    /**
     * Does action if [dryrun] isn't set. Waits `1000`ms to avoid rate limits.
     *
     * @see doWrite
     */
    fun waitAndDoWrite(action: () -> Unit) {
        if (!dryrun) {
            sleep(1000) // sleep between writes to avoid hitting rate limits
            action()
        }
    }

    /**
     * Does action if [dryrun] isn't set.
     *
     * @see waitAndDoWrite
     */
    fun doWrite(action: () -> Unit) {
        if (!dryrun) {
            action()
        }
    }
}
