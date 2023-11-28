import 'package:flutter/material.dart';

String url = 'http://34.125.9.63/api';

void showLoadingIndicator(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 20,
              ),
              Text(message),
            ],
          ),
        ),
      );
    },
  );
}
