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

          ]
        )
      )
  )
  );


}



