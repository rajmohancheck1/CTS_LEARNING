public class factorytest {
    public static void main(String[] args) {
        vehiclefactory carFactory = new carfactory();
        vehicle car = carFactory.createVehicle();
        car.start();

        vehiclefactory bikeFactory = new bikefactory();
        vehicle bike = bikeFactory.createVehicle();
        bike.start();
    }
}
