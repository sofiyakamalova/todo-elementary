import 'package:elementary/elementary.dart';
import 'package:practice_app/service/model/todo.dart';
import 'package:practice_app/service/todo_service.dart';

class TodoScreenModel extends ElementaryModel {
  final TodoService _todoService;

  TodoScreenModel(this._todoService);

  Future<List<Todo>?> getTodos() async {
    return _todoService.getTodos();
  }
}
