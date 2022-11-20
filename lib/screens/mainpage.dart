import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillforu/screens/logIn.dart';
import 'signIn.dart';
import 'adddose.dart';
import 'pupils.dart';
void main() => runApp(const Directions());
 
class Directions extends StatelessWidget {
  const Directions({Key? key}) : super(key: key);
 
  static const String _title = 'PillForU';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
              children: <Widget>[
                SizedBox(height: 40,),
                Container(
                  width: 100,
                  height: 200,
                  
                  child: Image.asset("assets/pill.png", fit: BoxFit.cover,)),
                Text("possible options:", style: GoogleFonts.secularOne(
                  fontSize: 35, fontWeight: FontWeight.w500,
                ),),SizedBox(height: 70,),
                // new dosage
                      GestureDetector(
                        onTap: ()
                        {
                          // final data = Data(cos: "Cos");
                          final String data = "cos";

                          Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>AddDose()));
                        },
                      child: Container(
                        width: 300,
                        height: 70,
                        decoration: BoxDecoration(
                          color:Color.fromARGB(255, 35, 151, 38),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(Icons.medical_information, color: Colors.white, size: 30,),
                        Text("New dosage", style:GoogleFonts.secularOne(fontSize: 20, color: Colors.white))
                      ]),
                      ),
                      ),
                      SizedBox(height: 25,),
                      // pupils
                       GestureDetector(
                        onTap: ()
                        {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>pupils()));
      
                        },
                      child: Container(
                        width: 300,
                        height: 70,
                        decoration: BoxDecoration(
                          color:Color.fromARGB(255, 184, 112, 4),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(Icons.add, color: Colors.white, size: 34,),
                        Text("      Pupils", style:GoogleFonts.secularOne(fontSize: 20, color: Colors.white))
                      ]),
                      ),
                      ),
                      SizedBox(height: 25,),
                      //log in
                       GestureDetector(
                        onTap: ()
                        {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>LogIn()));
      
                        },
                      child: Container(
                        width: 300,
                        height: 70,
                        decoration: BoxDecoration(
                          color:Color.fromARGB(255, 19, 100, 166),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(Icons.exit_to_app, color: Colors.white, size: 34,),
                        Text("    Log out", style:GoogleFonts.secularOne(fontSize: 20, color: Colors.white))
                      ]),
                      ),
                      ),
                    ],
          ),
        ),
      ),
    );
  }
}