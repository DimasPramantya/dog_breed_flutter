import 'package:flutter/material.dart';

import '../utils/colors.dart';

void failedDialog(BuildContext context, String message){
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.warning,
          color: dangerColor,
          size: 80,
        ),
        title: const Text(
          'Login Failed',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: dangerColor,
                  foregroundColor: Colors.white),
              child: const Text('DISMISS'),
            ),
          ),
        ],
      ),
    );
}