
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/HomeScreen.dart';
import 'package:yellowclass/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'LoginScreen.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth=FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController=new TextEditingController();
  TextEditingController _EmailController=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

var _showSpinner=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                //Back_Button(),
                SizedBox(height: 10,),
                HeadingText(text1: 'Create new',text2: 'Account',),
                Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        TextFieldForm(text: 'Email',textcontrol: _EmailController,),
                        TextFieldForm(text: 'Password',textcontrol: _passwordController,wadak: true,),
                        UsefulButton(text: 'Sign Up',function: () async{
                          try{

                            final newuser=await _auth.createUserWithEmailAndPassword(email: _EmailController.text, password:_passwordController.text);
                            if(newuser!=null)
                            {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                              }
                          }
                          catch (e){
                            print(e);
                          }
                        },),
                        Text('Already Have an Account ?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,fontFamily: 'Montserrat'),),
                        UsefulButton(text: 'Sign In',function: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        },),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
