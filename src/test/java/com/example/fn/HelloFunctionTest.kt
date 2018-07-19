package com.example.fn

import org.junit.Test
import org.mvnsearch.fn.HelloFunction

/**
 * hello function test
 *
 * @author linux_china
 */
class HelloFunctionTest {

    @Test
    fun testHello() {
        println(HelloFunction().handleRequest())
    }
}