import 'package:cardsnew/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/cubit/filter_cubit.dart';
import '../../application/cubit/history_cubit.dart';

class Newcop extends StatelessWidget {
  final Filterstate stat;
  final HistoryState state;

  const Newcop({super.key, required this.stat, required this.state});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.history?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: state.history?[index].card?.isNotEmpty ?? false
                ? Container(
                    width: double.infinity,
                    height: 65,
                    decoration: Style.addushi(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: Style.dumoloq(
                            textColor: Colors.transparent,
                          ),
                          child: Image.asset('images/boy.png'),
                        ),
                        16.horizontalSpaceRadius,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            14.verticalSpaceFromWidth,
                            state.history?[index].cost.toString()[0] == '-'
                                ? Text(
                                    "${state.history?[index].name}ga Pul O'tqazildi",
                                    style: Style.qopqora(size: 16),
                                  )
                                : Text(
                                    "${state.history?[index].name}dan Pul tushdi",
                                    style: Style.qopqora(size: 16),
                                  )
                          ],
                        ),
                        const Spacer(),
                        state.history?[index].cost.toString()[0] == '-'
                            ? Container(
                                width: 80,
                                height: 30,
                                decoration: Style.addushi(
                                    // ignore: prefer_const_constructors
                                    textColor: Colors.redAccent),
                                child: Center(
                                  child: Text(
                                    '${state.history?[index].cost}',
                                    style: Style.textNormSizeLightMode(
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 80,
                                height: 30,
                                decoration: Style.addushi(
                                    // ignore: prefer_const_constructors
                                    textColor: Colors.green),
                                child: Center(
                                  child: Text(
                                    '+${state.history?[index].cost}',
                                    style: Style.textNormSizeLightMode(
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
