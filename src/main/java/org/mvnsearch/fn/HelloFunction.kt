package org.mvnsearch.fn

class HelloFunction {

    fun handleRequest(name: String = "world"): String {
        return "Good morning, $name!"
    }

}