import 'package:flutter/material.dart';

class TextformWidget extends StatelessWidget {
  const TextformWidget({super.key, required this.hintText, required this.labelText, required this.ctrl, required this.keyboardType});

final TextEditingController ctrl;
final String hintText;
final String labelText;
final  keyboardType;

  @override
  Widget build(BuildContext context) {
    return     TextFormField(
                  controller:ctrl ,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(19),
                        borderSide: BorderSide(color: Colors.black)
                      ),
                      hintText: hintText,
                      labelText: labelText,

                      ),
                      keyboardType: keyboardType,
                );
  }
}