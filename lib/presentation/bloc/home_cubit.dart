import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_home_data.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetHomeData getHomeData;

  HomeBloc(this.getHomeData) : super(HomeInitial());

  Future<void> fetchHomeData() async {
    try {
      emit(HomeLoading());
      final data = await getHomeData();
      emit(HomeLoaded(data));
    } catch (_) {
      emit(HomeError("Failed to fetch data"));
    }
  }
}