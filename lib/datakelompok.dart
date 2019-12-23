import 'package:flutter/material.dart';
import 'main.dart';

class DataKelompok extends StatelessWidget {
  const DataKelompok({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        myColor,
        Colors.lightBlue,
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
        title: Text("Kelompok 4"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
    ),
    body: Column(
      children: <Widget>[
        Container(
          //width: 200, height: 200,
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15.0, left: 20.0),
                width: 100, height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                  image: new DecorationImage(
                    image: new AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.contain,),),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: Text('Rifqi Dias',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,)),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15.0, left: 20.0),
                width: 100, height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                  image: new DecorationImage(
                    image: new AssetImage('assets/images/yy.jpg'),
                    fit: BoxFit.contain,),),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: Text('Agnes Hata',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,)),
              )
      ],
    ),
    ),
      ])
      ));
  }
}