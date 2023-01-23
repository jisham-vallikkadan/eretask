import 'package:eretask/screens/loginpage.dart';
import 'package:eretask/screens/productpage.dart';
import 'package:eretask/service/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TestProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        home: Loginpage(),
      ),
    );
  }
}
