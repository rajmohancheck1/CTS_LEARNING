import java.util.Arrays;
import java.util.Comparator;

public class BinarySearch {
    public static int search(product[] products, int targetId) {
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = (left + right) / 2;
            int midId = products[mid].getProductId();

            if (midId == targetId) return mid;
            else if (midId < targetId) left = mid + 1;
            else right = mid - 1;
        }

        return -1;
    }

    public static void sortById(product[] products) {
        Arrays.sort(products, Comparator.comparingInt(product::getProductId));
    }
}
