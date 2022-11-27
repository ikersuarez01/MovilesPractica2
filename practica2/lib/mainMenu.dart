import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practica2/MainGame.dart';
import 'package:practica2/ajustes.dart';
import 'package:practica2/dificultad.dart';

class mainMenu extends StatefulWidget{
  mainMenu({super.key});

  @override
  _mainMenuState createState() => _mainMenuState();
}

class _mainMenuState extends State<mainMenu>{
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
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
              onPressed: () {
                Navigator.pop(context); //vuelve a pantalla anterior
              },
              child: SizedBox(
                width: 0.5,
                height: 0.5,
                child: Image.asset('assets/flechamainmenu.png'),
              )
            ),
              TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ajustes()), //navega a pantalla de ajustes
            );
              },
              child: SizedBox(
                width: 0.5,
                height: 0.5,
                child: Image.asset('assets/botonajustes.png'),
              )
            ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 0.5,
                height: 0.5,
                child: Image.asset('assets/titulojuego.png'),
              )
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dificultad()),
            );
              },
              child: SizedBox(
                width: 0.5,
                height: 0.5,
                child: Image.asset('assets/play.png'),
              ),  
            ),
          TextButton(
              onPressed: () {
                //Navigator.pop(context); //vuelve atrás, si fuera la primer pantalla saldría de la app
                exit(0); //cierra la app pero es como si tirara del cable, no se si nos servirá para persistencia
              },
              child: SizedBox(
                width: 0.5,
                height: 0.5,
                child: Image.asset('assets/exit.png'),
              )
            ),
        ],
      ),
    ),
  );
}