import 'package:flutter/material.dart';

import 'defaultTabController.dart';
import 'drawer.dart';

class Bars extends StatelessWidget {
  const Bars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
          ),
          titleTextStyle:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          backgroundColor: Colors.black87,
          title: const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Garbage Monitor',
                style: TextStyle(
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
        ),
        body: const DefaultTabWidget(),
      ),
    );
  }
}
