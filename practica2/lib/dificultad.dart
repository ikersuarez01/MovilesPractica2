import 'package:flutter/material.dart';
import 'package:practica2/MainGame.dart';
import 'package:practica2/ajustes.dart';

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
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/fondomenuinicial.png'),
          fit: BoxFit.cover
      )
    ),
    child: Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
              onPressed: () {
                Navigator.pop(context); //vuelve a pantalla anterior
              },
              child: Image.asset('assets/flechamainmenu.png')
            ),
              TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ajustes()), //navega a pantalla de ajustes
            );
              },
              child: Image.asset('assets/botonajustes.png')
            ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25, //dificultad
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/dificultad.png'),
            ],
          ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2, //boton facil
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaJuego()),
            );
              },
              child: Image.asset('assets/easy.png'),
              )
              ] 
              ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2, //boton medio
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaJuego()),
            );
              },
              child: Image.asset('assets/medium.png'),
              )
              ] 
              ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2, //boton dificil
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaJuego()),
            );
              },
              child: Image.asset('assets/hard.png'),
              )
              ] 
              ),
          ),
      ],
    ),
  );
}