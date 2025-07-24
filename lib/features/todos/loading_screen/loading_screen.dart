import 'package:flutter/material.dart';
import 'package:practice_app/features/todos/loading_screen/circle_loader.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleProgressLoader(),
        const SizedBox(height: 40),
        Text('Загрузка...'),
      ],
    );
  }
}
