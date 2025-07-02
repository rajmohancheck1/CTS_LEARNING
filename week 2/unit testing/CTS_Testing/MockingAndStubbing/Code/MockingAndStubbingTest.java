package com.example;


import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import java.util.List;

public class MockingAndStubbingTest {
    @Test
    void testMockList() {
        List<String> mockList = mock(List.class);
        when(mockList.get(0)).thenReturn("Mocked Value");

        System.out.println(mockList.get(0)); // Should print "Mocked Value"
    }
}
