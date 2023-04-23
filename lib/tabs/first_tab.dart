import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:soil_test/sensors.dart';
import 'package:soil_test/test_tab.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();

  final sensors = new Sensors();

  String lightState = '0';
  String moisture = '0';
  String temperature = '0';
  String rainDrop = '0';

  int moistureLevel = 0;
  String lightLevel = '';
  int rainDropLevel = 0;
  double temperatur = 0;

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
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget content() {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.reference().child('sensors');
    // listen to firebase realtime database value.
    _testRef.onValue.listen((event) {
      setState(() {
        lightState = event.snapshot.value['lights state'].toString();
        moisture = event.snapshot.value['moisture state'].toString();
        temperature = event.snapshot.value['temperature state'].toString();
        rainDrop = event.snapshot.value['rain drop value'].toString();

        // moisture state
        // https://www.geeksforgeeks.org/soil-moisture-measurement-using-arduino-and-soil-moisture-sensor/
        moistureLevel = sensors.moisture(int.parse(moisture));

        // rain drop level
        rainDropLevel = sensors.rainDrop(int.parse(rainDrop));

        // temperature level

        //light state
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
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 15,
                        spreadRadius: 6,
                        offset: Offset(3, 4),
                      ),
                    ],
                  ),
                  width: 500,
                  height: 230,
                  child: Container(
                    child: Text(''),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15,
                      spreadRadius: 6,
                      offset: Offset(3, 4),
                    ),
                  ],
                ),
                width: 500,
                height: 230,
                child: CircularPercentIndicator(
                  header: const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Soil Temperature Level',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 2),
                    ),
                  ),
                  animation: true,
                  animationDuration: 1000,
                  radius: 150,
                  lineWidth: 20,
                  percent: 0.7,
                  center: Text(
                    '$temperature %',
                    style: const TextStyle(
                        fontFamily: 'Kanit-Bold.ttf',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 2),
                  ),
                  progressColor: Colors.black54,
                  backgroundColor: Colors.blueGrey.shade700,
                  circularStrokeCap: CircularStrokeCap.butt,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15,
                      spreadRadius: 6,
                      offset: Offset(3, 4),
                    ),
                  ],
                ),
                width: 500,
                height: 230,
                child: CircularPercentIndicator(
                  header: const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Rain Drop Level',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 2),
                    ),
                  ),
                  animation: true,
                  animationDuration: 1000,
                  radius: 150,
                  lineWidth: 20,
                  percent: (rainDropLevel / 10),
                  center: Text(
                    'Level\n${rainDropLevel}',
                    style: const TextStyle(
                        fontFamily: 'Kanit-Bold.ttf',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 2),
                    textAlign: TextAlign.center,
                  ),
                  progressColor: Colors.black54,
                  backgroundColor: Colors.blueGrey.shade700,
                  circularStrokeCap: CircularStrokeCap.butt,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15,
                      spreadRadius: 6,
                      offset: Offset(3, 4),
                    ),
                  ],
                ),
                width: 500,
                height: 230,
                child: Column(
                  children: [
                    Text(
                      'Light Intensity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    // Container(
                    //   child: Icon(
                    //     Icons.light_mode,
                    //     size: 100,
                    //     color: Colors.white,
                    //   ),
                    //   color: Colors.teal,
                    //   height: 200,
                    //   width: 350,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
