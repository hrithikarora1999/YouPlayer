


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/Signup.dart';

import 'HomeScreen.dart';



class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  final _auth=FirebaseAuth.instance;
  User loggedinuser;
  @override
  void initState() {
    // TODO: implement initState

    getcurrentuser();

    super.initState();
  }
  Future<void> getcurrentuser() async {
    try{
      final user=await _auth.currentUser;
          if(user==null)
            Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup())));
          else
          {
            Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())));
          }
    }
    catch (e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width:200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("images/play.png"),fit: BoxFit.cover
                  )
              ),
            ),
          ),
          //SizedBox(height: 400,),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width:100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("images/stay.png"),fit: BoxFit.cover
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
