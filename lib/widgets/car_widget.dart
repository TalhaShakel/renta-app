import 'package:flutter/material.dart';
import 'package:renta/widgets/constants.dart';
import 'package:renta/widgets/data.dart';

Widget buildCar(Car car, int index) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                car.carName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          child: Center(
            child: Hero(
              tag: car.model,
              child: Image.network(
                car.carImg,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          car.model,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          car.model,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
      ],
    ),
  );
}
