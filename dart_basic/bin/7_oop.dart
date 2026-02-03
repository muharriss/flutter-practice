// Definisi kelas
class Hewan {
  String nama;
  int umur;

  // Konstruktor
  Hewan(this.nama, this.umur);

  // Method
  void bersuara() {
    print('Suara hewan pada umumnya');
  }
}

// Pewarisan
class Anjing extends Hewan {
  String ras;

  // Konstruktor dengan super
  Anjing(String nama, int umur, this.ras) : super(nama, umur);

  // Method override
  @override
  void bersuara() {
    print('Guk! Guk!');
  }

  // Method tambahan
  void mengambil() {
    print('$nama sedang mengambil bola!');
  }
}

void main() {
  // Membuat objek
  var anjingSaya = Anjing('Max', 3, 'Golden Retriever');

  // Mengakses properti dan method
  print('Nama: ${anjingSaya.nama}');
  print('Umur: ${anjingSaya.umur}');
  print('Ras: ${anjingSaya.ras}');
  anjingSaya.bersuara();
  anjingSaya.mengambil();
}
