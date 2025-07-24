import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback? onRetryPressed;

  const ErrorScreen({this.onRetryPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Error'),
        SizedBox(
          height: 56,
          width: 176,
          child: TextButton(
            onPressed: onRetryPressed,
            child: Text('Try again', style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff49A5C1),
              elevation: 10,

              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
