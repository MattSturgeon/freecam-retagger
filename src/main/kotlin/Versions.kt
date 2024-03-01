package dev.mattsturgeon

object Versions {
    /**
     * A map of `version` to `tag`
     */
    val tags by lazy {
        val file = resource("old_tags.properties")!!
        decodeProperties(file.reader())
    }

    /**
     * A map of `tag` to `version`
     */
    val versions by lazy {
        tags.asSequence().associate { (version, tag) ->
            tag to version
        }
    }

    /**
     * Remove the suffix part of an old-format tag
     */
    fun stripSuffix(tag: String) = tag.substringBefore('-')

    /**
     * Identify old vs new format tags
     */
    fun isOldFormat(tag: String) = "" != tag.substringAfter('-', "")
}