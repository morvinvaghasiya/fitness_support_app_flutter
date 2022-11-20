import 'package:flutter/material.dart';

import '../res/palette.dart';

class Btn extends StatelessWidget {
  final Size size;
  final String title;
  final Function func;
  final Color color;

  const Btn({Key key, this.size, this.title, this.func, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color ?? Palette.constColor1,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          func();
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: size.height * 0.020),
          child: Text(
            title,
            style: TextStyle(
              fontSize: size.width * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}
