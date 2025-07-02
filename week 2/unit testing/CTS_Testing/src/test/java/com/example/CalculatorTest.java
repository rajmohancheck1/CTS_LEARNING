package com.example;

import org.testng.annotations.Test;
import static org.junit.jupiter.api.Assertions.*;

public class    CalculatorTest {

    @Test
    void testAddition() {
        Calculator calc = new Calculator();
        assertEquals(10, calc.add(4, 6), "Addition should return correct sum");
    }

    @Test
    void testIsEvenTrue() {
        Calculator calc = new Calculator();
        assertTrue(calc.isEven(4), "4 is even");
    }

    @Test
    void testIsEvenFalse() {
        Calculator calc = new Calculator();
        assertFalse(calc.isEven(3), "3 is not even");
    }
}
