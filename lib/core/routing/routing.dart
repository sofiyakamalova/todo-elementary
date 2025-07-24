//router configuration

import 'package:go_router/go_router.dart';
import 'package:practice_app/features/todos/todo_screen/todo_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => TodoScreen()),
    // GoRoute(
    //   path: '/details/:id',
    //   builder: (context, state) {
    //     final id = state.pathParameters['id'];
    //     final name = state.uri.queryParameters['name'];
    //     return DetailsPage(id: id!, name: name ?? 'No name');
    //   },
    // ),
  ],
);
