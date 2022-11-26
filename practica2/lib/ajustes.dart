import 'package:flutter/material.dart';

class ajustes extends StatefulWidget{
  ajustes({super.key});

  @override
  _ajustesState createState() => _ajustesState();
}

class _ajustesState extends State<ajustes>{
  @override
  Widget build(BuildContext context){
    return Scaffold(//estructura pantalla: AppBar y body
      body: body(context),
      );
  }
}

Widget body(BuildContext context){
  return Container(
    child: Text("Pantalla Ajustes"),
  );
}