import 'package:carsapp/models/car.dart';
import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {

  Car car;
  CarPage(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
      ),
      body: _body(),
    );
  }

  _body() => Center(child: Image.network(car.urlPicture));
}
