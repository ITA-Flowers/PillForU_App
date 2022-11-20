import 'package:flutter/material.dart';
import 'package:pillforu/screens/signIn.dart';
import 'mainpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(const LogIn());
 
class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);
 
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

Future<void> login() async{
    Map<String, String> headers = {'Content-Type':'application/json', 'Accept':'/'};
    final msg = jsonEncode({"login":nameController.text, "password":passwordController.text});
    if(nameController.text.isNotEmpty && passwordController.text.isNotEmpty){
      var response = await http.post(Uri.parse("http://192.168.0.10:8080/login"),
      headers:headers,
      body:msg
      );
      if(response.statusCode == 200){
        Navigator.push(context, MaterialPageRoute(
        builder: (context)=>Directions()));
      }else{
        print("Złe dane logowania.");
      }
    }else{
      print("Wypelnij obydwa pola!");
    }
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 60,),
            Image.asset("assets/pill.png", height: 200, width: 80,),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
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
              GestureDetector(
                onTap: login,
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
                        Text("Log in" ,style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white)), 
                      ]),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>SignIn()));
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