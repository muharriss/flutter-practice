void main() {
  // Contoh try-catch dasar
  try {
    int hasil = 12 ~/ 0;  // Pembagian dengan nol
    print('Hasil: $hasil');  // Baris ini tidak akan dieksekusi
  } catch (e) {
    print('Error tertangkap: $e');
  }

  // Beberapa blok catch
  try {
    List<int> angka = [1, 2, 3];
    print(angka[10]);  // Indeks di luar jangkauan
  } on RangeError {
    print('Indeks berada di luar jangkauan yang valid');
  } on ArgumentError {
    print('Argumen tidak valid');
  } catch (e) {
    print('Error lainnya: $e');
  }

  // Try-catch-finally
  try {
    periksaUmur(-5);  // Melempar exception kustom
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Kode ini selalu dijalankan');
  }
}

// Exception Kustom
class UmurException implements Exception {
  String pesan;
  UmurException(this.pesan);
  
  @override
  String toString() => pesan;
}

// Fungsi yang melempar exception kustom
void periksaUmur(int umur) {
  if (umur < 0) {
    throw UmurException('Umur tidak boleh negatif');
  }
  print('Umur valid');
}