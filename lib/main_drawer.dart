import 'package:flutter/material.dart';
import 'package:fuel_calculator/screens/reminders_screen.dart';
import 'package:fuel_calculator/screens/home_screen.dart';
import 'main.dart';
import 'screens/map_screen.dart';
import 'screens/splash_screen.dart';
import 'constants.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile(
      {@required this.listIcon, @required this.text, @required this.onTap});

  final String text;
  final IconData listIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(listIcon),
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xff5e5d5b),
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('images/ic_launcher.png'),
                      height: 50,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FlatButton(
                      child: Text(
                        'Fuel Calculator',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              latitude: kLatitude,
                              longitude: kLongitude,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            DrawerListTile(
              listIcon: Icons.add_alert,
              text: 'Reminders',
              onTap: () {},
            ),
            DrawerListTile(
              listIcon: Icons.location_on_rounded,
              text: 'Trip Log',
              onTap: () {},
            ),
            const Divider(
              height: 0.5,
            ),
            DrawerListTile(
              listIcon: Icons.bar_chart,
              text: 'Statistics',
              onTap: () {},
            ),
            DrawerListTile(
              listIcon: Icons.show_chart_sharp,
              text: 'Charts',
              onTap: () {},
            ),
            DrawerListTile(
              listIcon: Icons.map,
              text: 'Map',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MapScreen(latitude: kLatitude, longitude: kLongitude),
                  ),
                );
              },
            ),
            DrawerListTile(
              listIcon: Icons.local_gas_station,
              text: 'Gas Station',
              onTap: () {},
            ),
            const Divider(
              height: 0.5,
            ),
            DrawerListTile(
              listIcon: Icons.credit_card,
              text: 'Cost stats',
              onTap: () {},
            ),
            DrawerListTile(
              listIcon: Icons.show_chart,
              text: 'Cost charts',
              onTap: () {},
            ),
            const Divider(
              height: 0.5,
            ),
            DrawerListTile(
              listIcon: Icons.report,
              text: 'Create Report',
              onTap: () {},
            ),
            DrawerListTile(
              listIcon: Icons.settings,
              text: 'Settings',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
