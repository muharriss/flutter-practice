import 'package:flutter/material.dart';
import 'package:todo_app/util/button_dialog_box.dart';

/// Widget stateless untuk menampilkan dialog box input task baru
/// Dialog ini berisi TextField untuk input dan tombol Save/Cancel
class DialogBox extends StatelessWidget {
  /// Controller untuk menangani text input dari user
  final controller;
  
  /// Callback function yang dipanggil ketika tombol Save ditekan
  VoidCallback onSave;
  
  /// Callback function yang dipanggil ketika tombol Cancel ditekan
  VoidCallback onCancel;
  
  /// Constructor dengan parameter yang diperlukan
  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      /// Memberikan border radius (sudut membulat) pada dialog box
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      
      /// Background color dialog dengan warna orange
      backgroundColor: Colors.orange[300],
      
      /// Konten utama dialog
      content: Container(
        height: 140,
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// TextField untuk input nama task baru
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add new task',
              ),
              controller: controller,
            ),
            
            /// Row yang berisi tombol Save dan Cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 10,
              children: [
                /// Tombol untuk menyimpan task
                ButtonDialogBox(onPressed: onSave, text: 'Save'),
                
                /// Tombol untuk membatalkan input
                ButtonDialogBox(onPressed: onCancel, text: 'Cancel'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}