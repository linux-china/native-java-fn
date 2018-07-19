package com.example.fn

import org.junit.Test
import org.mvnsearch.fn.HelloFunction
import kotlin.test.assertEquals

/**
 * hello function test
 *
 * @author linux_china
 */
class HelloFunctionTest {

    @Test
    fun testHello() {
        val welcome = HelloFunction().handleRequest()
        assertEquals("Hello, world!", welcome)
    }
}