import 'package:flutter/material.dart';

class Button extends StatelessWidget {
   const Button(
      {required this.text,
      this.big,
      this.color = normal,
      this.textcolor = white,
      required this.cb,
      super.key});
  final String text;
  final bool? big;
  final Color? color;
  final Color textcolor;
  final void Function(String) cb;

  static const textblack = Colors.black;
  static const white = Colors.white;
  static const dark = Color.fromRGBO(46, 45, 45, 1);
  static const normal = Color.fromRGBO(112, 112, 112, 1);
  static const operation = Color.fromRGBO(235, 144, 24, 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big == null ? 1 : 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360))),
          onPressed: () {cb(text);},
          child: Text(
            text,
            style: TextStyle(
                color: textcolor, fontSize: 45, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
