import 'package:rental_car/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}