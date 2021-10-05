import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<bool> _selected = [true, false, false, false];
TextEditingController billController = TextEditingController();

double billAmount = 0.0;
double tipAmount = 0.0;
double totalBill = 0.0;
double tipPercent = 0.0;
int tipIndex = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Tip Calculator',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Text(
                'Enter bill amount',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(130, 0, 130, 0),
                child: TextFormField(
                  controller: billController,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: '\$0.00',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Choose tip',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ToggleButtons(
                  isSelected: _selected,
                  fillColor: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                  selectedColor: Colors.white,
                  children: [
                    Text('10%'),
                    Text('20%'),
                    Text('30%'),
                    Text('40%'),
                  ],
                  onPressed: (int selectIndex) {
                    for (var i = 0; i < _selected.length; i++) {
                      setState(() {
                        _selected[i] = selectIndex == i;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 38),
              Container(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    billAmount = double.parse(billController.text.trim());
                    tipIndex = _selected.indexWhere((element) => element);
                    tipPercent = [0.10, 0.20, 0.30, 0.40][tipIndex];

                    //performing calculations
                    setState(() {
                      tipAmount = double.parse(
                          (billAmount * tipIndex).toStringAsFixed(2));
                      totalBill = double.parse(
                          (billAmount + tipAmount).toStringAsFixed(2));
                    });
                  },
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Total Bill',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    '\$$totalBill',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'tip amount',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    '\$$tipAmount',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
