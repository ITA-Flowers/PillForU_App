import 'package:flutter/material.dart';
import 'package:pillforu/screens/signIn.dart';

void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  static const String _title = 'PillForU';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home:SignIn(),
      
    );
  }
}
