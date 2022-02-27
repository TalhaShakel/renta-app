class carmodel {
  String? model;
  String? carName;
  String? color;
  List<Packages>? packages;

  var data;

  carmodel({this.model, this.carName, this.color, this.packages});

  carmodel.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    carName = json['carName'];
    color = json['color'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['carName'] = this.carName;
    data['color'] = this.color;
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? i5Hours;
  int? i10Hours;
  int? i24Hours;
  int? outOfCity;
  int? weekly;
  int? monthly;

  Packages(
      {this.i5Hours,
      this.i10Hours,
      this.i24Hours,
      this.outOfCity,
      this.weekly,
      this.monthly});

  Packages.fromJson(Map<String, dynamic> json) {
    i5Hours = json['5_hours'];
    i10Hours = json['10_hours'];
    i24Hours = json['24_hours'];
    outOfCity = json['outOfCity'];
    weekly = json['weekly'];
    monthly = json['monthly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['5_hours'] = this.i5Hours;
    data['10_hours'] = this.i10Hours;
    data['24_hours'] = this.i24Hours;
    data['outOfCity'] = this.outOfCity;
    data['weekly'] = this.weekly;
    data['monthly'] = this.monthly;
    return data;
  }
}
