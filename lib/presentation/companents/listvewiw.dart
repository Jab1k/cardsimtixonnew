// ignore_for_file: sort_child_properties_last

import 'package:animated_digit/animated_digit.dart';
import 'package:cardsnew/application/cubit/filter_cubit.dart';
import 'package:cardsnew/application/cubit/history_cubit.dart';
import 'package:cardsnew/presentation/companents/newcom.dart';
import 'package:cardsnew/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../styles/borderradiues.dart';
import '../styles/colors.dart';
import '../styles/gradientstyle.dart';

class ListviewBuilder extends StatelessWidget {
  final Filterstate stat;
  final HistoryState state;

  List images = [
    'images/Base.png',
    'images/Base1.png',
    'images/Base2.png',
  ];

  ListviewBuilder({super.key, required this.stat, required this.state});

  @override
  Widget build(BuildContext context) {
    print(stat.cards?.first.name);
    return Expanded(
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
                        decoration: Style.addushi(textColor: Colors.grey),
                      ),
                      gradient: Gradients.onStart,
                    )
                  : SizedBox(
                      height: 200,
                      width: double.infinity.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: context.watch<FilterCubit>().a,
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Container(
                              height: 180,
                              width: 350,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(images[
                                        stat.cards?[index].imgeindex ?? 0])),
                                borderRadius: Borderradiuses.unOltinchi,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          stat.cards?[index].name ??
                                              "SuperHuman",
                                          style: Style.oppoq(size: 20),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => AlertDialog(
                                                        title: Text(
                                                            "waiting_delete",
                                                            style: Style
                                                                .qopqora()),
                                                        actions: [
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              "Yoq",
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              stat.cards
                                                                  ?.removeAt(
                                                                      index);
                                                              context
                                                                  .read<
                                                                      FilterCubit>()
                                                                  .delete(
                                                                      index);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                              "Xa",
                                                            ),
                                                          ),
                                                        ],
                                                      ));
                                            },
                                            icon: const Icon(Icons.delete))
                                      ],
                                    ),
                                    2.verticalSpaceFromWidth,
                                    AnimatedDigitWidget(
                                      valueColors: [
                                        ValueColor(
                                            condition: () {
                                              return true;
                                            },
                                            color: Colors.white)
                                      ],
                                      value: int.parse(
                                          stat.cards?[index].number ?? '1'),
                                    ),
                                    Text(
                                      'Balance',
                                      style: Style.oppoq(size: 16),
                                    ),
                                    Row(
                                      children: [
                                        AnimatedDigitWidget(
                                          valueColors: [
                                            ValueColor(
                                                condition: () {
                                                  return true;
                                                },
                                                color: Colors.white)
                                          ],
                                          value:
                                              stat.cards?[index].allcost ?? 1,
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          stat.cards?[index].type ??
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        decoration: Style.addushi(textColor: Colors.grey),
                      ),
                      gradient: Gradients.onStart,
                    )
                  : Newcop(stat: stat, state: state)
            ],
          ),
        ),
      ),
    );
  }
}
