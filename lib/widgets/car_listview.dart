import 'package:carsapp/models/car.dart';
import 'package:carsapp/services/car.dart';
import 'package:flutter/material.dart';

class CarsListView extends StatefulWidget {
  final String carsType;

  CarsListView({this.carsType});

  @override
  _CarsListViewState createState() => _CarsListViewState();
}

class _CarsListViewState extends State<CarsListView> with AutomaticKeepAliveClientMixin<CarsListView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  _body() {
    return FutureBuilder(
        future: _getFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                ),
              ),
            );
          }
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return _listView(snapshot.data);
        });
  }

  Container _listView(List<Car> cars) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: cars != null ? cars.length : 0,
        itemBuilder: (context, index) {
          final car = cars[index];
          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      car.urlPicture,
                      width: 150,
                    ),
                  ),
                  Text(
                    car.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    car.description,
                    style: TextStyle(fontSize: 14),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Details'),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: const Text('Share'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _getFuture() {
    if (widget.carsType == 'classic') return CarService.getClassicCars();
    if (widget.carsType == 'sports') return CarService.getSportsCars();
    if (widget.carsType == 'luxury') return CarService.getLuxuryCars();
    return CarService.getCars();
  }

  @override
  bool get wantKeepAlive => true;
}
