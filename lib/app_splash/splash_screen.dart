//Not Used Yet

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget
{
  //const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('')
              )
            ),
          ),
          //Align() for Further use if Required, Otherwise remove Stack Widget.
        ],
      ),
    );
  }
}
