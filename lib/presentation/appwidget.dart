import 'package:cardsnew/presentation/pages/nointernet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
        home: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, data) {
              print(data.data);
              if (data.data == ConnectivityResult.mobile ||
                  data.data == ConnectivityResult.wifi) {
                return ScreenUtilInit(
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
                );
              } else {
                return const NoInternetPage();
              }
            }));
  }
}

abstract class AppConnectivity {
  AppConnectivity._();

  static Future<bool> connectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

// static showNoConnectionSnackBar(BuildContext context) {
//   ScaffoldMessenger.of(context).hideCurrentSnackBar();
//   final snackBar = SnackBar(
//     backgroundColor: Style.brandGreen,
//     behavior: SnackBarBehavior.floating,
//     duration: const Duration(seconds: 3),
//     content: Text(
//       'No internet connection',
//       style: Style.interNoSemi(
//         size: 14,
//         color: Style.white,
//       ),
//     ),
//     action: SnackBarAction(
//       label: 'Close',
//       disabledTextColor: Style.black,
//       textColor: Style.black,
//       onPressed: () {
//         ScaffoldMessenger.of(context).hideCurrentSnackBar();
//       },
//     ),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }