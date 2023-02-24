//API : https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0

class WindModel {
  String? product;
  String? init;
  List<Dataseries>? dataseries;

  WindModel({this.product, this.init, this.dataseries});

  WindModel.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    init = json['init'];
    if (json['dataseries'] != null) {
      dataseries = <Dataseries>[];
      json['dataseries'].forEach((v) {
        dataseries!.add(Dataseries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product;
    data['init'] = init;
    if (dataseries != null) {
      data['dataseries'] = dataseries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dataseries {
  int? timepoint;
  int? cloudcover;
  int? seeing;
  int? transparency;
  int? liftedIndex;
  int? rh2m;
  Wind10m? wind10m;
  int? temp2m;
  String? precType;

  Dataseries(
      {this.timepoint,
      this.cloudcover,
      this.seeing,
      this.transparency,
      this.liftedIndex,
      this.rh2m,
      this.wind10m,
      this.temp2m,
      this.precType});

  Dataseries.fromJson(Map<String, dynamic> json) {
    timepoint = json['timepoint'];
    cloudcover = json['cloudcover'];
    seeing = json['seeing'];
    transparency = json['transparency'];
    liftedIndex = json['lifted_index'];
    rh2m = json['rh2m'];
    wind10m =
        json['wind10m'] != null ? Wind10m.fromJson(json['wind10m']) : null;
    temp2m = json['temp2m'];
    precType = json['prec_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timepoint'] = timepoint;
    data['cloudcover'] = cloudcover;
    data['seeing'] = seeing;
    data['transparency'] = transparency;
    data['lifted_index'] = liftedIndex;
    data['rh2m'] = rh2m;
    if (wind10m != null) {
      data['wind10m'] = wind10m!.toJson();
    }
    data['temp2m'] = temp2m;
    data['prec_type'] = precType;
    return data;
  }
}

class Wind10m {
  String? direction;
  int? speed;

  Wind10m({this.direction, this.speed});

  Wind10m.fromJson(Map<String, dynamic> json) {
    direction = json['direction'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['direction'] = direction;
    data['speed'] = speed;
    return data;
  }
}
