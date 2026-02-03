void main() {
  // List example
  List<String> fruits = ['apple', 'banana', 'orange'];
  print('\nList Example:');
  print('Original fruits: $fruits');
  fruits.add('mango');
  print('After adding mango: $fruits');
  fruits.remove('banana');
  print('After removing banana: $fruits');
  print('First fruit: ${fruits[0]}');
  print('List length: ${fruits.length}');

  for (var fruit in fruits) {
    print(fruit.toUpperCase());
  }

  // Set example
  Set<int> numbers = {1, 2, 3, 3, 4, 4, 5};
  print('\nSet Example:');
  print('Numbers set: $numbers'); // Duplicates are automatically removed
  numbers.add(6);
  print('After adding 6: $numbers');
  print('Contains 3? ${numbers.contains(3)}');

  // Map example
  Map<String, dynamic> student = {
    'name': 'John Doe',
    'age': 20,
    'grades': {'math': 90, 'science': 85, 'history': 88}
  };
  print('\nMap Example:');
  print('Student info: $student');
  print('Student name: ${student['name']}');
  print('Math grade: ${student['grades']['math']}');

  // Adding and updating map entries
  student['email'] = 'john@example.com';
  student['age'] = 21;
  print('Updated student info: $student');
}
