import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgColor = Colors.purple.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI App"),
        ),
        body: Container(
            color: bgColor,
            child: Center(
                child: Container(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BMI',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: wtcontroller,
                          decoration: InputDecoration(
                              label: Text('Enter weight in Kg'),
                              prefixIcon: Icon(Icons.line_weight)),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: ftcontroller,
                          decoration: InputDecoration(
                              label: Text('enter height in feets'),
                              prefixIcon: Icon(Icons.height)),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: incontroller,
                          decoration: InputDecoration(
                              label: Text('Enter height in inches'),
                              prefixIcon: Icon(Icons.height)),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              var wt = wtcontroller.text.toString();
                              var ft = ftcontroller.text.toString();
                              var inch = incontroller.text.toString();

                              if (wt != "" && ft != "" && inch != "") {
                                //bmi calculation
                                var iwt = int.parse(wt);
                                var ift = int.parse(ft);
                                var iInch = int.parse(inch);

                                var tInch = (ift * 12) + iInch;

                                var tcm = tInch * 2.54;

                                var tm = tInch / 100;

                                var bmi = iwt / (tm * tm);

                                var msg = "";

                                if (bmi > 25) {
                                  msg = "You are over weight";
                                  bgColor = Colors.red.shade300;
                                } else if (bmi < 18) {
                                  msg = "You are under weight";
                                  bgColor = Colors.red.shade200;
                                } else {
                                  msg = "You are healthy";
                                  bgColor = Colors.green.shade200;
                                }

                                setState(() {
                                  result =
                                      '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                                });
                              } else {
                                setState(() {
                                  result =
                                      'Please fill all the required fields';
                                });
                              }
                            },
                            child: Text('Calculate')),
                        Text(
                          result,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ))

                // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }
}
