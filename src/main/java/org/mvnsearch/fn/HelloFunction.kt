package org.mvnsearch.fn

class HelloFunction {

    fun handleRequest(input: String = "world"): String {
        var name = input
        if (name.isEmpty()) {
            name = "world"
        }
        return "Hello, $name!"
    }

}