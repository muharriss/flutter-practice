import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Controller untuk menangani input text dari user di dialog box
  final _controller = TextEditingController();

  /// List yang menyimpan semua tugas todo
  /// Format setiap item: [nama_task (String), status_completed (bool)]
  List toDoList = [];

  /// Reference ke Hive box untuk penyimpanan data lokal persistente
  final box = Hive.box();

  /// Membuat data awal default jika aplikasi pertama kali dijalankan
  /// Menambahkan 2 contoh task ke dalam list
  void createInitialData() {
    toDoList = [
      ["Belajar Flutter", false],
      ["Joging", false],
    ];
  }

  /// Memuat data todo dari Hive database ke dalam variable toDoList
  void loadData() {
    toDoList = box.get('todolist');
  }

  /// Menyimpan/update data toDoList ke Hive database
  /// Dipanggil setiap kali ada perubahan pada list
  void updateDataBase() {
    box.put('todolist', toDoList);
  }

  /// Lifecycle method yang dipanggil saat widget pertama kali dibuat
  /// Mengecek apakah ada data yang sudah tersimpan, jika tidak membuat data awal
  @override
  void initState() {
    if (box.get('todolist') == null) {
      createInitialData();
    } else {
      loadData();
    }
    super.initState();
  }

  /// Fungsi untuk mengubah status checkbox task (completed/tidak completed)
  /// [value] - nilai checkbox (true/false)
  /// [index] - index task dalam list yang akan diubah
  void chekboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
    updateDataBase();
  }

  /// Menyimpan task baru yang diinput oleh user
  /// Membersihkan text controller setelah task disimpan
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    updateDataBase();
  }

  /// Menampilkan dialog box untuk input task baru
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  /// Menghapus task dari list berdasarkan index
  /// [index] - index task yang akan dihapus
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('TO DO'),
        centerTitle: true,
      ),
      
      /// Floating action button untuk menambah task baru
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
      
      /// ListView yang menampilkan semua task
      /// Membangun UI secara dinamis berdasarkan jumlah task dalam toDoList
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            onChanged: (value) => chekboxChanged(value, index),
            taskCompleted: toDoList[index][1],
            deleteTile: (value) => deleteTask(index),
          );
        },
      ),
    );
  }
}