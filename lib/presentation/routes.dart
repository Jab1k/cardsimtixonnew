import 'package:cardsnew/application/cubit/history_cubit.dart';
import 'package:cardsnew/presentation/pages/add_card_page.dart';
import 'package:cardsnew/presentation/pages/card_to_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/cubit/filter_cubit.dart';
import 'pages/homepage.dart';

abstract class Routes {
  Routes._();

  static PageRoute goHomepage() {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FilterCubit(),
          ),
          BlocProvider(
            create: (context) => HistoryCubit(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }

  static PageRoute goHisobnitul() {
    return MaterialPageRoute(
      builder: (_) => const Placeholder(),
    );
  }

  static PageRoute goCardsPage() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => FilterCubit(),
        child: MyHomePage(
          title: 'salom',
        ),
      ),
    );
  }

  static PageRoute goCardtoCardPage() {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FilterCubit(),
          ),
          BlocProvider(
            create: (context) => HistoryCubit(),
          ),
        ],
        child: const CardToCard(),
      ),
    );
  }
}
