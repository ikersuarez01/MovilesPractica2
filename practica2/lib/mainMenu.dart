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
    child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
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
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/titulojuego.png'),
            ],
          ),
          ),  
          Container(
            height: MediaQuery.of(context).size.height * 0.25
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Row (
              children:[TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dificultad()),
            );
              },
              child: Image.asset('assets/play.png'),
              )] ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            child: Row (
              children:[TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dificultad()),
            );
              },
              child: Image.asset('assets/exit.png'),
              )] ),
          ),
        ],
      ),
    );
  
}