import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:renta/screens/splash_page.dart';

import 'confirm_order.dart';

DateTime selectedDate = DateTime.now();
bool wedyes = false;
bool wedno = false;

class Time_location extends StatefulWidget {
  String car1;
  String? price;
  String? pack;
  String img;

  Time_location({
    required this.img,
    this.pack,
    required this.car1,
    this.price,
  });

  @override
  _Time_locationState createState() => _Time_locationState(car1);
}

class _Time_locationState extends State<Time_location> {
  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2022, 12);

  TextEditingController location_Pick_Up = TextEditingController();

  _Time_locationState(String car1);
  timelocate() {
    print(location_Pick_Up.text);
    print(selectedDate);
    print(selectedDate);
  }

  var newDate;
  var value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A65),
        title: Text("Select your Delivery Time and Location"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text("$selectedDate".split(' ')[0], style: TextStyle(fontSize: 24)),
            Divider(),
            CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: firstDate,
                lastDate: lastDate,
                onDateChanged: (newData) {
                  setState(() {
                    selectedDate = newData;
                  });
                }),
            Divider(),
            Container(
              height: 200,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: selectedDate,
                  minimumDate: firstDate,
                  maximumDate: lastDate,
                  onDateTimeChanged: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  }),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: const Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 80,
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 16,
                      ),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {
                            address = text;
                          });
                        },
                        controller: location_Pick_Up,
                        cursorColor: const Color(0xFF1B6A65),
                        // ignore: unnecessary_const
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFF1B6A65),
                          ),
                          hintText: "Enter your pickup location",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmOrder(
                              img: widget.img,
                              car2: widget.car1,
                              pack2: widget.pack.toString())));
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
                              text: 'Confirm Order',
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
              // Container(
              //     height: 50,
              //     decoration: BoxDecoration(
              //       color: orangeColors,
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(15),
              //       ),
              //     ),
              //     child: ElevatedButton(
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => ConfirmOrder(
              //                       img: widget.img,
              //                       car2: widget.car1,
              //                       pack2: widget.pack.toString())));
              //         },
              //         child: Text("Conform order"))),
            ),
            // Text("${location_Pick_Up.text}${selectedDate}${selectedDate}"),
          ],
        ),
      ),
    );
  }

  var address;
  openDatePicker(BuildContext context) async {
    final DateTime = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);
  }
}
