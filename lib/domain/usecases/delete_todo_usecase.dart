import 'package:todos_app/domain/repositories/todo_repository.dart';
import 'package:todos_app/utils/data_state.dart';
import 'package:todos_app/utils/usecase.dart';

class DeleteTodoUsecase implements UseCase<DataState<bool>, int> {
  final TodoRepository todoRepository;
  DeleteTodoUsecase(this.todoRepository);

  @override
  Future<DataState<bool>> call({int? param}) {
    return todoRepository.deleteTodo(param ?? 0);
  }
}
