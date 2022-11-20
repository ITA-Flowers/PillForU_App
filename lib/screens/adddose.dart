import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logIn.dart';
import 'mainpage.dart';
import 'package:intl/intl.dart';
import 'mysql.dart';
void main() => runApp(const AddDose(data: '',));
 
class AddDose extends StatelessWidget {
  const AddDose({Key? key, required this.data}) : super(key: key);
 
  static const String _title = 'PillForU';
  final String data;
   
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
  
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  DateTime selectedData=DateTime.now();
  bool Monday=false;
  bool Tuesday=false;
  bool Wednesday=false;
  bool Thursday=false;
  bool Friday=false;
  bool Saturday=false;
  bool Sunday=false;
  TextEditingController date = TextEditingController();

  

final _formKey = GlobalKey<FormState>();
  String isChecked="Caretaker";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Text("fill in the form:", style: GoogleFonts.secularOne(fontSize: 30),),
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: 350,
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child:TextFormField(
                
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter name of drug';
                }
                return null;
              },
              decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name of drug',
                    ),
            ),
              ),
              SizedBox(height: 15,),
            Container(
              width: 350,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,                  
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of pills',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ammount of drugs';
                    }
                    return null;
                  },
                ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 350,
              height: 45,
              child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pupils Login',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter login of pupil';
                    }
                    return null;
                  },
                ),
            ),
              SizedBox(height: 15,),
              Container(
                width: 350,
                height: 45,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Id of device',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter id of device';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 15,),
              Padding(padding:EdgeInsets.fromLTRB(0, 0,0,20)),
              //Chose day when to give drug
              Text("Chose day when to give drug:", style: GoogleFonts.secularOne(fontSize: 23),),
              Padding(padding:EdgeInsets.fromLTRB(0, 0,0,30)),
              Row( 
                children: [
                  Checkbox(value: Monday, onChanged: (bool? value) {
                    setState(() {
                      Monday = value!;
                    });
                  },),
                  Text("Monday"),
                  Checkbox(value: Tuesday, onChanged: (bool? value) {
                    setState(() {
                      Tuesday = value!;
                    });
                  },),
                  Text("Tuesday"),
                  Checkbox(value: Wednesday, onChanged: (bool? value) {
                    setState(() {
                      Wednesday = value!;
                    });
                  },),
                  Text("Wednesday"),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: Thursday, onChanged: (bool? value) {
                    setState(() {
                      Thursday = value!;
                    });
                  },),
                  Text("Thursday"),
                  Checkbox(value: Friday, onChanged: (bool? value) {
                    setState(() {
                      Friday = value!;
                    });
                  },),
                  Text("Friday"),
                  Checkbox(value: Saturday, onChanged: (bool? value) {
                    setState(() {
                      Saturday = value!;
                    });
                  },),
                  Text("Saturday"),
                  
                ],
              ),
              Row(children: [
                  Checkbox(value: Sunday, onChanged: (bool? value) {
                    setState(() {
                      Sunday = value!;
                    });
                  },),
                  Text("Sunday"),
                  
              ],),
              Padding(padding:EdgeInsets.fromLTRB(0, 0,0,30)),
              //Text("Choose date till last dose",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20 ),),
              //DatePickerDialog(initialDate:DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2050), helpText: "",),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  showCursor: true,
                  readOnly: true,
                  controller: date,
                  decoration: InputDecoration(
                  icon:Icon(Icons.calendar_today_rounded),
                  labelText: "Choose date till last dose" ,
                  ),
                onTap:  () async {
                  DateTime? pickDate = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2012), 
                    lastDate: DateTime(2025), 
                    );
                  if(pickDate != null)
                  {
                      setState(() {
                        date.text = DateFormat('yyyy-MM-dd').format(pickDate);
                      });
                  }
                } ,
                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>Directions()));
                },
                
                child: Container(
                  width: 350,
                  height: 45,
                  decoration: BoxDecoration(
                    color:Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
               child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Icon(Icons.add, size: 25, color: Colors.white,),
                Container(width: 2, height: 20, color: Colors.white,),
                Text("Confirm new portion", style: GoogleFonts.secularOne(
                  fontSize: 18,color: Colors.white),),
               ],)
               ),
              )
            ],
            
          ),
          
        ), 
        ),
      ),
    );
    
    
    
  }
}