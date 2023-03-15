class Historymodel {
  final String? card, date, name;
  final int? cost;

  Historymodel({this.card, this.date, this.name, this.cost});

  factory Historymodel.fromJson(Map data) {
    return Historymodel(
      card: data['card'],
      date: data['date'],
      name: data['name'],
      cost: data['cost'],
    );
  }
  toJson() {
    return {
      'cost': cost,
      'card': card,
      'date': date,
      'name': name,
    };
  }
}
