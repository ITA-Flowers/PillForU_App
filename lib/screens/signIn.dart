import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logIn.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() => runApp(const SignIn());
 
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
 
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? role = "caretaker";
  
Future<void> signin2() async{
    Map<String, String> headers = {'Content-Type':'application/json', 'Accept':'/'};
    final msg = jsonEncode({"login":nameController.text, "password":passwordController.text, "role":role , "phone_number":phoneNumberController.text});
    if(nameController.text.isNotEmpty && passwordController.text.isNotEmpty && phoneNumberController.text.isNotEmpty){
      var response = await http.post(Uri.parse("http://192.168.0.10:8080/register"),
      headers:headers,
      body:msg
      );
      if(response.statusCode == 201){
        Navigator.push(context, MaterialPageRoute(
        builder: (context)=>LogIn()));
      }else{
        print("Wrong registration data.");
      }
    }else{
      print("Fill all inputs");
    }
}

  
  String roleU="caretaker";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              
              Image.asset("assets/pill.png", width: 80, height: 200,),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
            
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10,10,10,20),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10,10,10,20),
                child: TextField(
                  maxLength: 9,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'phoneNumber',
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(value: "caretaker", groupValue: role, onChanged: (value){
                      setState(() {
                          roleU = value.toString();
                          role=value;
                      });
                    },
                  ),
                  Text("Caretaker"),
                  Radio(value: "pupil", groupValue: role, onChanged: (value){
                        setState(() {
                            roleU = value.toString();
                            role=value;
                        });
                      },
                  ),
                  Text("Pupil"),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              GestureDetector(
                onTap: signin2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: 200,
                    height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: 
                      Row(
                        
                        children: [
                        SizedBox(width: 30,),
                        Icon(Icons.supervised_user_circle, size: 45, color: Colors.white,),
                        SizedBox(width: 6,),
                        Container(
                          width: 2,
                          height: 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: 70,),
                        Text("Sign In" ,style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white)), 
                      ]),
                  ),
                ),
              ),
    
    
              Row(
                children: <Widget>[
                  const Text('Already have account?'),
                  TextButton(
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>LogIn()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}