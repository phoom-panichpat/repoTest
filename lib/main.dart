import 'package:firebase_connection_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String studentName, stuId, programId;
  late double studentGPA;

  getName(name) {
    studentName = name;
  }

  getID(id) {
    stuId = id;
  }

  getPID(pid) {
    programId = pid;
  }

  getGPA(gpa) {
    studentGPA = double.parse(gpa);
  }

  createData() {
    debugPrint('create');
  }

  readData() {
    debugPrint('read');
  }

  updateData() {
    debugPrint('update');
  }

  deleteData() {
    debugPrint('delete');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                onChanged: (String n) {
                  getName(n);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "id"),
                onChanged: (String sid) {
                  getID(sid);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "program id"),
                onChanged: (String pgId) {
                  getPID(pgId);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "gpa"),
                onChanged: (String sGPA) {
                  getGPA(sGPA);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        createData();
                      },
                      child: const Text('create')),
                  ElevatedButton(
                      onPressed: () {
                        readData();
                      },
                      child: const Text('read')),
                  ElevatedButton(
                      onPressed: () {
                        updateData();
                      },
                      child: const Text('update')),
                  ElevatedButton(
                      onPressed: () {
                        deleteData();
                      },
                      child: const Text('delete')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
