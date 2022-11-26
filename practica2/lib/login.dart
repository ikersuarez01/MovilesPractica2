



import 'package:flutter/material.dart';
import 'package:practica2/mainMenu.dart';
import 'package:flutter/services.dart';


bool go=false;
class login extends StatefulWidget{


  login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>{


  @override
  Widget build(BuildContext context){
    return Scaffold(//estructura pantalla: AppBar y body
      body: body(context),

      );

  }
}

Widget body(BuildContext context){
  return  Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/Mesa de trabajo 1.png'),
          fit: BoxFit.cover,


      )
    ),

      child: Center(
        child: Column(
          mainAxisAlignment :MainAxisAlignment.center,

          children: <Widget>[

            usernameSpace(context),
            botonContinuar(context),
          ],

      ),
      ),


  );

}

/*Widget username(){
      return Container(

        child: Text("Inicia Sesión",
          style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
  ),
  ),
  );

}*/

Widget usernameSpace(BuildContext context){
  return Container(
padding: EdgeInsets.only(left: 90,right: 90,top:383),
      child: TextFormField(

        textAlign: TextAlign.start,

          keyboardType: TextInputType.name,


    style: TextStyle(
      fontFamily: 'Counter new'
    ),
          maxLength: 10,

          decoration: InputDecoration(

              hintText: "Usuario *",
              fillColor: Colors.black,
              filled: false
          )

      ),
  );

}

Widget botonContinuar(BuildContext context){

  return Container(

padding: EdgeInsets.only(top:0,left: 300),
    child: IconButton(
      icon:  Image.asset('assets/flecha_login.png'),
      iconSize: 150.0,

      onPressed: () {

  Navigator.push(
    context,


    MaterialPageRoute(builder: (context) => mainMenu()),
  );
}


      ),




    );



}




