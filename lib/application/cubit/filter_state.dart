part of 'filter_cubit.dart';

class Filterstate {
  List<CardsModel>? cards;

  Filterstate({
    this.cards,
  });

  Filterstate copyWith({List<CardsModel>? cardsModel}) {
    return Filterstate(
      cards: cardsModel ?? cards,
    );
  }
}
