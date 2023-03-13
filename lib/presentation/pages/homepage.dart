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
    Routes.goHisobnitul(),
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
                endDrawerEnableOpenDragGesture: false,
                backgroundColor: Colors.white,
                drawer: const Drawer(),
                drawerScrimColor: Colors.grey,
                appBar: AppBar(
                  title: Text(
                    "${stat.cards?.first.name ?? "SuperHuman"}",
                    style: Style.qopqora(),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      );
                    },
                  ),
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
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 226, 226),
                          borderRadius: Borderradiuses.onlyTop,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Mening Kartalarim',
                                style: Style.qopqora(),
                              ),
                              24.verticalSpaceFromWidth,
                              context.watch<FilterCubit>().isloading
                                  ? Shimmer(
                                      child: Container(
                                        height: 180,
                                        width: 350,
                                        decoration: Style.addushi(
                                            textColor: Colors.grey),
                                      ),
                                      gradient: Gradients.onStart,
                                    )
                                  : SizedBox(
                                      height: 200,
                                      width: double.infinity.w,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount:
                                            context.watch<FilterCubit>().a,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                child: Container(
                                                  height: 180,
                                                  width: 350,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            images[stat
                                                                    .cards?[
                                                                        index]
                                                                    .imgeindex ??
                                                                0])),
                                                    borderRadius: Borderradiuses
                                                        .unOltinchi,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 16,
                                                        horizontal: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${stat.cards?[index].name ?? "SuperHuman"}',
                                                          style: Style.oppoq(
                                                              size: 20),
                                                        ),
                                                        7.verticalSpaceFromWidth,
                                                        AnimatedDigitWidget(
                                                          valueColors: [
                                                            ValueColor(
                                                                condition: () {
                                                                  return true;
                                                                },
                                                                color: Colors
                                                                    .white)
                                                          ],
                                                          value: int.parse(stat
                                                                  .cards?[index]
                                                                  .number ??
                                                              '1'),
                                                        ),
                                                        20.verticalSpaceFromWidth,
                                                        Text(
                                                          'Balance',
                                                          style: Style.oppoq(
                                                              size: 16),
                                                        ),
                                                        Row(
                                                          children: [
                                                            AnimatedDigitWidget(
                                                              valueColors: [
                                                                ValueColor(
                                                                    condition:
                                                                        () {
                                                                      return true;
                                                                    },
                                                                    color: Colors
                                                                        .white)
                                                              ],
                                                              value: stat
                                                                      .cards?[
                                                                          index]
                                                                      .allcost ??
                                                                  1,
                                                            ),
                                                            const Spacer(),
                                                            Image.asset(
                                                              stat.cards?[index]
                                                                      .type ??
                                                                  'images/visa.png',
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                      ),
                                    ),
                              24.verticalSpaceFromWidth,
                              Text(
                                "Mobile Aloqa Narxini To'lash",
                                style: Style.qopqora(),
                              ),
                              24.verticalSpaceFromWidth,
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: Borderradiuses.unOltinchi,
                                    color: Style.cardscolor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          decoration: Style.textfromfeilds(),
                                        ),
                                      ],
                                    ),
                                  )),
                              24.verticalSpaceFromWidth,
                              Text(
                                "Pul O'tqazmalar Ro'yhati",
                                style: Style.qopqora(),
                              ),
                              16.verticalSpaceFromWidth,
                              context.watch<HistoryCubit>().isloading
                                  ? Shimmer(
                                      child: Container(
                                        width: double.infinity,
                                        height: 65,
                                        decoration: Style.addushi(
                                            textColor: Colors.grey),
                                      ),
                                      gradient: Gradients.onStart,
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.history?.length ?? 0,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 65,
                                              decoration: Style.addushi(),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: Style.dumoloq(
                                                      textColor:
                                                          Colors.transparent,
                                                    ),
                                                    child: Image.asset(
                                                        'images/boy.png'),
                                                  ),
                                                  16.horizontalSpaceRadius,
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      14.verticalSpaceFromWidth,
                                                      state.history?[index].cost
                                                                      .toString()[
                                                                  0] ==
                                                              '-'
                                                          ? Text(
                                                              "${state.history?[index].name}ga Pul O'tqazildi",
                                                              style:
                                                                  Style.qopqora(
                                                                      size: 16),
                                                            )
                                                          : Text(
                                                              "${state.history?[index].name}dan Pul tushdi",
                                                              style:
                                                                  Style.qopqora(
                                                                      size: 16),
                                                            )
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  state.history?[index].cost
                                                              .toString()[0] ==
                                                          '-'
                                                      ? Container(
                                                          width: 80,
                                                          height: 30,
                                                          decoration:
                                                              Style.addushi(
                                                                  // ignore: prefer_const_constructors
                                                                  textColor: Colors
                                                                      .redAccent),
                                                          child: Center(
                                                            child: Text(
                                                              '${state.history?[index].cost}',
                                                              style: Style
                                                                  .textNormSizeLightMode(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Container(
                                                          width: 80,
                                                          height: 30,
                                                          decoration:
                                                              Style.addushi(
                                                                  // ignore: prefer_const_constructors
                                                                  textColor:
                                                                      Colors
                                                                          .green),
                                                          child: Center(
                                                            child: Text(
                                                              '+${state.history?[index].cost}',
                                                              style: Style
                                                                  .textNormSizeLightMode(
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        );
      },
    );
  }
}
