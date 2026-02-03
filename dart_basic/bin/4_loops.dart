void main() {
  // For loop example
  print('For Loop Example:');
  for (int i = 1; i <= 5; i++) {
    print('For loop iteration: $i');
  }
  
  print('\nFor Loop Example:');
  for (int i = 5; i >= 1; i--) {
    print('For loop iteration: $i');
  }
  
  // While loop example
  print('\nWhile Loop Example:');
  int count = 1;
  while (count <= 5) {
    print('While loop iteration: $count');
    count++;
  }
  
  // Do-while loop example
  print('\nDo-While Loop Example:');
  int num = 1;
  do {
    print('Do-while iteration: $num');
    num++;
  } while (num <= 5);
}