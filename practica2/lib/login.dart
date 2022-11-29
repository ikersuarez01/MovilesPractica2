import 'dart:convert';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:practica2/main.dart';
import 'package:practica2/mainMenu.dart';
import 'package:flutter/services.dart';
import 'package:practica2/login.dart';
import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:practica2/user.dart';
import 'ajustes.dart';

bool a = false;
TextEditingController _nombre = TextEditingController();
String finalUserName = "";
bool changeCat = false;

class login extends StatefulWidget {
  login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  //#region Actualizar Texto
  void ActualizarTexto(){
    setState(() {
      if(_nombre.text.length >= 3){
        changeCat= true;
      } else {
        changeCat= false;
      }
    });
  }
  //#endregion

  //#region Username space
  Widget usernameSpace(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.24, right:MediaQuery.of(context).size.width * 0.20 ),
      child: TextFormField(
          controller: _nombre,
          onChanged: (_nombre){
            ActualizarTexto();
          },
          textAlign: TextAlign.start,
          keyboardType: TextInputType.name,
          style: TextStyle(fontFamily: 'Counter new'),
          maxLength: 10,
          decoration: InputDecoration(
              hintText: "Username *", fillColor: Colors.black, filled: false)),
    );
  }
  //#endregion

  //#region Boton Continuar
  Widget botonContinuar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.65),
      child: IconButton(
        icon: Image.asset('assets/flecha_login.png'),
        iconSize: 150.0,
        onPressed: () {
          if(changeCat){
            finalUserName = _nombre.text;
            ui.play(AssetSource('botones.mp3'));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mainMenu()),
            );
          }
        },
      )
    );
  }
  //#endregion

  //#region Texto Advertencia
  Widget messageText() {
    if (!changeCat) {
      return Text(
        'PLEASE ENTER AT LEAST 3 CHARACTERS',
        selectionColor: Colors.pink,
        textScaleFactor: 1.5,
        textAlign: TextAlign.center,
      );
    } else {
      return Text('');
    }
  }
  //#endregion

  //#region boton opciones
  Widget botonOpciones(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 100),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Image.asset('assets/botonajustes.png'),
            iconSize: 80.0,
            onPressed: () {
              ui.play(AssetSource('botones.mp3'));
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ajustes()));
            },
          ),
        ],
      ),
    );
  }
  //#endregion

  //#region Botonhome
  Widget botonHomeOpciones() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: IconButton(
              icon: Image.asset('assets/home.png'),
              iconSize: 100,
              onPressed: (){
                ui.play(AssetSource('botones.mp3'));
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
          ),
          Container(
            child: IconButton(
              icon: Image.asset('assets/boton_ajustes.png'),
              iconSize: 100,
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
  //#endregion

  //#region BODY
  Widget body() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fondo_1_claro.png'),
              fit: BoxFit.cover,
            )),
        child:Container(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: changeCat?AssetImage('assets/login_gato_saludando.png'):AssetImage('assets/login_gato_pensativo.png'),
                fit: BoxFit.contain,
              )),
          child: Column(
            children: <Widget>[
              botonHomeOpciones(),
                Container(
                  alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.50),
                usernameSpace(context),
                botonContinuar(context),
              Expanded(child: messageText()),
            ],
          ),
        )
    );
  }
  //#endregion

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //estructura pantalla: AppBar y body
      body: body(),
    );
  }
}






