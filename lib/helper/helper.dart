

import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final text;
  final function;
  SubmitButton({this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: FlatButton(
          onPressed: function,
          child: Container(
            width: 200,
            height: 50,
            child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}




class AuthButton extends StatelessWidget {
  final text;
  final function;
  Color color;
  Color textcolor;
  AuthButton({this.text,this.function,this.color,this.textcolor=Colors.white,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: FlatButton(
          onPressed: function,
          child: Container(
            width: 160,
            height: 60,
            child: Center(child: Text(text,style: TextStyle(fontFamily: 'Montserrat',fontSize: 20,color: textcolor),)),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue,width: 1.0),
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class Back_Button extends StatelessWidget {
  const Back_Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 20),
      child: FlatButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(234,239,249,1),
          ),
          child: Center(child: Icon(Icons.arrow_back,size: 30.0,color: Colors.blue,)),
        ),
      ),
    );
  }
}

class UsefulButton extends StatelessWidget {
  final text;
  final Function function;
  UsefulButton({this.text,this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FlatButton(
        onPressed: function,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue,width: 1.0),
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
          ),
          child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),)),
        ),
      ),
    );
  }
}



class HeadingText extends StatelessWidget {

  final text1,text2;
  HeadingText({this.text1,this.text2});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text1,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(6, 70, 53, 1),
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                text2,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(6, 70, 53, 1),
                    fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TextFieldForm extends StatelessWidget {
  final text;
  final date;
  final textcontrol;
  final bool wadak;
  TextFieldForm({this.text,this.date,this.textcontrol,this.wadak=false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: textcontrol,
        onTap: date,
        obscureText: wadak,
        decoration: new InputDecoration(
          labelText: text,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: new BorderSide(
            ),
          ),
          //fillColor: Colors.green
        ),
        validator: (val) {
          if(val.length==0) {
            return "Field  cannot be empty";
          }else{
            return null;
          }
        },
        style: new TextStyle(
          fontFamily: "Montserrat",
        ),
      ),
    );
  }
}




