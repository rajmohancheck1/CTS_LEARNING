public class ForecastTest {
    public static void main(String[] args) {
        double initialInvestment = 1000.0;
        double annualGrowthRate = 0.10; // 10% growth per year
        int years = 5;

        double futureValue = FinancialForecast.calculateFutureValue(initialInvestment, annualGrowthRate, years);

        System.out.printf("Future value after %d years: ₹%.2f%n", years, futureValue);
    }
}
