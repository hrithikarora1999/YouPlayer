
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/Signup.dart';
import 'package:yellowclass/Screens/VideoPlayer.dart';
import 'package:yellowclass/helper/helper.dart';
import 'package:yellowclass/helper/rough.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                      'YouPlayer',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(6, 70, 53, 1),
                          fontFamily: 'Montserrat'),
                    )),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(95.0),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      image: DecorationImage(image: AssetImage('images/play.png'),fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue,width: 1.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text('Welcome To YouPlayer',style: TextStyle(
                                    color: Colors.blue,fontSize: 20,fontFamily: "Montserrat"
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Stay Home Stay Safe',style: TextStyle(
                                    color: Colors.blue,fontSize: 20,fontFamily: "Montserrat"
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SubmitButton(text: 'YouPlayer',function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayer()));
                },),
              ),
              SubmitButton(text: 'Sign Out',function: ()async{
                 await _auth.signOut();
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
              },),

            ],
          ),
        ),
      ),
    );
  }
}
