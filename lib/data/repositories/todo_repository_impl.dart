import 'package:todos_app/data/database/todo_database.dart';
import 'package:todos_app/domain/entities/todo.dart';
import 'package:todos_app/domain/repositories/todo_repository.dart';
import 'package:todos_app/utils/data_state.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDatabase todoDatabase;

  TodoRepositoryImpl({required this.todoDatabase});
  @override
  Future<DataState<Todo>> addTodo(Todo todo) async {
    try {
      final response = await todoDatabase.create(todo);
      return DataSuccess(response);
    } on Exception catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteTodo(int id) async {
    try {
      final response = await todoDatabase.delete(id);
      return DataSuccess(response);
    } on Exception catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<Todo>> editTodo(Todo todo) async {
    try {
      final response = await todoDatabase.update(todo);
      return DataSuccess(response);
    } on Exception catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<Todo>>> getTodo() async {
    try {
      final response = await todoDatabase.getTodo();
      return DataSuccess(response);
    } on Exception catch (e) {
      return DataFailed(e.toString());
    }
  }
}
