import 'package:flutter/material.dart';

class dificultad extends StatefulWidget{
  dificultad({super.key});

  @override
  _dificultadState createState() => _dificultadState();
}

class _dificultadState extends State<dificultad>{
  @override
  Widget build(BuildContext context){
    return Scaffold(//estructura pantalla: AppBar y body
      body: body(context),
      );
  }
}

Widget body(BuildContext context){
  return Container(
    child: Text("Pantalla Dificultad"),
  );
}