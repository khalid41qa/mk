import 'dart:io';

void main() {
  List<String> todoList = [];

  print("Welcome to the To-Do List Manager!");

  while (true) {
    print("\nChoose an option:");
    print("1. View tasks");
    print("2. Add a task");
    print("3. Delete a task");
    print("4. Exit");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        viewTasks(todoList);
        break;
      case "2":
        addTask(todoList);
        break;
      case "3":
        deleteTask(todoList);
        break;
      case "4":
        print("Goodbye!");
        exit(0);
      default:
        print("Invalid option. Please choose 1, 2, 3, or 4.");
    }
  }
}

void viewTasks(List<String> todoList) {
  if (todoList.isEmpty) {
    print("\nYour to-do list is empty.");
  } else {
    print("\nYour to-do list:");
    for (int i = 0; i < todoList.length; i++) {
      print("${i + 1}. ${todoList[i]}");
    }
  }
}

void addTask(List<String> todoList) {
  print("\nEnter the task you want to add:");
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    todoList.add(task);
    print("Task added successfully!");
  } else {
    print("Task cannot be empty.");
  }
}

void deleteTask(List<String> todoList) {
  if (todoList.isEmpty) {
    print("\nYour to-do list is empty. No tasks to delete.");
    return;
  }

  print("\nEnter the task number you want to delete:");
  viewTasks(todoList);

  String? input = stdin.readLineSync();
  int? taskNumber = int.tryParse(input!);

  if (taskNumber == null || taskNumber < 1 || taskNumber > todoList.length) {
    print("Invalid task number. Please try again.");
  } else {
    String removedTask = todoList.removeAt(taskNumber - 1);
    print("Task \"$removedTask\" deleted successfully!");
  }
}
