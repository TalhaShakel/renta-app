import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://cdn.motor1.com/images/mgl/JvQ8Q/s1/2021-toyota-crown-update.jpg',
      'https://i.pinimg.com/originals/8f/95/6f/8f956f7ad2ff32b2a95bf26f5acbb789.jpg',
      'https://cdn.motor1.com/images/mgl/m7oYq/s3/2021-mercedes-benz-s-class.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWs8HxPNpa6hn26h6rk7u0z4ukfOnFE_rSxHmQXpnkcXDhCLPv1SpalvLtBbQcitmM8dY&usqp=CAU'
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
