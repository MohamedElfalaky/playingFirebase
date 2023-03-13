part of 'add_car_cubit.dart';

@immutable
abstract class AddCarState {}

class AddCarInitial extends AddCarState {}

class AddCarLoading extends AddCarState {}

class AddCarSuccess extends AddCarState {}

class AddCarError extends AddCarState {
  final err;
  AddCarError({required this.err});
}
