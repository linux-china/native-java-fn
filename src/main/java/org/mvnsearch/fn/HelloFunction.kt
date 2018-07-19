package org.mvnsearch.fn

class HelloFunction {

    fun handleRequest(input: String?): String {
        var name = input
        if (name.isNullOrEmpty()) {
            name = "world"
        }
        return "Hello, $name!"
    }

}