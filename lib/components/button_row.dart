import 'package:calculadora/components/button.dart';
import 'package:flutter/widgets.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow(this.buttons,{super.key}); 
  final List<Button> buttons;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons
          
        
      ),
    );
  }
}