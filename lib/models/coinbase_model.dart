//API : https://api.coindesk.com/v1/bpi/currentprice.json

class CoinbaseModel {
  List<Namedata>? namedata;

  CoinbaseModel({this.namedata});

  CoinbaseModel.fromJson(Map<String, dynamic> json) {
    if (json['namedata'] != null) {
      namedata = <Namedata>[];
      json['namedata'].forEach((v) {
        namedata!.add(Namedata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (namedata != null) {
      data['namedata'] = namedata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Namedata {
  String? id;
  String? name;
  String? minSize;

  Namedata({this.id, this.name, this.minSize});

  Namedata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    minSize = json['min_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['min_size'] = minSize;
    return data;
  }
}
