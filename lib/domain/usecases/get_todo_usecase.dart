import 'package:todos_app/domain/entities/todo.dart';
import 'package:todos_app/domain/repositories/todo_repository.dart';
import 'package:todos_app/utils/data_state.dart';
import 'package:todos_app/utils/usecase.dart';

class GetTodoUsecase implements UseCase<DataState<List<Todo>>, Object> {
  final TodoRepository repository;
  GetTodoUsecase(this.repository);

  @override
  Future<DataState<List<Todo>>> call({Object? param}) {
    return repository.getTodo();
  }
}
