import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:renta/screens/splash_page.dart';

import 'time_location.dart';

// class ConfirmOrder extends StatefulWidget {
//   const ConfirmOrder({Key? key, TextEditingController value}) : super(key: key);

//   @override
//   _ConfirmOrderState createState() => _ConfirmOrderState();
// }

// class _ConfirmOrderState extends State<ConfirmOrder> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1B6A65),
//         title: Text("My Bookings Details"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ///Fuel Charges:  All other Cars are from Same Level of Fuel to Same Level of Fuel
//               ///Important note:

//               Text(
//                 "Fuel Charges:",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Hatchback: Rs.16 per Km",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Corolla: Rs.22 per Km",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "All other Cars are from Same Level of Fuel to Same Level of Fuel",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 18.0),
//                 child: Text(
//                   "Important note:",
//                   style: TextStyle(
//                       fontSize: 16,
//                       letterSpacing: 1,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Text(
//                 "Rental charges are only valid for within Karachi City. Rs.500/HOUR will be charged for an extra hour in HalfDAY Rental Rs.200/HOUR will be charged for an extra hour in FULL-DAY Rental.",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 50.0),
//                 child: Text(
//                   "ORDER SUMMARY",
//                   style: TextStyle(
//                       fontSize: 18,
//                       letterSpacing: 1,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Text(
//                 "Package:",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Price:",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Delivery Time: ",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Delivery Date:",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Address:",
//                 style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Privacy Policy:",
//                 style: TextStyle(
//                     fontSize: 18,
//                     letterSpacing: 1,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Privacy Policy:",
//                 style: TextStyle(
//                     fontSize: 18,
//                     letterSpacing: 1,
//                     fontWeight: FontWeight.bold),
//               ),
//             ]),
//       ),
//     );
//   }
// }
class ConfirmOrder extends StatelessWidget {
  String car2;
  String? address;
  String? pp2;
  String? package;
  String pack2;
  String img;

  ConfirmOrder(
      {required this.img,
      required this.car2,
      required this.pack2,
      this.address,
      this.package,
      this.pp2});
  String url =
      "https://rentacar1311.azurewebsites.net/api/v1/order/create-order";

  postdata() async {
    try {
      final response = await post(Uri.parse(url), body: {
        // "message": "valid",
        "userId": "6203ebedb94c608b4ff392dc",
        "carId": "$car2",
        "carColor": "White",
        "packageName": "$pack2",
        "orderedAddress": "$address",
        // "forWedding": wedyes ? "Yes" : "No",
      });
      print(" ${response.body} Data is post");
    } catch (e) {
      print(e.toString());
    }
  }

  // String value;
  // ConfirmOrder(this.value, {value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A65),
        title: Text("My Bookings Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Fuel Charges:  All other Cars are from Same Level of Fuel to Same Level of Fuel
                ///Important note:
                Center(
                  child: Image.network(
                    img.toString(),
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.contain,
                    // height: 11,
                  ),
                  // ),
                ),
                Text(
                  car2.toString(),
                  style: TextStyle(
                      fontSize: 35,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius

                      border: Border.all(
                        color: Color(0xFF1B6A65),
                        width: 4,
                      )),
                  child: Column(
                    children: [
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        """1-With Driver 
2-No fuel Commissions &Without Fuel
3-No High-fares No HiddenCharges.""",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 1, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(
                          color: Color(0xFF1B6A65),
                          width: 4,
                        )),
                    child: Column(
                      children: [
                        Text(
                          "IMPORTANT NOTE",
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          """Rental Charges only Valid for Karachi CITY. 
Add On Charges will be applied for Extra Per Hour
1-Sedan = 250
2- Hatch Back = 200
3- Luxury & SUV= 500""",
                          style: TextStyle(
                              letterSpacing: 1, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Rental charges are only valid for within Karachi City. Rs.500/HOUR will be charged for an extra hour in HalfDAY Rental Rs.200/HOUR will be charged for an extra hour in FULL-DAY Rental.",
                            style: TextStyle(
                                letterSpacing: 1, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(
                          color: Color(0xFF1B6A65),
                          width: 4,
                        )),
                    child: Column(
                      children: [
                        Text(
                          "ORDER SUMMARY",
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          """Package: $pack2
Price: $pp2
Delivery Date: ${selectedDate}
Address: ${address} """,
                          style: TextStyle(
                              letterSpacing: 1, fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   "",
                        //   style: TextStyle(
                        //       letterSpacing: 1, fontWeight: FontWeight.bold),
                        // ),
                        // Text(
                        //   "",
                        //   style: TextStyle(
                        //       letterSpacing: 1, fontWeight: FontWeight.bold),
                        // ),
                        // Text(
                        //   "",
                        //   style: TextStyle(
                        //       letterSpacing: 1, fontWeight: FontWeight.bold),
                        // ),
                        Text(
                          wedyes
                              ? """For Wedding: Yes """
                              : """For Wedding: No """,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   "",
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       letterSpacing: 1,
                        //       fontWeight: FontWeight.bold),
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      postdata();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: orangeColors,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Place Order',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  // recognizer: TapGestureRecognizer()
                                  // onTap = () {
                                  // print("months");
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       postdata();
                //     },
                //     child: Text("Post"))
              ]),
        ),
      ),
    );
  }
}
