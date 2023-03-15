import 'package:cardsnew/application/cubit/filter_cubit.dart';
import 'package:cardsnew/application/cubit/history_cubit.dart';
import 'package:cardsnew/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:select_card/select_card.dart';

class CardToCard extends StatefulWidget {
  const CardToCard({super.key});

  @override
  State<CardToCard> createState() => _CardToCardState();
}

class _CardToCardState extends State<CardToCard> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _costcontroller = TextEditingController();
  final TextEditingController _cardcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, Filterstate>(
      builder: (context, stat) {
        return BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  'Pul Utqazish',
                  style: Style.qopqora(),
                ),
                backgroundColor: Colors.grey,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('images/cards.gif'),
                      24.verticalSpaceFromWidth,
                      TextFormField(
                        // ignore: prefer_const_constructors
                        decoration: const InputDecoration(
                            hintText: 'Karta Raqam Kiriting'),

                        maxLength: 16,
                        controller: _cardcontroller,
                      ),
                      24.verticalSpaceFromWidth,
                      TextFormField(
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(hintText: 'Isimni kiritng'),
                        controller: _namecontroller,
                      ),
                      24.verticalSpaceFromWidth,
                      TextFormField(
                        // ignore: prefer_const_constructors
                        decoration: const InputDecoration(
                            hintText: 'Miqdorni kiriting'),
                        keyboardType: TextInputType.number,
                        controller: _costcontroller,
                      ),
                      24.verticalSpaceFromWidth,
                      GestureDetector(
                        onTap: () {
                          context.read<HistoryCubit>().addAlldatas(
                              name1: _namecontroller.text,
                              name: stat.cards?.first.name,
                              doc: '4VZqvnyfIcmwnTMppeD5',
                              cost: int.parse(_costcontroller.text),
                              number: stat.cards?.first.number,
                              type: 'Visa',
                              chiqdi: stat.cards?.first.chiqdi,
                              kirdi: stat.cards?.first.kirdi,
                              card: _cardcontroller.text,
                              cvv: stat.cards?.first.cvv,
                              imgeindex: stat.cards?.first.imgeindex,
                              allcost: stat.cards?.first.allcost);
                        },
                        child: Container(
                          decoration: Style.addushi(textColor: Colors.blue),
                          height: 50,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Send Money',
                              style: Style.qopqora(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
