public class SearchTest {
    public static void main(String[] args) {
        product[] products = {
            new product(101, "Laptop", "Electronics"),
            new product(203, "Shampoo", "Personal Care"),
            new product(150, "Book", "Stationery"),
            new product(304, "Shoes", "Footwear")
        };

        // Linear Search Test
        int index1 = LinearSearch.search(products, 150);
        System.out.println("Linear Search - Found at index: " + index1);

        // Binary Search Test
        BinarySearch.sortById(products);  // Important: sort first
        int index2 = BinarySearch.search(products, 150);
        System.out.println("Binary Search - Found at index: " + index2);
    }
}
