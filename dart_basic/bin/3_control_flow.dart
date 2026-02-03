import 'dart:io';

void main() {
  // Simple if-else example

  stdout.write("enter your age: ");
  int age = int.parse(stdin.readLineSync()!);

  // int age = 18;

  if (age >= 18) {
    print('You are an adult');
  } else {
    print('You are a minor');
  }

  // Multiple conditions with else-if
  int score = 85;

  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 80) {
    print('Grade: B');
  } else if (score >= 70) {
    print('Grade: C');
  } else {
    print('Grade: D');
  }

  // Switch case example
  String day = 'Monday';

  switch (day) {
    case 'Monday':
      print('Start of work week');
      break;
    case 'Friday':
      print('End of work week');
      break;
    case 'Saturday':
    case 'Sunday':
      print('Weekend!');
      break;
    default:
      print('Regular work day');
      break;
  }
}
