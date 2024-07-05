import 'package:todos_app/domain/entities/todo.dart';
import 'package:todos_app/utils/data_state.dart';

abstract class TodoRepository {
  Future<DataState<List<Todo>>> getTodo();

  Future<DataState<Todo>> addTodo(Todo todo);

  Future<DataState<Todo>> editTodo(Todo todo);

  Future<DataState<bool>> deleteTodo(int id);
}
