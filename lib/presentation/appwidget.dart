import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../application/cubit/filter_cubit.dart';
import '../application/cubit/history_cubit.dart';
import 'pages/homepage.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => HistoryCubit(),
                ),
                BlocProvider(
                  create: (context) => FilterCubit(),
                ),
              ],
              child: const HomePage(),
            );
          },
        ));
  }
}
