import 'package:get/get.dart';
import 'package:todos_app/data/database/todo_database.dart';
import 'package:todos_app/data/repositories/todo_repository_impl.dart';
import 'package:todos_app/domain/repositories/todo_repository.dart';
import 'package:todos_app/domain/usecases/add_todo_usecase.dart';
import 'package:todos_app/domain/usecases/delete_todo_usecase.dart';
import 'package:todos_app/domain/usecases/edit_todo_usecase.dart';
import 'package:todos_app/domain/usecases/get_todo_usecase.dart';
import 'package:todos_app/presentation/controller/todo_controller.dart';

class AppsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoDatabase.instance);
    Get.lazyPut<TodoRepository>(
      () => TodoRepositoryImpl(todoDatabase: Get.find()),
    );

    Get.lazyPut(() => AddTodoUseCase(Get.find()));
    Get.lazyPut(() => GetTodoUsecase(Get.find<TodoRepository>()));
    Get.lazyPut(() => DeleteTodoUsecase(Get.find()));
    Get.lazyPut(() => EditTodoUsecase(Get.find()));
    Get.lazyPut(
      () => TodoController(
        addTodoUseCase: Get.find(),
        deleteTodoUsecase: Get.find(),
        editTodoUsecase: Get.find(),
        getTodoUsecase: Get.find(),
      ),
    );
  }
}
