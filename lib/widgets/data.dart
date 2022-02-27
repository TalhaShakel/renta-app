import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

// class Car {

//   String brand;
//   String model;
//   double price;
//   String condition;
//   List<String> images;

//   var car_id;

//   Car(this.car_id,this.brand, this.model, this.price, this.condition, this.images);
// // {"_id":"62076a9e6fe9ca84e2d74565","model":"Non A/C","carName":"Coaster Non A/C","carImg":"https://i.ibb.co/NNVmKv1/Coaster.jpg","color":"white","lateCharges":500,"packages":[{"5_hours":4500,"10_hours":5000,"24_hours":10000,"outOfCity":12000,"weekly":0,"monthly":0}],"category":"coaster","createdAt":"2022-02-12T08:06:54.570Z","updatedAt":"2022-02-12T08:06:54.570Z","__v":0}
//   static Car fromJson() {
//     return Car(
//       "",
//       "",
//       "",
//       0.0,
//       "",
//       [],
//     );
//   }
// }

// {"_id":"62076a9e6fe9ca84e2d74565","model":"Non A/C","carName":"Coaster Non A/C","carImg":"https://i.ibb.co/NNVmKv1/Coaster.jpg","color":"white","lateCharges":500,"packages":[{"5_hours":4500,"10_hours":5000,"24_hours":10000,"outOfCity":12000,"weekly":0,"monthly":0}],"category":"coaster","createdAt":"2022-02-12T08:06:54.570Z","updatedAt":"2022-02-12T08:06:54.570Z","__v":0}

class Car {
  String id;
  String model;
  String carName;
  final String carImg;
  String color;
  int lateCharges;
  List<Package> packages;
  String category;
  String createdAt;
  String updatedAt;
  List<String> images;
  // int __v;

  Car(
    this.id,
    this.model,
    this.carName,
    this.carImg,
    this.color,
    this.lateCharges,
    this.packages,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.images,
  );

  static Car fromJson(Map<String, dynamic> json) {
    return Car(
      json['_id'],
      json['model'],
      json['carName'],
      json['carImg'],
      json['color'],
      json['lateCharges'] ?? 0,
      List<Package>.from(json['packages'].map((x) => Package.fromJson(x))),
      json['category'],
      json['createdAt'],
      json['updatedAt'],
      [json['carImg']],
    );
  }
}

class Package {
  // "packages":[{"5_hours":4500,"10_hours":5000,"24_hours":10000,"outOfCity":12000,"weekly":0,"monthly":0}]
  int fiveHours;
  int tenHours;
  int twentyFourHours;
  int outOfCity;
  int weekly;
  int monthly;

  Package(this.fiveHours, this.tenHours, this.twentyFourHours, this.outOfCity,
      this.weekly, this.monthly);

  static Package fromJson(Map<String, dynamic> json) {
    return Package(
      json['5_hours'],
      json['10_hours'],
      json['24_hours'],
      json['outOfCity'],
      json['weekly'],
      json['monthly'],
    );
  }
}

// List<Car> getCarList() {
//   return <Car>[
//     Car(
//       "1",
//       "Corolla Gli",
//       "Toyota",
//       2580,
//       "Weekly",
//       [
//         "assets/images/land_rover_0.png",
//         "assets/images/land_rover_1.png",
//         "assets/images/land_rover_2.png",
//       ],
//     ),
//     Car(
//       "2",
//       "Civic",
//       "Honda",
//       3580,
//       "Monthly",
//       [
//         "assets/images/alfa_romeo_c4_0.png",
//       ],
//     ),
//     Car(
//       "3",
//       "Yaris",
//       "Toyota",
//       1100,
//       "Daily",
//       [
//         "assets/images/nissan_gtr_0.png",
//         "assets/images/nissan_gtr_1.png",
//         "assets/images/nissan_gtr_2.png",
//         "assets/images/nissan_gtr_3.png",
//       ],
//     ),
//     Car(
//       "4",
//       "City",
//       "Honda",
//       2200,
//       "Monthly",
//       [
//         "assets/images/acura_0.png",
//         "assets/images/acura_1.png",
//         "assets/images/acura_2.png",
//       ],
//     ),
//     Car(
//       "5",
//       "Kompressor",
//       "Mercedes",
//       3400,
//       "Weekly",
//       [
//         "assets/images/camaro_0.png",
//         "assets/images/camaro_1.png",
//         "assets/images/camaro_2.png",
//       ],
//     ),
//     Car(
//       "6",
//       "C-180",
//       "Mercedes",
//       4200,
//       "Weekly",
//       [
//         "assets/images/ferrari_spider_488_0.png",
//         "assets/images/ferrari_spider_488_1.png",
//         "assets/images/ferrari_spider_488_2.png",
//         "assets/images/ferrari_spider_488_3.png",
//         "assets/images/ferrari_spider_488_4.png",
//       ],
//     ),
//     Car(
//       "7",
//       "CLA-200",
//       "Mercedes",
//       2300,
//       "Weekly",
//       [
//         "assets/images/ford_0.png",
//         "assets/images/ford_1.png",
//       ],
//     ),
//     Car(
//       "8",
//       "Audi A3",
//       "Audi",
//       1450,
//       "Weekly",
//       [
//         "assets/images/fiat_0.png",
//         "assets/images/fiat_1.png",
//       ],
//     ),
//     Car(
//       "9",
//       "Audi A4",
//       "Audi",
//       900,
//       "Daily",
//       [
//         "assets/images/honda_0.png",
//       ],
//     ),
//     Car(
//       "10",
//       "Audi A5",
//       "Audi",
//       1200,
//       "Monthly",
//       [
//         "assets/images/citroen_0.png",
//         "assets/images/citroen_1.png",
//         "assets/images/citroen_2.png",
//       ],
//     ),
//     Car(
//       "11",
//       "Lamousine",
//       "Lamousine",
//       2580,
//       "Weekly",
//       [
//         "assets/images/land_rover_0.png",
//         "assets/images/land_rover_1.png",
//         "assets/images/land_rover_2.png",
//       ],
//     ),
//     Car(
//       "12",
//       "Parado",
//       "Toyota",
//       3580,
//       "Monthly",
//       [
//         "assets/images/alfa_romeo_c4_0.png",
//       ],
//     ),
//     Car(
//       "13",
//       "Revo",
//       "Toyota",
//       1100,
//       "Daily",
//       [
//         "assets/images/nissan_gtr_0.png",
//         "assets/images/nissan_gtr_1.png",
//         "assets/images/nissan_gtr_2.png",
//         "assets/images/nissan_gtr_3.png",
//       ],
//     ),
//     Car(
//       "14",
//       "Fortuner",
//       "Toyota",
//       2200,
//       "Monthly",
//       [
//         "assets/images/acura_0.png",
//         "assets/images/acura_1.png",
//         "assets/images/acura_2.png",
//       ],
//     ),
//     Car(
//       "15",
//       "",
//       "Toyota",
//       3400,
//       "Weekly",
//       [
//         "assets/images/camaro_0.png",
//         "assets/images/camaro_1.png",
//         "assets/images/camaro_2.png",
//       ],
//     ),
//     Car(
//       "16",
//       "GMC",
//       "GMC",
//       4200,
//       "Weekly",
//       [
//         "assets/images/ferrari_spider_488_0.png",
//         "assets/images/ferrari_spider_488_1.png",
//         "assets/images/ferrari_spider_488_2.png",
//         "assets/images/ferrari_spider_488_3.png",
//         "assets/images/ferrari_spider_488_4.png",
//       ],
//     ),
//     Car(
//       "17",
//       "Ford",
//       "Focus",
//       2300,
//       "Weekly",
//       [
//         "assets/images/ford_0.png",
//         "assets/images/ford_1.png",
//       ],
//     ),
//     Car(
//       "18",
//       "Fiat",
//       "500x",
//       1450,
//       "Weekly",
//       [
//         "assets/images/fiat_0.png",
//         "assets/images/fiat_1.png",
//       ],
//     ),
//     Car(
//       "19",
//       "Honda",
//       "Civic",
//       900,
//       "Daily",
//       [
//         "assets/images/honda_0.png",
//       ],
//     ),
//     Car(
//       "20",
//       "Citroen",
//       "Picasso",
//       1200,
//       "Monthly",
//       [
//         "assets/images/citroen_0.png",
//         "assets/images/citroen_1.png",
//         "assets/images/citroen_2.png",
//       ],
//     ),
//     Car(
//       "21",
//       "Citroen",
//       "Picasso",
//       1200,
//       "Monthly",
//       [
//         "assets/images/citroen_0.png",
//         "assets/images/citroen_1.png",
//         "assets/images/citroen_2.png",
//       ],
//     ),
//   ];
// }

class Dealer {
  String name;
  int offers;
  String image;

  Dealer(this.name, this.offers, this.image);
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}
