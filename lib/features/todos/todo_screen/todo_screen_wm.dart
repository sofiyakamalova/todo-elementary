import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:practice_app/client/graph_client.dart';

import 'package:practice_app/features/todos/todo_screen/todo_screen.dart';
import 'package:practice_app/features/todos/todo_screen/todo_screen_model.dart';
import 'package:practice_app/service/model/todo.dart';
import 'package:practice_app/service/todo_service.dart';

import 'package:flutter/material.dart';

class TodoScreenWM extends WidgetModel<TodoScreen, TodoScreenModel>
    implements ITodoWm {
  final EntityStateNotifier<List<Todo>?> _currentState = EntityStateNotifier();

  @override
  ValueListenable<EntityState<List<Todo>?>> get currentState => _currentState;

  TodoScreenWM(TodoScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadTodos();
  }

  @override
  void onRetryPressed() => _loadTodos();

  Future<void> _loadTodos() async {
    try {
      _currentState.loading();
      final todo = await model.getTodos();
      _currentState.content(todo ?? []);
    } on Exception catch (err) {
      _currentState.error(err);
    }
  }

  Future<void> loadSingleTodo(String id) async {
    try {
      _currentState.loading();
      final todo = await model.getPostById(id);

      _currentState.content([todo]);
    } on Exception catch (err) {
      _currentState.error(err);
    }
  }
}

TodoScreenWM createTodoScreenWM(BuildContext _) {
  return TodoScreenWM(TodoScreenModel(TodoService(client)));
}

abstract class ITodoWm implements IWidgetModel {
  ValueListenable<EntityState<List<Todo>?>> get currentState;
  void onRetryPressed();
}
