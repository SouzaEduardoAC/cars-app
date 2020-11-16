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
    _initTabs();
  }

  _initTabs() async {
    int tabIndex = await Prefs.getInt("tabIndex");
    _tabController = TabController(length: 3, vsync: this);
    setState(() {
      _tabController.index = tabIndex;
    });
    _tabController.addListener(() {
      Prefs.setInt("tabIndex", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        bottom: _tabController == null ?  null :
        TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'Classic',),
            Tab(text: 'Sportive',),
            Tab(text: 'Luxury',),
          ],
        ),
      ),
      drawer: NavDrawer(),
      body: _tabController == null ?  null :
      TabBarView(
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
