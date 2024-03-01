import dev.mattsturgeon.GitUtil
import org.eclipse.jgit.api.Git
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals

class GitUtilTest {

    private lateinit var git: Git

    @BeforeTest
    fun clone() {
        git = GitUtil.clone("https://github.com/MinecraftFreecam/Freecam.git")
    }

    @Test
    fun `Can list tags`() {
        val tagNames = git.tagList().call().map {
            it.name
        }
        assertContains(tagNames, "refs/tags/1.2.3")
    }

    @Test
    fun `Can list branches`() {
        val branchNames = git.branchList().call().map {
            it.name
        }
        assertContains(branchNames, "refs/heads/main")
    }
}