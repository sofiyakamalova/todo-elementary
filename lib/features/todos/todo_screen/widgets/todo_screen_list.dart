import 'package:flutter/material.dart';
import 'package:practice_app/service/model/todo.dart';

class TodoScreenList extends StatelessWidget {
  final List<Todo> data;

  const TodoScreenList({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,

      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data[index].name),
          subtitle: Text(data[index].description),
        );
      },
    );
  }
}
