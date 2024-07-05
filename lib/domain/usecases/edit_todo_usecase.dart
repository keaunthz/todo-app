import 'package:todos_app/domain/entities/todo.dart';
import 'package:todos_app/domain/repositories/todo_repository.dart';
import 'package:todos_app/utils/data_state.dart';
import 'package:todos_app/utils/usecase.dart';

class EditTodoUsecase implements UseCase<DataState<Todo>, Todo> {
  final TodoRepository repository;
  EditTodoUsecase(this.repository);

  @override
  Future<DataState<Todo>> call({Todo? param}) {
    return repository.editTodo(
      param ?? Todo(title: '', isDone: false),
    );
  }
}
