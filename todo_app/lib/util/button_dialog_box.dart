import 'package:flutter/material.dart';

/// Widget stateless untuk tombol di dalam dialog box
/// Digunakan untuk tombol Save dan Cancel di DialogBox
class ButtonDialogBox extends StatelessWidget {
  /// Text yang ditampilkan pada tombol
  final String text;
  
  /// Callback function yang dipanggil ketika tombol ditekan
  VoidCallback onPressed;

  /// Constructor dengan parameter yang diperlukan
  ButtonDialogBox({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      /// Callback ketika tombol ditekan
      onPressed: onPressed,
      
      /// Warna background tombol
      color: Colors.orange,
      
      /// Text yang ditampilkan pada tombol
      child: Text(text),
    );
  }
}