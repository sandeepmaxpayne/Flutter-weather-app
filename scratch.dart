import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  print(task2());
  String result = await task2();
  task3(result);
}

void task1() {
  String result = 'Task 1 Data';
  print('task 1 complete');
}

Future<String> task2() async {
  String result;
  Duration threeSec = Duration(seconds: 3);
  await Future.delayed(threeSec, () {
    result = 'Task 2 Data';
    print('task 2 complete');
  });
  return result;
}

void task3(String taskRes) {
  String result = 'Task 3 Data';
  print('task 3 complete with $taskRes');
}
