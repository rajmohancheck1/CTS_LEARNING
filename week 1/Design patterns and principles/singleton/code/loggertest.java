package singleton;
public class loggertest {
    public static void main(String[] args) {
        logger logger1 = logger.getInstance();
        logger logger2 = logger.getInstance();

        logger1.log("First message");
        logger2.log("Second message");

        System.out.println("Same instance? " + (logger1 == logger2));
    }
}
