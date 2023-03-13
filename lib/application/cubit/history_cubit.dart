// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cardsnew/domains/model/historymodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryState());
  List<Historymodel> history = [];
  List<dynamic> lst = [];
  bool isloading = true;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getAllDatas() async {
    isloading = true;
    emit(state);
    var res = await firestore.collection('Cards').get();
    history.clear();
    for (var element in res.docs) {
      if (element.data()['history'] != null) {
        // print(element.data()['history']);
        lst = element.data()['history'];
        lst.forEach((element) {
          history.add(Historymodel.fromJson(element));
          print(history.last.cost);
        });
      } else {
        break;
      }
    }
    emit(state.copyWith(history: history));
    isloading = false;
    emit(state);
  }
}
