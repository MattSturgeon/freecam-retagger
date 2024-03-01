import dev.mattsturgeon.Versions
import org.junit.jupiter.api.DynamicTest.dynamicTest
import org.junit.jupiter.api.TestFactory
import kotlin.test.assertEquals

class VersionsTest {

    private val expectations = mapOf(
        "1.2.3" to "1.2.3",
        "1.2.2" to "1.2.2-mc1.20",
        "0.4.4.1" to "0.4.4.1-mc1.17",
        "0.2.2" to "0.2.2-mc1.18.1",
    )

    @TestFactory
    fun `Gets correct tag`() = expectations.map { (version, tag) ->
        dynamicTest("tags[$version] == $tag") {
            assertEquals(tag, Versions.tags[version])
        }
    }

    @TestFactory
    fun `Gets correct version`() = expectations.map { (version, tag) ->
        dynamicTest("versions[$tag] == $version") {
            assertEquals(version, Versions.versions[tag])
        }
    }
}