// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domains/model/model.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<Filterstate> {
  FilterCubit() : super(Filterstate());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<CardsModel> cardslist = [];
  CardsModel? cardsModel;
  int a = 0;
  bool isloading = false;
  void getAllDatas() async {
    isloading = true;
    emit(state);
    var res = await firestore.collection('Cards').get();
    a = res.docs.length;
    cardslist.clear();
    for (var element in res.docs) {
      if (element.data().isNotEmpty) {
        print("${element.data()} All datas");
        cardslist.add(CardsModel.fromJson(element.data()));
      } else {
        break;
      }
    }
    emit(state.copyWith(cardsModel: cardslist));

    isloading = false;
    emit(state);
  }

  bool isError(bool a) {
    if (a) {
      return true;
    }
    return false;
  }

  void addAlldatas({
    String? name,
    String? date,
    String? number,
    String? type,
    int? chiqdi,
    int? kirdi,
    int? cvv,
    int? imgeindex,
    int? pincode,
    int? allcost,
  }) async {
    firestore.collection('Cards').add(CardsModel(
          name: name,
          date: date,
          number: number,
          type: type,
          chiqdi: chiqdi,
          kirdi: kirdi,
          cvv: cvv,
          imgeindex: imgeindex,
          allcost: allcost,
        ).toJson());
  }
}
