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
  //final audioPlayer = audioPlayer();
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
          height: MediaQuery.of(context).size.height * 0.1, //titulo juego
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 300,
                child:Image.asset('assets/titulojuego.png'),
              ),
              
            ],
          ),
          ),  
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.30, //boton jugar
            width: MediaQuery.of(context).size.width,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextButton(
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
            height: MediaQuery.of(context).size.height * 0.20, //boton salir
            width: MediaQuery.of(context).size.width,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TextButton(
              onPressed: () {
                exit(0); //no se yo
              },
              child: Image.asset('assets/exit.png'),
              )] ),
          ),
        ],
      ),
    );
  
}