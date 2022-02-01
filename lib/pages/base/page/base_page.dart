import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePage {
  Widget buildTitle(BuildContext context, String txt) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Column(
        children: <Widget>[
          Text(
            txt,
            style: Theme.of(context).textTheme.headline1,
            textScaleFactor: 1.0,
          ),
        ],
      ),
    );
  }
}
