package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class AssertionsTest {
    @Test
    void checkAssertions() {
        assertEquals(4, 2 + 2);
        assertTrue(5 > 1);
        assertFalse(3 > 5);
        assertNotNull("Hello");
    }
}
