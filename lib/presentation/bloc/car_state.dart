import 'package:rental_car/data/models/car.dart';

abstract class CarState {}

class CarLoading extends CarState {}

class CarsLoaded extends CarState {
  final List<Car> cars;
  CarsLoaded(this.cars);

}

class CarsError extends CarState {
  final String message;
  CarsError(this.message);
}