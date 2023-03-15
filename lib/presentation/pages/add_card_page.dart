import 'dart:math' as math;
import 'package:cardsnew/application/cubit/filter_cubit.dart';
import 'package:cardsnew/presentation/pages/homepage.dart';
import 'package:cardsnew/presentation/routes.dart';
import 'package:cardsnew/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../companents/chekdate.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool iserror = false;
  bool showBack = false;

  late FocusNode _focusNode;

  List images = [
    'images/Base.png',
    'images/Base1.png',
    'images/Base2.png',
  ];
  int index1 = 0;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ignore: prefer_const_constructors
              SizedBox(
                height: 40,
              ),
              CreditCard(
                cardNumber: cardNumber,
                bankName: "Jabik Bank",
                cardExpiry: expiryDate,
                cardHolderName: cardHolderName,
                cvv: cvv,
                showBackSide: showBack,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
                // mask: getCardTypeMask(cardType: CardType.americanExpress),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        index1 = index;
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                images[index],
                              )),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "Karta Raqamni Kiriting";
                        }
                        return null;
                      },
                      controller: cardNumberCtrl,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Karta raqam'),
                      maxLength: 16,
                      onChanged: (value) {
                        final newCardNumber = value.trim();
                        var newStr = '';
                        final step = 4;

                        for (var i = 0; i < newCardNumber.length; i += step) {
                          newStr += newCardNumber.substring(
                              i, math.min(i + step, newCardNumber.length));
                          if (i + step < newCardNumber.length) newStr += ' ';
                        }

                        setState(() {
                          cardNumber = newStr;
                        });
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        validator: (s) {
                          if (s?.isEmpty ?? true) {
                            return "Yaroqlilik Muddatini Kiriting";
                          }
                          return null;
                        },
                        controller: expiryFieldCtrl,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(hintText: 'Yaroqli muddati'),
                        maxLength: 5,
                        onChanged: (value) {
                          var newDateValue = value.trim();
                          final isPressingBackspace =
                              expiryDate.length > newDateValue.length;
                          final containsSlash = newDateValue.contains('/');

                          if (newDateValue.length >= 2 &&
                              !containsSlash &&
                              !isPressingBackspace) {
                            newDateValue = newDateValue.substring(0, 2) +
                                '/' +
                                newDateValue.substring(2);
                          }
                          setState(() {
                            expiryFieldCtrl.text = newDateValue;
                            expiryFieldCtrl.selection =
                                TextSelection.fromPosition(
                                    TextPosition(offset: newDateValue.length));
                            expiryDate = newDateValue;
                          });
                        },
                      )),
                  iserror
                      ? const SizedBox.shrink()
                      : Text(
                          'Yaroqlilik Muddatini Tugri kiriting!',
                          style: Style.textNormSizeLightMode(
                            size: 14,
                            textColor: Colors.red,
                          ),
                        ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "Ism Familyangizni kirting";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration:
                          const InputDecoration(hintText: 'Ism Familiya'),
                      onChanged: (value) {
                        setState(() {
                          cardHolderName = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: TextFormField(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "Mahviy Kodni kiriting";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: 'Mahviy Kod'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                        });
                      },
                      focusNode: _focusNode,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            if (ChekDate(expiryDate)) {
                              iserror = true;
                              setState(() {});
                              context.read<FilterCubit>().addAlldatas(
                                    name: cardHolderName,
                                    chiqdi: 0,
                                    kirdi: 0,
                                    date: expiryDate,
                                    number: cardNumber,
                                    type: 'images/visa.png',
                                    imgeindex: index1,
                                    cvv: int.parse(cvv),
                                    allcost: 0,
                                  );
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      Center(
                                        child: Image.asset('images/allset.gif'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              Future.delayed(const Duration(seconds: 3))
                                  .then((value) => Navigator.of(context).push(
                                        Routes.goHomepage(),
                                      ));
                            } else {
                              iserror = false;
                              setState(() {});
                            }
                          }
                        },
                        child: const Text("Add Card",
                            style: TextStyle(fontSize: 24)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}