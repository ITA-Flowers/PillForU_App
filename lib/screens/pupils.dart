import 'package:flutter/material.dart';
import 'mainpage.dart';

void main() => runApp(const pupils());
 
class pupils extends StatelessWidget {
  const pupils({Key? key}) : super(key: key);
 
  static const String _title = 'PillForU';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:Center(
      child: Column(
          children: <Widget>[
            Table(
              children:<TableRow>[
                TableRow(
                  
                  children: <Widget>[
                    
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Drug Name"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Pupil Login"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Device ID"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Ammount Of Pills"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Days"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Till when"),
                      ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Vitamin C"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("MyPupil1"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("13"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("2"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Thursday, Sunday"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text(DateTime.now().year.toString()+" "+DateTime.now().month.toString()+" "+DateTime.now().day.toString()),
                      ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Vitamin B"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("MyPupil2"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("12"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("1"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text("Sunday"),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                        ),
                        child: Text(DateTime.now().year.toString()+" "+DateTime.now().month.toString()+" "+DateTime.now().day.toString()),
                      ),
                  ],
                ),
              ],
            ),
                  Container(
                      height: 75,
                      width: 150,
                      margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Back to main page'),
                        onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>Directions()));

                        },
                      )
                  ),
                ],
      ),
    ),
    );
    
  }
}