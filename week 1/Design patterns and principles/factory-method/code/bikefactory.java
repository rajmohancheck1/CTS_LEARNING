public class bikefactory extends vehiclefactory {
    public vehicle createVehicle() {
        return new bike();
    }
}
