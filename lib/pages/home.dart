import 'package:carsapp/widgets/car_listview.dart';
import 'package:carsapp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cars'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Classic',),
              Tab(text: 'Sportive',),
              Tab(text: 'Luxury',),
            ],
          ),
        ),
        drawer: NavDrawer(),
        body: TabBarView(
          children: <Widget>[
            _classicCars(),
            _sportsCars(),
            _luxuryCars(),
          ],
        ),
      ),
    );
  }

  _classicCars() => CarsListView(carsType: 'classic');

  _sportsCars() => CarsListView(carsType: 'sports',);

  _luxuryCars() => CarsListView(carsType: 'luxury',);
}
