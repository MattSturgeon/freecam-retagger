package dev.mattsturgeon

import com.github.ajalt.clikt.core.CliktCommand
import com.github.ajalt.clikt.parameters.arguments.*
import com.github.ajalt.clikt.parameters.options.flag
import com.github.ajalt.clikt.parameters.options.help
import com.github.ajalt.clikt.parameters.options.option
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

    private val repoArg by argument("repository")
        .help("""Repository URI. Defaults to "$DEFAULT_REPO".""")
        .optional()
        .validate { path ->
            val count = path.count { it == '/' }
            if (count != 1) {
                fail("Repository name must be in format owner/repo")
            }
        }

    private val repo by lazy { repoArg ?: DEFAULT_REPO }
    private val owner by lazy { repo.split("[:/]".toRegex()).dropLast(1).last() }

    override fun run() {

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
