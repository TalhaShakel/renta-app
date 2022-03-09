import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:renta/screens/splash_page.dart';
import 'package:renta/screens/time_location.dart';

class Single extends StatelessWidget {
  var name, email, contact, cnic, image, serviceName, pack;

  Single(
      {this.name,
      this.email,
      this.contact,
      this.cnic,
      this.serviceName,
      this.image,
      this.pack});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(15),
                                  ),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                  size: 28,
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: orangeColors,
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(15),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 22,
                                  )),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.share,
                                    color: Colors.black,
                                    size: 22,
                                  )),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.network(
                        image.toString(),
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.contain,
                        // height: 11,
                      ),
                      // ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 7.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Center(
                          child: Text(cnic,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // selected = false;
                      // package = months;
                      // print("This package is selected: $package");
                      // pp = price;
                      // print("Package is selected $pp");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.27,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:
                            // selected ? kPrimaryColor :
                            Colors.white,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(15),
                        ),
                        border: Border.all(
                            // color: Colors.black,
                            // width: selected ? 0 : 1,
                            ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            pack[0]["weekly"].toString(),
                            style: TextStyle(
                              letterSpacing: 1,
                              color:
                                  // selected ? Colors.white :
                                  Colors.black,
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Expanded(
                          //   child: Container(),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Text(
                            " PKR",
                            style: TextStyle(
                              color:
                                  // selected ? Colors.white :
                                  Colors.black,
                              // fontSize: 24,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   "PKR",
                          //   style: TextStyle(
                          //     color: selected ? Colors.white : Colors.black,
                          //     // fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        child: Text(name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ),
                  ),
                  Text(pack[0]['hours5'].toString()),
                  Text(pack[0]['hours10'].toString()),
                  Text(pack[0]['hours24'].toString()),
                  Text(pack[0]['outOfCity'].toString()),
                  Text(pack[0]['weekly'].toString()),
                  Text(pack[0]['monthly'].toString()),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Time_location(
                                    img: image,
                                    pack: pack[0]['monthly'].toString(),
                                    car1: cnic,
                                    price: pack[0]['monthly'].toString())));
                      },
                      child: Text("data"))
                ],
              ),
              //   C
            ],
          ),
        ),
        // (ye nav ka secion hai)
      ),
    );
  }

  // String pp = "";
  // String package = "";
  // Widget buildPricePerPeriod(String months, String price, bool selected) {
  // return GestureDetector(
  //   onTap: () {
  //     // selected = false;
  //     package = months;
  //     print("This package is selected: $package");
  //     pp = price;
  //     print("Package is selected $pp");
  //   },
  //   child: Container(
  //     height: MediaQuery.of(context).size.height * 0.1,
  //     width: MediaQuery.of(context).size.width * 0.27,
  //     padding: const EdgeInsets.all(5),
  //     decoration: BoxDecoration(
  //       color:
  //           // selected ? kPrimaryColor :
  //           Colors.white,
  //       borderRadius: const BorderRadius.all(
  //         const Radius.circular(15),
  //       ),
  //       border: Border.all(
  //         // color: Colors.black,
  //         width: selected ? 0 : 1,
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.4),
  //           spreadRadius: 3,
  //           blurRadius: 4,
  //           offset: Offset(0, 3), // changes position of shadow
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Text(
  //           months,
  //           style: TextStyle(
  //             letterSpacing: 1,
  //             color:
  //                 // selected ? Colors.white :
  //                 Colors.black,
  //             fontSize: 14,
  //             // fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         // Expanded(
  //         //   child: Container(),
  //         // ),
  //         // SizedBox(
  //         //   height: 20,
  //         // ),
  //         Text(
  //           price + " PKR",
  //           style: TextStyle(
  //             color:
  //                 // selected ? Colors.white :
  //                 Colors.black,
  //             // fontSize: 24,
  //             // fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         // Text(
  //         //   "PKR",
  //         //   style: TextStyle(
  //         //     color: selected ? Colors.white : Colors.black,
  //         //     // fontSize: 14,
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //   ),
  // );
}
// }
// price, service provider name, service provider serviceName, login customer name and current date