import 'package:eretask/service/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override

  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordconrolelr = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TestProvider>(context,listen: false).getsproducts();
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<TestProvider>(context,listen: false);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome to',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'WhatsAppShop',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.black45, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                        hintText: 'Enter Email/Mobile Number',
                        filled: true,
                        fillColor: Colors.grey[400],
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordconrolelr,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye_rounded),
                        hintText: 'Enter Password',
                        filled: true,
                        fillColor: Colors.grey[400],
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.black),
                  child: TextButton(child: Text('Sign in',style: TextStyle(color: Colors.white),), onPressed: () {

                    provider.login({
                      'emailormobile':_emailcontroller.text,
                      'password':_passwordconrolelr.text
                    },context);
                  }),
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.red, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont Have an Account?',
                      style: TextStyle(color: Colors.grey[400], fontSize: 13,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      'REGISTER',
                      style: TextStyle(color: Colors.green, fontSize: 13,fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
