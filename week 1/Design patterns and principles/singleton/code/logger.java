package singleton;
public class logger {
    private static final logger instance = new logger();
    private logger() {
        if (instance != null) {
            throw new RuntimeException("Use getInstance() method");
        }
    }
    public static logger getInstance() {
        return instance;
    }
    public void log(String message) {
        System.out.println("Log: " + message);
    }
}
    