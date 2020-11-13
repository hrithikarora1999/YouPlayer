
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yellowclass/helper/helper.dart';

import 'HomeScreen.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth=FirebaseAuth.instance;
  var wadak=false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordControllerl=new TextEditingController();
  TextEditingController _EmailControllerl=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

  }

 var _showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: _showSpinner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Back_Button(),
              HeadingText(text1: 'Welcome',text2: 'Back',),
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      TextFieldForm(text: 'Email',textcontrol: _EmailControllerl,),
                      TextFieldForm(text: 'Password',textcontrol: _passwordControllerl,wadak: true,),
                      UsefulButton(text: 'Sign In',function: ()async{
                        try{
                          setState(() {
                            _showSpinner=true;
                          });
                          final user=await _auth.signInWithEmailAndPassword(email:_EmailControllerl.text, password: _passwordControllerl.text);
                          if(user!=null)
                            { setState(() {
                              _showSpinner=false;
                            });
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                            }
                          else
                            {
                              setState(() {
                                wadak=true;
                              });
                            }
                        }
                        catch (e){
                          print(e);
                        }
                      },),
                      Visibility(
                          visible: wadak,
                          child: Text('Email or Password Incorrect',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,fontFamily: 'Montserrat'),)),

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

