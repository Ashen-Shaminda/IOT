import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:soil_test/sensors.dart';

// import 'package:flutter/rendering.dart';
// import 'package:percent_indicator/percent_indicator.dart';\
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:soil_test/test_tab.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();

  final sensors = new Sensors();

  String CH4gas = '0';
  String humidity = '0';
  String temperature = '0';
  String CO2gas = '0';
  String pressure = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.blueGrey[900],
      body: FutureBuilder(
          future: _fApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                'Something Went Wrong',
                style: TextStyle(fontSize: 50),
              );
            } else if (snapshot.hasData) {
              return content();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget content() {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.reference().child('Sensors');
    // listen to firebase realtime database value.
    _testRef.onValue.listen((event) {
      setState(() {
        CH4gas = event.snapshot.value['CH4gas'].toString();
        CO2gas = event.snapshot.value['CO2gas'].toString();
        humidity = event.snapshot.value['humidity'].toString();
        temperature = event.snapshot.value['temperature'].toString();
        pressure = event.snapshot.value['pressure'].toString();
      });
    });
    return SafeArea(
      child: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(5),
        child: ListView(
          primary: true,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: 500,
                height: 230,
                child: Center(
                  child: Container(
                    child: Text(
                      'CH4 Gas Concentration (ppm)\n\n$CH4gas',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.4,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: 500,
                height: 230,
                child: Container(
                  child: Center(
                    child: Text(
                      'CHO Gas Concentration (ppm)\n\n$CO2gas',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.4,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: 500,
                height: 230,
                child: Container(
                  child: Center(
                    child: Text(
                      'Temperature\n\n$temperature C',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.4,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: 500,
                height: 230,
                child: Center(
                  child: Container(
                    child: Text(
                      'Humidity\n\n$humidity%',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.4,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: 500,
                height: 230,
                child: Center(
                  child: Container(
                    child: Text(
                      'Pressure\n\n$pressure',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
