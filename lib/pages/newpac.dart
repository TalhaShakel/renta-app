// // import 'dart:html';

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class userModel {
//   String status;
//   String id;
//   String carName;
//   String model;
//   String carImg;
//   String color;
//   String packages;

//   userModel(
//       {required this.carImg,
//       required this.status,
//       required this.carName,
//       required this.color,
//       required this.id,
//       required this.model,
//       required this.packages});
// }

// class pack extends StatelessWidget {
//   String url = "https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car";
//   List<userModel> userlist = [];
//   getUser() async {
//     var response = await http.get(Uri.parse(url));
//     var resbody = json.decode(response.body);
//     print(resbody);
//     List<userModel> userlist = [];
//     print(userlist);
//     for (var i in resbody) {
//       userModel users = userModel(
//         status: i['status'],
//         id: i["id"],
//         carName: i["carName"],
//         model: i["model"],
//         carImg: i['carImg'],
//         color: i['color'],
//         packages: i['packages'],
//         // packages: i['packages'][""],
//       );
//       userlist.add(users);
//     }
//     return userlist;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body:
//           // ElevatedButton(
//           //     onPressed: () {
//           //       getUser();
//           //     },
//           //     child: Text("data"))
//           FutureBuilder(
//               future: getUser(),
//               builder: (context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   return ListView.builder(
//                       itemCount: snapshot.data.data.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                             child: ListTile(
//                           leading: Text("${snapshot.data[index].status}"),
//                         ));
//                       });
//                 }
//               }),
//     ));
//   }
// }
