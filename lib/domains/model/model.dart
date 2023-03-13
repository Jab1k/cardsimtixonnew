// ignore_for_file: avoid_print

class CardsModel {
  final String? name, lastname, date, number, type;
  final int? chiqdi, kirdi, cvv, imgeindex, pincode, allcost;
  CardsModel({
    this.allcost,
    this.name,
    this.lastname,
    this.date,
    this.number,
    this.type,
    this.chiqdi,
    this.kirdi,
    this.cvv,
    this.imgeindex,
    this.pincode,
  });
  factory CardsModel.fromJson(Map<String, dynamic> data) {
    return CardsModel(
      name: data['name'],
      lastname: data['last name'],
      date: data['date'],
      number: data['number'],
      type: data['type'],
      chiqdi: data['chiqdi'],
      kirdi: data['kirdi'],
      cvv: data['cvv'],
      imgeindex: data['imageindex'],
      pincode: data['pincode'],
      allcost: data['Allcost'],
    );
  }
  toJson() {
    return {
      "name": name,
      "lastname": lastname,
      "chiqdi": chiqdi,
      'kirdi': kirdi,
      'cvv': cvv,
      'date': date,
      'imageindex': imgeindex,
      'pincode': pincode,
      "tpye": pincode,
      'Allcost': allcost
    };
  }
}
