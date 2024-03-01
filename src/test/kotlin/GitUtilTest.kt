import dev.mattsturgeon.GitUtil
import dev.mattsturgeon.getAllTags
import dev.mattsturgeon.getCommit
import org.eclipse.jgit.api.Git
import org.junit.jupiter.api.DynamicTest
import org.junit.jupiter.api.DynamicTest.dynamicTest
import org.junit.jupiter.api.TestFactory
import kotlin.test.*

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

    @TestFactory
    fun `Can get commit`(): List<DynamicTest> {
        val expectations = mapOf(
            "refs/tags/1.2.3" to "74719169ef6e4d8583beb26487da15938c2b4ef8",
            "1.2.0-mc1.20" to "d98db3431fa23b93aa9f626ba6debe72f4b63397",
        )
        return expectations.map { (tag, sha) ->
            dynamicTest("getTag($tag) returns ${sha.substring(0, 6)}") {
                val commit = git.getCommit(tag)
                assertNotNull(commit)
                assertEquals(sha, commit.name)
            }
        }
    }

    @TestFactory
    fun `Lists all tags`(): List<DynamicTest> {
        val expectations = mapOf(
            "74719169ef6e4d8583beb26487da15938c2b4ef8" to listOf(
                "1.2.3", "1.2.3+mc1.16.5", "1.2.3+mc1.17.1", "1.2.3+mc1.18.2", "1.2.3+mc1.19.4"
            ),
            "d98db3431fa23b93aa9f626ba6debe72f4b63397" to listOf(
                "1.2.0-forge-mc1.16",
                "1.2.0-forge-mc1.17",
                "1.2.0-forge-mc1.18",
                "1.2.0-forge-mc1.19",
                "1.2.0-forge-mc1.20",
                "1.2.0-mc1.16",
                "1.2.0-mc1.17",
                "1.2.0-mc1.18",
                "1.2.0-mc1.19",
                "1.2.0-mc1.20",
            ),
        ).mapValues { (_, value) -> value.sorted() }
        return expectations.map { (commit, expectedTags) ->
            dynamicTest("getAllTags(${commit.substring(0, 6)}) returns $expectedTags") {
                val tags = git.getAllTags(commit)

                // Assert tag names all start with refs/tags/
                // and map to a list of simple names
                val tagNames = tags.map {
                    assertEquals("refs/tags", it.name.substringBeforeLast('/'))
                    it.name.substringAfterLast('/')
                }.sorted()

                // Assert tags names end with expected values
                assertEquals(expectedTags, tagNames)
            }
        }
    }
}