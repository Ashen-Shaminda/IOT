import 'package:flutter/material.dart';

import '../tabs/second_tab.dart';
import 'bars.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      width: 300,
      elevation: 20.0,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.supervised_user_circle,
              size: 100,
              color: Colors.white,
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.white,
            endIndent: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'HOME',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Bars(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_chart_sharp,
              color: Colors.white,
            ),
            title: const Text(
              'AVERAGE DATA',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SecondTab(),
                ),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  thickness: 2,
                  color: Colors.white,
                  endIndent: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.login_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  title: Text(
                    'help',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Icon(
                      Icons.abc_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Garbage Monitoring App",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
