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
     decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/fondoinicio.png'),
          fit: BoxFit.cover
      )
    ),
    child: 
    Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
              TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/flechamainmenu.png'),
              )] ),
          ),
        Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
          ),
        Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
              onPressed: () {
                //Boton de nivel de volumen
              },
              child: SizedBox(
                width: 350,
                child: Image.asset('assets/levelvolume.png'),
              )
              )] ),
          ), 
        Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
              onPressed: () {
                //silenciar
              },
              child: Image.asset('assets/soundoff.png')
            ),
              TextButton(
              onPressed: () {
                //poner sonido
              },
              child: Image.asset('assets/soundon.png')
            ),
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
          ), 
      ],
    )
  );
}