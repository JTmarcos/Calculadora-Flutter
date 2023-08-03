import 'package:calculadora/components/button.dart';
import 'package:calculadora/components/button_row.dart';

import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard(this.cb,{super.key});
  final Function(String) cb;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 500,
      child: Column(children: [
        ButtonRow(
          [ 
            Button(text: 'AC',big: true,textcolor: Button.textblack,cb: cb,),
            Button(text: '%',textcolor: Button.textblack,cb: cb),
            Button(text: '÷',color: Button.operation,textcolor: Button.textblack,cb: cb),
            
            
          ],
        ),
        ButtonRow(
          [ 
            Button(text: '7',color: Button.dark,cb: cb),
            Button(text: '8',color: Button.dark,cb: cb),
            Button(text: '9',color: Button.dark,cb: cb),
            Button(text: 'X',color: Button.operation,cb: cb),
            
          ],
        ),
        ButtonRow(
          [ 
            Button(text: '4',color: Button.dark,cb: cb),
            Button(text: '5',color: Button.dark,cb: cb),
            Button(text: '6',color: Button.dark,cb: cb),
            Button(text: '-',color: Button.operation,cb: cb),
            
          ],
        ),
        ButtonRow(
          [ 
            Button(text: '1',color: Button.dark,cb: cb),
            Button(text: '2',color: Button.dark,cb: cb),
            Button(text: '3',color: Button.dark,cb: cb),
            Button(text: '+',color: Button.operation,cb: cb),
            
          ],
        ),
        ButtonRow(
          [ 
            Button(text: '0',big: true,color: Button.dark,cb: cb),
            Button(text: '.',color: Button.dark,cb: cb),
            Button(text: '=',color: Button.operation,cb: cb),
            
            
            
          ],
        ),
      ]),
    );
  }
}
