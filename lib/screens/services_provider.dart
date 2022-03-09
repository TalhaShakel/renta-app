import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:renta/screens/login.dart';
import 'package:renta/screens/splash_page.dart';

import 'singleperson.dart';

class ServicesProvider extends StatefulWidget {
  var serviceName;

  @override
  _ServicesProviderState createState() => _ServicesProviderState();
}

class _ServicesProviderState extends State<ServicesProvider> {
  var list = [];

  Future getList() async {
    final url = Uri.parse(
        'https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car');
    http.Response response = await http.get(url);

    var obj = json.decode(response.body);
    var ss = obj['data']['cars'];
    // print(ss);
    var ssd = ss;
    // print("hhh" + ssd.toString());

    var h = ssd[0]['packages'][0]['weekly'];

    if (response.statusCode == 200 || response.statusCode == 400) {
      print(h.toString());

      for (int i = 0; i < ssd.length; i++) {
        list.add({
          'id': ssd[i]['_id'],
          'modal': ssd[i]['model'],
          'image': ssd[i]['carImg'],
          'carName': ssd[i]['carName'],
          'color': ssd[i]['color'],
          'packages': ssd[i]['packages'],
        });
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: orangeColors,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: heightScreen * 0.9,
          width: widthScreen,
          child: list.isNotEmpty
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: heightScreen * 0.14,
                      width: widthScreen,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Single(
                                        name: list[index]['id'],
                                        image: list[index]['image'],
                                        cnic: list[index]['carName'],
                                        email: list[index]['modal'],
                                        contact: list[index]['color'],
                                        pack: list[index]["packages"],
                                        // serviceName: list[index]
                                        //     ['service_name'],
                                      )));
                        },
                        child: Card(
                          // elevation: 2.0,
                          // shadowColor: Colors.pink[600],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  "${list[index]['image']}",
                                  width: widthScreen * 0.18,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 50, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index]['modal'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text(
                                      //   list[index]['weekly'],
                                      //   style: TextStyle(
                                      //       fontSize: 20,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      Text(
                                        list[index]['carName'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
