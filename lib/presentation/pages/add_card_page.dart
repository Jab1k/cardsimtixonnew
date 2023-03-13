// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubit/filter_cubit.dart';
class CardAddPage extends StatefulWidget {
  const CardAddPage({super.key});

  @override
  State<CardAddPage> createState() => _CardAddPageState();
}

class _CardAddPageState extends State<CardAddPage> {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController imageindexcontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, Filterstate>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                controller: namecontroller,
              ),
              TextFormField(
                controller: datecontroller,
              ),
              TextFormField(
                controller: numbercontroller,
              ),
              TextFormField(
                controller: lastnamecontroller,
              ),
              TextFormField(
                controller: imageindexcontroller,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: pincodecontroller,
              ),
              TextFormField(
                controller: typecontroller,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<FilterCubit>().addAlldatas(
                    name: namecontroller.text,
                    lastname: lastnamecontroller.text,
                    type: typecontroller.text,
                    kirdi: 0,
                    chiqdi: 0,
                    pincode: 123,
                    imgeindex: 1,
                    number: numbercontroller.text,
                    date: datecontroller.text,
                  );
              print('Tax');
            },
          ),
        );
      },
    );
  }
}
