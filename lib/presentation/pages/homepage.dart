// ignore_for_file: unnecessary_string_interpolations, sort_child_properties_last

import 'package:animated_digit/animated_digit.dart';
import 'package:cardsnew/presentation/companents/onfocus.dart';
import 'package:cardsnew/presentation/routes.dart';
import 'package:cardsnew/presentation/styles/borderradiues.dart';
import 'package:cardsnew/presentation/styles/gradientstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/cubit/filter_cubit.dart';
import '../../application/cubit/history_cubit.dart';
import '../../domains/model/model.dart';
import '../companents/listvewiw.dart';
import '../styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = true;
  CardsModel? cards;
  List icons = [
    Icons.add,
    Icons.payments,
    Icons.north,
    Icons.add_card,
  ];
  List routes = [
    Routes.goHisobnitul(),
    Routes.goCardtoCardPage(),
    Routes.goHisobnitul(),
    Routes.goCardsPage(),
  ];
  List images = [
    'images/Base.png',
    'images/Base1.png',
    'images/Base2.png',
  ];
  List names = [
    "Hisobni To'dirish",
    "Pul o'tqazis.",
    "Hisobni tekshiri..",
    "Karta qo'shish",
  ];
  @override
  void initState() {
    context.read<HistoryCubit>().getAllDatas();
    context.read<FilterCubit>().getAllDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, Filterstate>(
      builder: (context, stat) {
        return BlocBuilder<HistoryCubit, HistoryState>(
          builder: (con, state) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: Text(
                    "${stat.cards?.first.name ?? "SuperHuman"}",
                    style: Style.qopqora(),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                body: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: double.infinity,
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: Borderradiuses.unOltinchi,
                          gradient: Gradients.onStart,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 23, right: 23, top: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, routes[index]);
                                },
                                child: Container(
                                  width: 50,
                                  height: 60,
                                  // ignore: prefer_const_constructors
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        icons[index],
                                        color: Colors.white,
                                      ),
                                      Expanded(
                                        child: Text(
                                          names[index],
                                          style: Style.oppoq(),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    24.verticalSpaceFromWidth,
                    ListviewBuilder(
                      state: state,
                      stat: stat,
                    ),
                  ],
                ));
          },
        );
      },
    );
  }
}
