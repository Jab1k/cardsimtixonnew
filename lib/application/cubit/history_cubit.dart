// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cardsnew/domains/model/historymodel.dart';
import 'package:cardsnew/domains/model/model.dart';
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

  void addAlldatas({
    String? name,
    String? doc,
    String? date,
    int? cost,
    String? name1,
    String? number,
    String? type,
    int? chiqdi,
    int? kirdi,
    String? card,
    int? cvv,
    int? imgeindex,
    int? pincode,
    int? allcost,
  }) async {
    firestore.collection('Cards').doc(doc).update(CardsModel(
          name: name,
          date: date,
          number: number,
          type: type,
          chiqdi: chiqdi,
          kirdi: kirdi,
          cvv: cvv,
          imgeindex: imgeindex,
          allcost: allcost,
        ).toJsonhist(
          name: name1,
          cost: cost,
          date: DateTime.now().toString(),
          card: card,
        ));
  }
}
