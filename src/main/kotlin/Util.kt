package dev.mattsturgeon

import java.io.File
import java.io.Reader
import java.net.URLClassLoader
import java.util.Properties

/**
 * @return a [File] pointing to the specified resource file, or `null`.
 */
fun resource(path: String): File? = URLClassLoader.getSystemResource(path)?.run { File(toURI()) }

/**
 * Decode a [Properties] file to a [Map]
 */
fun decodeProperties(reader: Reader): Map<String, String> {
    val props = Properties()
    props.load(reader)
    return props.asSequence().associate { (key, value) ->
        key.toString() to value.toString()
    }
}