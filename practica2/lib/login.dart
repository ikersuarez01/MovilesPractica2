



import 'package:flutter/material.dart';
import 'package:practica2/mainMenu.dart';
import 'package:flutter/services.dart';


final TextEditingController _userController = TextEditingController();
 String finalUserName="";
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

          mainAxisAlignment :MainAxisAlignment.start,

          children: <Widget>[
            botonOpciones(context),
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
padding: EdgeInsets.only(left: 90,right: 90,top:375),
      child: TextFormField(
        controller: _userController,
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

    child: Column(
      children: <Widget> [
        IconButton(
          icon: Image.asset('assets/flecha_login.png'),
          iconSize: 150.0,
          onPressed: () {
            if(_userController.text.length>=3){
              finalUserName=_userController.text;
              _userController.text="";

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainMenu()),
              );
            }else{
            messageError();
            //  Navigator.pop('a');
            }

          },


            )


      ],






      ),




    );



}
Widget messageError(){
  return Image.asset('hqdefault.jpg');
}

Widget botonOpciones(BuildContext context){

  return Container(

    padding: EdgeInsets.only(top:0,left: 300),

    child: Column(
      children: <Widget> [
        IconButton(
          icon: Image.asset('assets/botonajustes.png'),
          iconSize: 80.0,
          onPressed: () {



              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainMenu()),
              );
            },




        ),


      ],






    ),




  );



}

