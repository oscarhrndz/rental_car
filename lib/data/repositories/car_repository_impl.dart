import 'package:rental_car/data/models/car.dart';
import 'package:rental_car/domain/repositories/car_repository.dart';
import 'package:rental_car/data/datasources/firebase_car_data_source.dart';

class CarRepositoryImpl implements CarRepository{
  final FirebaseCarDataSource datasource;
  
  CarRepositoryImpl(this.datasource);

  @override
  Future<List<Car>> fetchCars() {
    return datasource.getCars();
  }
}