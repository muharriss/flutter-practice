import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// Widget stateless yang menampilkan satu item task dalam list
/// Menampilkan nama task, checkbox, dan action untuk menghapus (slide)
class ToDoTile extends StatelessWidget {
  /// Nama/judul dari task
  final String taskName;

  /// Status apakah task sudah selesai dikerjakan atau belum
  final bool taskCompleted;

  /// Callback function ketika user mengubah status checkbox
  /// Parameter value adalah nilai boolean checkbox yang baru
  Function(bool?)? onChanged;

  /// Callback function ketika user menghapus task dengan menggeser tile
  /// Parameter BuildContext digunakan jika diperlukan akses ke context
  Function(BuildContext)? deleteTile;

  /// Constructor dengan parameter yang diperlukan
  ToDoTile({
    super.key,
    required this.taskName,
    required this.onChanged,
    required this.taskCompleted,
    required this.deleteTile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      /// Memberikan padding pada sisi kiri, kanan, dan atas
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),

      /// Widget Slidable memungkinkan user untuk menggeser tile ke arah tertentu
      child: Slidable(
        /// Action pane yang muncul ketika tile digeser ke arah kanan (end)
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            /// Action untuk menghapus task
            SlidableAction(
              /// Callback ketika action delete ditekan
              onPressed: deleteTile,

              /// Warna background action (merah)
              backgroundColor: Colors.red.shade300,

              /// Icon yang ditampilkan
              icon: Icons.delete,

              /// Label untuk action
              label: 'Delete',

              /// Border radius sudut
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),

        /// Container yang merupakan tampilan utama tile
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),

          /// Row yang berisi checkbox dan nama task
          child: Row(
            children: [
              /// Checkbox untuk menandai task sebagai selesai/belum selesai
              Checkbox(value: taskCompleted, onChanged: onChanged),

              /// Text widget yang menampilkan nama task
              /// Jika task selesai, menampilkan strikethrough text
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
