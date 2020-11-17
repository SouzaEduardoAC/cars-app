import 'package:carsapp/models/user.dart';
import 'package:carsapp/pages/login.dart';
import 'package:carsapp/utils/route.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<User>(
              future: User.get(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.data != null ? _header(snapshot.data): Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favorites'),
              subtitle: Text('more info...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              subtitle: Text('more info...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('item 1');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => _logout(context),
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _header(User user) {
    return UserAccountsDrawerHeader(
            accountName: Text(user.nome),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.urlFoto),
            ),
          );
  }

  _logout(BuildContext context) {
    User.clear();
    Navigator.pop(context);
    pushReplacement(context, LoginPage());
  }
}