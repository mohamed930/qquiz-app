import 'package:flutter/material.dart';
import 'package:fluttertest/Extensions/HexColor.dart';

class text extends StatelessWidget {

  // MARK:- TODO:- this section For initialise new varible here.
  var title;

  //MARK:- TODO:- this constructor to pick text value.
  text({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title
    );
  }
}