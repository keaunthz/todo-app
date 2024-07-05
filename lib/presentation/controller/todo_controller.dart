import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:todos_app/domain/entities/todo.dart';
import 'package:todos_app/domain/usecases/add_todo_usecase.dart';
import 'package:todos_app/domain/usecases/delete_todo_usecase.dart';
import 'package:todos_app/domain/usecases/edit_todo_usecase.dart';
import 'package:todos_app/domain/usecases/get_todo_usecase.dart';
import 'package:todos_app/utils/data_state.dart';

class TodoController extends GetxController {
  final GetTodoUsecase getTodoUsecase;
  final AddTodoUseCase addTodoUseCase;
  final EditTodoUsecase editTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;

  TodoController({
    required this.getTodoUsecase,
    required this.addTodoUseCase,
    required this.editTodoUsecase,
    required this.deleteTodoUsecase,
  });

  final Rx<TextEditingController> textcontroller = TextEditingController().obs;

  final RxList<Todo> todoList = List<Todo>.empty().obs;
  final RxBool isLoading = false.obs;

  double get doneCount =>
      todoList.where((value) => value.isDone == true).length / todoList.length;
  double get percentDoneCount => doneCount;
  String get percentString => (percentDoneCount * 100).toStringAsFixed(0);
  bool get isDoneAllTask =>
      todoList.where((value) => value.isDone == true).length == todoList.length;
  String toDay = Jiffy.now().format(pattern: 'yMMMMd');

  @override
  void onInit() {
    fetchTodo();
    super.onInit();
  }

  Future fetchTodo() async {
    isLoading.value = true;
    final response = await getTodoUsecase.call();
    try {
      if (response is DataSuccess) {
        todoList.value = response.data ?? [];
      } else {
        Get.snackbar('Ops', 'Something went wrong please try again!');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future addTodo(String title) async {
    isLoading.value = true;
    final response = await addTodoUseCase.call(
      param: Todo(title: title, isDone: false),
    );
    try {
      if (response is DataSuccess) {
        await fetchTodo();
      } else {
        Get.snackbar('Ops', 'Something went wrong please try again!');
      }
    } finally {
      isLoading.value = false;
      Get.back();
    }
  }

  Future deleteTodo(int id) async {
    isLoading.value = true;
    final response = await deleteTodoUsecase.call(param: id);
    try {
      if (response is DataSuccess) {
        await fetchTodo();
      } else {
        Get.snackbar('Ops', 'Something went wrong please try again!');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future editTodo(Todo todo) async {
    isLoading.value = true;
    final response = await editTodoUsecase.call(param: todo);
    try {
      if (response is DataSuccess) {
        await fetchTodo();
      } else {
        Get.snackbar('Ops', 'Something went wrong please try again!');
      }
    } finally {
      isLoading.value = false;
      Get.back();
    }
  }
}
