import dev.mattsturgeon.Versions
import org.junit.jupiter.api.DynamicTest
import org.junit.jupiter.api.DynamicTest.dynamicTest
import org.junit.jupiter.api.TestFactory
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class VersionsTest {

    private val expectations = mapOf(
        "1.2.3" to "1.2.3",
        "1.2.2" to "1.2.2-mc1.20",
        "0.4.4.1" to "0.4.4.1-mc1.17",
        "0.2.2" to "0.2.2-mc1.18.1",
    )

    private val extras = mapOf(
        "1.9.4" to "1.9.4-blahblah9",
        "6.gg.4" to "6.gg.4-1.2.3456",
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

    @TestFactory
    fun `Strip tag suffix`(): List<DynamicTest> {
        return (expectations + extras).map { (version, tag) ->
            dynamicTest("stripSuffix($tag) == $version") {
                assertEquals(version, Versions.stripSuffix(tag))
            }
        }
    }

    @TestFactory
    fun `Re-format correctly`(): List<DynamicTest> {
        return (expectations + extras).map { (version, tag) ->
            dynamicTest("toNewFormat($tag) == v$version") {
                assertEquals("v$version", Versions.toNewFormat(tag))
            }
        }
    }

    @TestFactory
    fun `Identify old format`(): List<DynamicTest> {
        return (expectations + extras).map { (_, tag) ->
            dynamicTest("isOldFormat($tag) is true") {
                assertTrue(Versions.isOldFormat(tag))
            }
        }
    }

    @TestFactory
    fun `Identify new format`(): List<DynamicTest> {
        return (expectations + extras).map { (version, _) ->
            "v$version"
        }.map { version ->
            dynamicTest("isOldFormat($version) is false") {
                assertFalse(Versions.isOldFormat(version))
            }
        }
    }
}