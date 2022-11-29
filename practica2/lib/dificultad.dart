import 'package:flutter/material.dart';
import 'package:practica2/MainGame.dart';
import 'package:practica2/ajustes.dart';

int dif = 1;

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
            width: MediaQuery.of(context).size.width,
            child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
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
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                child: Image.asset('assets/dificultad.png'),
              )
              
            ],
          ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2, //boton facil
            width: MediaQuery.of(context).size.width,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
              onPressed: () {
                dif = 0;
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
            width: MediaQuery.of(context).size.width,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
              onPressed: () {
                dif = 1;
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
            width: MediaQuery.of(context).size.width,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
              onPressed: () {
                dif = 2;
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