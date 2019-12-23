import 'dart:convert';

import 'package:cocktailsapp/datakelompok.dart';
import 'package:cocktailsapp/drinkdetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

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
          title: Text("Cocktail App"),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
              Icons.search
              ),
            )
          ],
        ),
        drawer:  drawer(),
        body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                      leading: Hero(
                        tag: drink["idDrink"],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            drink["strDrinkThumb"] ??
                                "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg",
                          ),
                        ),
                      ),
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${drink["strDrink"]}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "${drink["idDrink"]}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrinkDetail(drink: drink),
                          ),
                        );
                      },
                    );
                  },
                )
              : CircularProgressIndicator(backgroundColor: Colors.white),
        ),
      ),
    );
  }

Widget drawer(){
  return Drawer(
          child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text(
                "Cafe Eudeka",textAlign: TextAlign.end,
                style: TextStyle(color: Colors.blue),
              ),
              accountEmail: new Text(
                "connect@eudeka.id",
                style: TextStyle(color: Colors.blue),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/images/bgg.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              currentAccountPicture: Image.asset("assets/images/eudeka.png"),
                  ),
          new ExpansionTile(
              leading: Icon(
                Icons.folder,
                color: Colors.lightBlue,
              ),
              title: new Text(
                "Minuman",
              ),
              trailing: Icon(
                Icons.arrow_drop_down
              ),
              children: <Widget>[
       new ListTile(
   
              title: new Text(
                "Minuman 1",
              ),
              trailing: Icon(
                Icons.arrow_right
              ),
              ),
                   new ListTile(
         
              title: new Text(
                "Minuman 2",
              ),
              trailing: Icon(
                Icons.arrow_right
              ),
              // onTap: () {
              //   Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => DeviceGroup()));
              // }
              ),

              ],
              ),
          new Divider(),
          ListTile(
              leading: Icon(Icons.info,
              color: Colors.lightBlue,
              ),
              title: new Text("About"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataKelompok()));
              }),
               new Divider(),
        
          new ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.lightBlue,
              ),
              title: new Text("Logout"),
              // onTap: () {
              //   Navigator.of(context)
              //       .push(MaterialPageRoute(builder: (context) => MyApp()));
              //   Navigator.of(context);
              // }
              ),
        ],
      )
      );
}

}
