import 'package:flutter/material.dart';

enum DialogType { error, warning, info }

void showCustomDialog(BuildContext context, String message, DialogType type) {
  IconData icon;
  Color color;

  switch (type) {
    case DialogType.error:
      icon = Icons.error;
      color = Colors.red;
      break;
    case DialogType.warning:
      icon = Icons.warning;
      color = Colors.amber;
      break;
    case DialogType.info:
      icon = Icons.info;
      color = Colors.blue;
      break;
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Text(type.toString().split('.').last.toUpperCase()),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
