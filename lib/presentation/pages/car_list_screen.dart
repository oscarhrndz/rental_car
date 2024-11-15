import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_car/data/models/car.dart';
import 'package:rental_car/presentation/bloc/car_bloc.dart';
import 'package:rental_car/presentation/bloc/car_state.dart';
import 'package:rental_car/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(model: 'Fortune GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortune GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortune GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Fortune GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state){
          if(state is CarLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index){
                return CarCard(car: state.cars[index]);
              },
            );
          }
          else if(state is CarsError) {
            return Center(child: Text('error : ${state.message}'),);
          }
          return Container();
        }
      )
    );
  }
}