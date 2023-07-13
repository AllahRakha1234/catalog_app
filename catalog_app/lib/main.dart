

import 'themes/theme.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:catalog_app/pages/cart_page.dart';

void main() {
  setPathUrlStrategy();
  runApp(
      VxState(
          store: MyStore(),
          child: MyApp()
      )
  );
}
  
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        MyRoutes.defaultRoute : (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Catalog App")),
        ),
    );
  }
}
