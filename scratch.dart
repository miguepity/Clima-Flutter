import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task1 data';
  print('Task 1 complete.');
}

Future<String> task2() async {
  Duration threeSecond = Duration(minutes: 1);
  // sleep(threeSecond);
  String result = '';
  await Future.delayed(threeSecond, () {
    result = 'task 2 data';
    print('Task 2 completed');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 completed with $task2Data');
}
