import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:renta/pages/showroom.dart';
import 'package:renta/models/newcarmodel.dart' as car;
import 'package:renta/pages/time_location.dart';
import 'package:renta/widgets/constants.dart';
import 'package:renta/widgets/data.dart';
import 'package:renta/widgets/dialogbox.dart';

class BookCar extends StatefulWidget {
  final Car car;

  BookCar({required this.car});

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  @override
  void initState() {
    super.initState();
    login();
  }

  var packagesvalue = false;
  var isloading = false;
//car.CarsModel carsModel = car.CarsModel(data: car.Data(cars: []), status: 'success');

  List<car.Car> cars = [];
  Future<car.CarsModel> login() async {
    cars = [];
    this.isloading = true;
    setState(() {});
    String url = "https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car";

    Response response = await get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      car.CarsModel carsModel = car.carsModelFromJson(response.body);

      cars = carsModel.data.cars;
      isloading = false;
      setState(() {});

      return carsModel;
    } else {
      isloading = false;
      setState(() {});
      throw ('There has been an error');
    }
  }

  int _currentImage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }
  // List<Widget> buildas (){
  //   List<Widget> list = [];
  //   for (var i = 0 ; i < widget.car.packages.)
  // }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: const BorderRadius.all(
          const Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: kPrimaryColor,
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
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.car.carName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.car.model,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        // Expanded(
                        //   child: Container(
                        //     child: PageView(
                        //       physics: const BouncingScrollPhysics(),
                        //       onPageChanged: (int page) {
                        //         setState(() {
                        //           _currentImage = page;
                        //         });
                        //       },
                        //       children: widget.car.images.map((path) {
                        //         return Container(
                        //           padding: const EdgeInsets.symmetric(
                        //             horizontal: 16,
                        //           ),
                        //           child: Hero(
                        //             tag: widget.car.model,
                        //             child: Image.network(
                        //               path,
                        //               fit: BoxFit.scaleDown,
                        //             ),
                        //           ),
                        //         );
                        //       }).toList(),
                        //     ),
                        //   ),
                        // ),
                        // widget.car.image.length > 1
                        //     ? Container(
                        //         margin:
                        //             const EdgeInsets.symmetric(vertical: 16),
                        //         height: 30,
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: buildPageIndicator(),
                        //         ),
                        //       )
                        //     : Container(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildPricePerPeriod(
                                "5_hours".toUpperCase(),
                                widget.car.packages[0].fiveHours.toString(),
                                true,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "10_hours".toUpperCase(),
                                widget.car.packages[0].tenHours.toString(),
                                false,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "24_hours".toUpperCase(),
                                widget.car.packages[0].twentyFourHours
                                    .toString(),
                                false,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildPricePerPeriod(
                                "out Of City".toUpperCase(),
                                widget.car.packages[0].outOfCity.toString(),
                                false,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                " weekly".toUpperCase(),
                                widget.car.packages[0].weekly.toString(),
                                false,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "monthly".toUpperCase(),
                                widget.car.packages[0].monthly.toString(),
                                false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      Text("For Wedding"),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                wedyes = true;
                                print("Yes");
                              },
                              child: Text("Yes")),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  wedyes = false;
                                });

                                print("NO");
                              },
                              child: Text("NO")),
                        ],
                      ),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.only(
                          top: 8,
                          left: 16,
                        ),
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildSpecificationCar(
                                "Color", widget.car.color.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 90,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Book this car',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("months");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Time_location(
                                      pack: package,
                                      price: pp,
                                      car1: widget.car.carName),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  String pp = "";
  String package = "";
  Widget buildPricePerPeriod(String months, String price, bool selected) {
    return GestureDetector(
      onTap: () {
        package = months;
        print("This package is selected: $package");
        pp = price;
        print("Package is selected $pp");
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width * 0.27,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : Colors.white,
          borderRadius: const BorderRadius.all(
            const Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey,
            width: selected ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              months,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              price,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "PKR",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
