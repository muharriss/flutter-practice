void main() {
  // Basic function
  void sayHello(String name) {
    print('Hello, $name!');
  }
  
  // Function with return value
  int add(int a, int b) {
    return a + b;
  }
  
  // Arrow syntax function
  int multiply(int a, int b) => a * b;
  
  // Function with optional parameter
  String greet(String name, [String? title]) => 
    title != null ? 'Hello $title $name!' : 'Hello $name!';
  
  // Function with named parameters4
  void printPersonInfo({
    required String name,
    int? age,
  }) {
    // Ternary operator
    String ageText = age != null ? 'is $age years old' : 'age unknown';
    print('$name $ageText');
  }

  
  // Testing the functions
  sayHello('John');                    // Hello, John!
  print(add(5, 3));                    // 8
  print(multiply(4, 2));               // 8
  print(greet('Alice'));               // Hello Alice!
  print(greet('Bob', 'Mr.'));         // Hello Mr. Bob!
  printPersonInfo(name: 'Carol');      // Carol age unknown
  printPersonInfo(name: 'Dave', age: 30); // Dave is 30 years old
}