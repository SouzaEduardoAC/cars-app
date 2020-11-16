import 'package:carsapp/utils/prefs.dart';
import 'package:carsapp/widgets/car_listview.dart';
import 'package:carsapp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    Future<int> future = Prefs.getInt("tabIdx");
    future.then((int tabIdx) => _tabController.index = tabIdx);

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'Classic',),
            Tab(text: 'Sportive',),
            Tab(text: 'Luxury',),
          ],
        ),
      ),
      drawer: NavDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _classicCars(),
          _sportsCars(),
          _luxuryCars(),
        ],
      ),
    );
  }

  _classicCars() => CarsListView(carsType: 'classic');

  _sportsCars() => CarsListView(carsType: 'sports',);

  _luxuryCars() => CarsListView(carsType: 'luxury',);
}
