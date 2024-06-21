import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_cubit.dart';
import '../../bloc/home_state.dart';
import '../widgets/home_mobile_layout.dart';
import '../widgets/home_web_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return HomeMobileLayout(data: state.data);
                  } else {
                    return HomeWebLayout(data: state.data);
                  }
                },
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Press button to fetch data'));
            }
          },
        ),
      ),
    );
  }
}
