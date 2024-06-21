import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/presentation/bloc/home_cubit.dart';
import 'package:slash_task/presentation/views/bottom_nav_controller.dart';

import 'data/repo/home_repo.dart';
import 'domain/usecases/get_home_data.dart';

void main() {
  runApp(const SlashApp());
}

class SlashApp extends StatelessWidget {
  const SlashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) =>
                HomeBloc(GetHomeData(HomeRepository()))..fetchHomeData(),
            child: const BottomNavController(),
          ),
        );
      },
    );
  }
}
