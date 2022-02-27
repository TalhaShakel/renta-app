// To parse this JSON data, do
//
//     final carsModel = carsModelFromJson(jsonString);

import 'dart:convert';

CarsModel carsModelFromJson(String str) => CarsModel.fromJson(json.decode(str));

String carsModelToJson(CarsModel data) => json.encode(data.toJson());

class CarsModel {
  CarsModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory CarsModel.fromJson(Map<String, dynamic> json) => CarsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.cars,
  });

  List<Car> cars;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cars: List<Car>.from(json["cars"].map((x) => Car.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
      };
}

class Car {
  Car({
    required this.id,
    required this.model,
    required this.carName,
    required this.carImg,
    required this.color,
    required this.packages,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lateCharges,
  });

  String id;
  String model;
  String carName;
  String carImg;
  Color color;
  List<Package> packages;
  String category;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  dynamic lateCharges;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["_id"],
        model: json["model"],
        carName: json["carName"],
        carImg: json["carImg"],
        color: colorValues.map[json["color"]]!,
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        lateCharges: json["lateCharges"] == null ? null : json["lateCharges"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "model": model,
        "carName": carName,
        "carImg": carImg,
        "color": colorValues.reverse[color],
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "lateCharges": lateCharges == null ? null : lateCharges,
      };
}

enum Color { WHITE, BLACK }

final colorValues = EnumValues({"black": Color.BLACK, "white": Color.WHITE});

class Package {
  Package({
    required this.the5Hours,
    required this.the10Hours,
    required this.the24Hours,
    required this.outOfCity,
    required this.weekly,
    required this.monthly,
  });

  int the5Hours;
  int the10Hours;
  int the24Hours;
  int outOfCity;
  int weekly;
  int monthly;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        the5Hours: json["5_hours"],
        the10Hours: json["10_hours"],
        the24Hours: json["24_hours"],
        outOfCity: json["outOfCity"],
        weekly: json["weekly"],
        monthly: json["monthly"],
      );

  Map<String, dynamic> toJson() => {
        "5_hours": the5Hours,
        "10_hours": the10Hours,
        "24_hours": the24Hours,
        "outOfCity": outOfCity,
        "weekly": weekly,
        "monthly": monthly,
      };
}

class EnumValues<T> {
  Map<String, T> map = {};
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}