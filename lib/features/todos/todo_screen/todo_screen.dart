import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/features/todos/error_screen/error_screen.dart';
import 'package:practice_app/features/todos/todo_screen/todo_screen_wm.dart';
import 'package:practice_app/features/todos/todo_screen/widgets/todo_screen_list.dart';
import 'package:practice_app/service/model/todo.dart';

class TodoScreen extends ElementaryWidget<TodoScreenWM> {
  const TodoScreen({
    Key? key,
    WidgetModelFactory<TodoScreenWM> wmFactory = createTodoScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(TodoScreenWM wm) {
    return Scaffold(
      body: EntityStateNotifierBuilder<List<Todo>?>(
        listenableEntityState: wm.currentState,
        errorBuilder: (_, __, ___) =>
            Center(child: ErrorScreen(onRetryPressed: wm.onRetryPressed)),
        loadingBuilder: (_, __) =>
            const Center(child: CircularProgressIndicator()),
        builder: (_, data) {
          if (data == null || data.isEmpty) {
            return const Center(child: Text('No todos available'));
          }
          return TodoScreenList(data: data);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => wm.loadSingleTodo('1'),
      ),
    );
  }
}
