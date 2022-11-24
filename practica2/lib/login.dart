import 'package:flutter/material.dart';

class login extends StatefulWidget{
  login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>{
  @override
  Widget build(BuildContext context){
    return Scaffold(//estructura pantalla: AppBar y body
      body: Center(
          child: portadaLogin(context)),
    );
  }
}
Widget portadaLogin(BuildContext context){
  return Container(
    child: Scaffold(
      body: Center(
        child: Column(
          children:[
            Image.asset('assets/login_gato_saludando.png'),
            SizedBox(height:20.0), _userTF(),
          ],
        )
      )
  )
  );


}

Widget _userTF() {
  return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              keyboardType: TextInputType.name,
            decoration: InputDecoration(
              icon: Image.asset('assets/logo.png',scale: 5.0),
              hintText: 'MichiTraviesa',
              labelText: 'USERNAME',

        ),
        ),

        );
      }
  );
}



