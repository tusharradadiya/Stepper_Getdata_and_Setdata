
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepper_app/home/provider/homeprovider.dart';
import 'package:stepper_app/home/view/HomePage.dart';

import 'final/view/finalpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {

          '/': (context) => Homepage(),
          'final': (context) => Setdata(),
        },
      ),
    ),
  );
}
