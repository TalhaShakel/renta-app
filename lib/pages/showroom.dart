import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renta/components/main_drawer.dart';
import 'package:renta/components/slider.dart';
import 'package:renta/components/tabsbar.dart';
import 'package:renta/pages/login_page.dart';
import 'package:renta/provider/cars_data_provider.dart';
import 'package:renta/services/shared_service.dart';
import 'package:renta/widgets/book_car.dart';
import 'package:renta/widgets/car_widget.dart';
import 'package:renta/widgets/constants.dart';
import 'package:renta/widgets/data.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

class Showroom extends StatefulWidget {
  @override
  _ShowroomState createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom>
    with SingleTickerProviderStateMixin {
  List<NavigationItem> navigationItems = getNavigationItemList();
  late NavigationItem selectedItem;

  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // FutureBuilder(
        //     future: SharedService.isLoggedIn(),
        //     builder: (c, AsyncSnapshot<bool> s) {
        //       print(s.data);
        //       if (!s.hasData) {
        //         return Center(
        //           child: CircularProgressIndicator(
        //             color: Color(0xFF1B6A65),
        //           ),
        //         );
        //       }
        //       return !s.data!
        //           ? Scaffold(
        //               body: Center(
        //                   // child: Column(
        //                   //   mainAxisAlignment: MainAxisAlignment.center,
        //                   //   children: [
        //                   //     Text(
        //                   //       'You are not logged in, please Login',
        //                   //       style: TextStyle(
        //                   //         fontSize: 20,
        //                   //       ),
        //                   //     ),
        //                   //     SizedBox(
        //                   //       height: 16,
        //                   //     ),
        //                   //     Padding(
        //                   //       padding: const EdgeInsets.symmetric(horizontal: 32.0),
        //                   //       child: Row(
        //                   //         children: [
        //                   //           Expanded(
        //                   //             child: ElevatedButton(
        //                   //               onPressed: () {
        //                   //                 Navigator.of(context).pushAndRemoveUntil(
        //                   //                     MaterialPageRoute(
        //                   //                         builder: (_) => LoginPage()),
        //                   //                     (route) => false);
        //                   //               },
        //                   //               style: ElevatedButton.styleFrom(
        //                   //                   shape: StadiumBorder()),
        //                   //               child: Padding(
        //                   //                 padding: const EdgeInsets.all(16.0),
        //                   //                 child: Text('Login'),
        //                   //               ),
        //                   //             ),
        //                   //           ),
        //                   //         ],
        //                   //       ),
        //                   //     ),
        //                   //   ],
        //                   // ),
        //                   ),
        //             )
        Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A65),
        elevation: 0,
        brightness: Brightness.light,
        title: Text(
          "Renta",
          style: GoogleFonts.muli(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.chat,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      drawer: const Main_Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: ComplicatedImageDemo(),
              ),
            ),
          ),
          // banner start

          // banner end
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FutureBuilder(
                  future: Provider.of<CarsDataProvider>(context).fetchData(),
                  builder: (context, snapshot) {
                    print('fetch : ' + snapshot.data.toString());
                    return snapshot.hasData
                        ? Column(
                            children: [
                              SizedBox(height: 300, child: TabsBar()
                                  // ListView(
                                  //   physics: const BouncingScrollPhysics(),
                                  //   scrollDirection: Axis.horizontal,
                                  //   children: buildDeals(),
                                  // ),
                                  ),
                            ],
                          )
                        : CircularProgressIndicator(
                            color: Color(0xFF1B6A65),
                          );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildDeals(context) {
    List<Widget> list = [];
    for (var i = 0; i < cars.length; i++) {
      list.add(GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookCar(car: cars[i])),
            );
          },
          child: buildCar(cars[i], i)));
    }
    return list;
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: <Widget>[
            selectedItem == item
                ? Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColorShadow,
                      ),
                    ),
                  )
                : Container(),
            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
