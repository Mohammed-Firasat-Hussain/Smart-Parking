import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smartparking/Info.dart';
import 'package:smartparking/profile.dart';
import 'package:smartparking/slots.dart';
import 'package:smartparking/update_slots.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SmartParking());
}

class SmartParking extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            return MyHomePage();
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _slots=0;
  final _database = FirebaseDatabase.instance.reference();
  @override
  void initState(){
    super.initState();
    _activateListeners();
  }
  
  void _activateListeners() {
    _database.child('Slots').onValue.listen((event) {
      final int slots = event.snapshot.value;
      setState(() {
        _slots= slots;
      });
    });
  }

  //void update() {
    //setState(() {
    //  _slots += 1;
    //});
   // DatabaseReference _testRef =
    //    FirebaseDatabase.instance.reference().child("Slots");
    //_testRef.set(_slots);
 // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Parking!'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            profile(),
            info(),
            slots(_slots),
            //updateSlots(update),
          ],
        ),
      ),
    );
  }
}
