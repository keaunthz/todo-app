import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos_app/presentation/controller/todo_controller.dart';
import 'package:todos_app/presentation/views/add_or_edit_todo_view.dart';
import 'package:todos_app/presentation/widgets/list_view_widget.dart';
import 'package:todos_app/presentation/widgets/today_widget.dart';
import 'package:todos_app/themes/todo_typography.dart';

import '../../domain/entities/todo.dart';
import '../widgets/count_todo_widget.dart';

class ToDoListView extends GetView<TodoController> {
  const ToDoListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void goToAddOrEditPage(AddOrEditType addOrEditType, Todo? todo) {
      Get.to(
        () => AddOrEditPage(
          textControler: controller.textcontroller.value,
          callback: (value) {
            final todoEdit = todo?.copyWith(title: value);
            addOrEditType == AddOrEditType.add
                ? controller.addTodo(value!)
                : controller.editTodo(todoEdit!);
          },
          addOrEditType: addOrEditType,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My',
              style: TodoTypoGraphy.textHeader(context),
            ),
            Text(
              'Todo',
              style: TodoTypoGraphy.textHeader(context)
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TodayWidget(dateTime: controller.toDay),
                ),
                ListViewWidget(
                  loading: controller.isLoading.value,
                  todoList: controller.todoList,
                  onEditItem: (item) {
                    controller.textcontroller.value.text = item!.title;
                    goToAddOrEditPage(AddOrEditType.edit, item);
                  },
                  onCheckedItem: (item) {
                    controller.editTodo(item);
                  },
                  onDismissedItem: (id) {
                    controller.deleteTodo(id);
                  },
                ),
                Visibility(
                  visible: controller.todoList.isNotEmpty,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CountTodoWidget(
                        numOfTasks: controller.todoList.length.toString(),
                        percentDoneCount: controller.percentDoneCount,
                        percentIsDone: controller.percentString,
                        isDoneAllTask: controller.isDoneAllTask,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.textcontroller.value.clear();
          goToAddOrEditPage(AddOrEditType.add, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
