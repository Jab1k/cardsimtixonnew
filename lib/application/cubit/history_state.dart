part of 'history_cubit.dart';

class HistoryState {
  List<Historymodel>? history;

  HistoryState({this.history});

  HistoryState copyWith({List<Historymodel>? history}) {
    // print('salom ${history?[1].name}');
    return HistoryState(
      history: history ?? this.history,
    );
  }
}
