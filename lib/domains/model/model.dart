// ignore_for_file: avoid_print

class CardsModel {
  final String? name, date, number, type;
  final int? chiqdi, kirdi, cvv, imgeindex, allcost;
  CardsModel({
    this.allcost,
    this.name,
    this.date,
    this.number,
    this.type,
    this.chiqdi,
    this.kirdi,
    this.cvv,
    this.imgeindex,
  });
  factory CardsModel.fromJson(Map<String, dynamic> data) {
    return CardsModel(
      name: data['name'],
      date: data['date'],
      number: data['number'],
      type: data['type'],
      chiqdi: data['chiqdi'],
      kirdi: data['kirdi'],
      cvv: data['cvv'],
      imgeindex: data['imageindex'],
      allcost: data['Allcost'],
    );
  }
  toJson() {
    return {
      'history': [
        {
          'date': null,
          'cost': 0,
          'card': null,
          'name': null,
        }
      ],
      "name": name,
      "chiqdi": chiqdi,
      'kirdi': kirdi,
      'cvv': cvv,
      'date': date,
      'imageindex': imgeindex,
      'Allcost': allcost
    };
  }

  toJsonhist({
    String? date,
    int? cost,
    String? card,
    String? name,
  }) {
    return {
      'history': [
        {
          'date': date,
          'cost': 0,
          'card': card,
          'name': name,
        }
      ],
      "name": name,
      "chiqdi": chiqdi,
      'kirdi': kirdi,
      'cvv': cvv,
      'date': date,
      'imageindex': imgeindex,
      'Allcost': allcost
    };
  }
}
