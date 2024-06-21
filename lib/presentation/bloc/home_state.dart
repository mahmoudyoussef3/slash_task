import '../../domain/entities/home_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Map<String, List<HomeEntity>> data;

  HomeLoaded(this.data);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}