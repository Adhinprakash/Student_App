import 'package:flutter/material.dart';

snackBarwidget({required ctx,required title,required clr}){
ScaffoldMessenger.of(ctx).showSnackBar(
 SnackBar(duration: const Duration(seconds: 1),
     backgroundColor: clr,
     behavior: SnackBarBehavior.floating,
    content: Center(child: Text(title)) )
);
}