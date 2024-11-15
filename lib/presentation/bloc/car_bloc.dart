
import 'package:rental_car/domain/usecases/get_cars.dart';
import 'package:rental_car/presentation/bloc/car_event.dart';
import 'package:rental_car/presentation/bloc/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarLoading()) {
    on<LoadCars>((event,emit) async {
      emit(CarLoading());
      try{
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      }catch(e){
        emit(CarsError(e.toString()));
      }
    });
  }
}