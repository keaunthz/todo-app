import 'package:flutter/material.dart';
import 'package:todos_app/domain/entities/todo.dart';
import 'package:todos_app/themes/todo_colors.dart';
import 'package:todos_app/themes/todo_typography.dart';

class ListViewWidget extends StatelessWidget {
  final bool loading;
  final List<Todo> todoList;
  final Function(int)? onDismissedItem;
  final Function(Todo?)? onEditItem;
  final Function(Todo)? onCheckedItem;

  const ListViewWidget({
    super.key,
    required this.loading,
    required this.todoList,
    this.onDismissedItem,
    this.onEditItem,
    this.onCheckedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 600,
      decoration: BoxDecoration(
        color: TodoColors.primary.shade50.withOpacity(0.1),
        borderRadius: BorderRadiusDirectional.circular(25),
        boxShadow: [
          BoxShadow(
            color: TodoColors.primary.shade50.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-5, -5),
              blurRadius: 15,
              spreadRadius: 1),
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            TodoColors.primary.shade200,
            TodoColors.primary.shade300,
            TodoColors.primary.shade400,
            TodoColors.primary.shade500,
          ],
        ),
      ),
      child: loading && todoList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : todoList.isEmpty
              ? Center(
                  child: Text(
                    'Add some tasks!',
                    style: TodoTypoGraphy.textBold(context),
                  ),
                )
              : ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final itemIndex = todoList[index];
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.redAccent.withOpacity(0.9),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        todoList.removeAt(index);
                        onDismissedItem?.call(itemIndex.id!);
                      },
                      // controller.deleteTodo(itemIndex.id ?? 0),
                      child: CheckboxListTile(
                        activeColor: TodoColors.primary.shade500,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        controlAffinity: ListTileControlAffinity.leading,
                        secondary: IconButton(
                          onPressed: () {
                            onEditItem?.call(itemIndex);
                            // controller.textcontroller.value.text =
                            //     itemIndex.title;
                            // goToAddOrEditPage(
                            //     AddOrEditType.edit, itemIndex);
                          },
                          icon: Icon(
                            Icons.create_outlined,
                            color: TodoColors.primary.shade700,
                            size: 20.0,
                          ),
                        ),
                        value: itemIndex.isDone,
                        title: Text(
                          itemIndex.title.toString(),
                          style: TodoTypoGraphy.textMedium(context),
                          maxLines: 2,
                        ),
                        onChanged: (bool? value) {
                          final item = todoList[index].copyWith(isDone: value);
                          onCheckedItem?.call(item);
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
