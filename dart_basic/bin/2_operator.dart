void main() {
  // Arithmetic operators
  int a = 10;
  int b = 5;
  print('Addition: ${a + b}');        // 15
  print('Subtraction: ${a - b}');     // 5
  print('Multiplication: ${a * b}');   // 50
  print('Division: ${a / b}');        // 2.0
  print('Integer division: ${a ~/ b}'); // 2
  print('Modulus: ${a % b}');         // 0
  
  // Increment/Decrement operators
  int x = 5;
  print('x++: ${x++}');              // 5 (prints then increments)
  print('x: $x');                     // 6
  print('++x: ${++x}');              // 7 (increments then prints)

  print('x--: ${x--}');              // 7 (prints then decrement)
  print('x: $x');                     // 6
  print('--x: ${--x}');              // 5 (decrement then prints)
  
  // Comparison operators
  print('Equal to: ${a == b}');       // false
  print('Not equal: ${a != b}');      // true
  print('Greater than: ${a > b}');    // true
  print('Less than: ${a < b}');       // false
  
  // Logical operators
  bool isTrue = true;
  bool isFalse = false;
  print('AND: ${isTrue && isFalse}'); // false
  print('OR: ${isTrue || isFalse}');  // true
  print('NOT: ${!isTrue}');           // false
}