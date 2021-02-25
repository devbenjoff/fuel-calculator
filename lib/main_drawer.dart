import 'package:flutter/material.dart';
import 'package:fuel_calculator/screens/reminders_screen.dart';
import 'package:fuel_calculator/screens/home_screen.dart';
import 'main.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile({@required this.listIcon, this.text});

  final String text;
  final IconData listIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(listIcon),
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      onTap: () {},
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
                    Text(
                      'Fuel Calculator',
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
            DrawerListTile(
              listIcon: Icons.add_alert,
              text: 'Reminders',
            ),
            DrawerListTile(
              listIcon: Icons.location_on_rounded,
              text: 'Trip Log',
            ),
            const Divider(
              height: 0.5,
            ),
            DrawerListTile(
              listIcon: Icons.bar_chart,
              text: 'Statistics',
            ),
            DrawerListTile(
              listIcon: Icons.show_chart_sharp,
              text: 'Charts',
            ),
            DrawerListTile(
              listIcon: Icons.map,
              text: 'Map',
            ),
            const Divider(
              height: 0.5,
            ),
            DrawerListTile(
              listIcon: Icons.credit_card,
              text: 'Cost stats',
            ),
            DrawerListTile(
              listIcon: Icons.show_chart,
              text: 'Cost charts',
            ),
            const Divider(
              height: 0.5,
            ),
            DrawerListTile(
              listIcon: Icons.report,
              text: 'Create Report',
            ),
            DrawerListTile(
              listIcon: Icons.settings,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
