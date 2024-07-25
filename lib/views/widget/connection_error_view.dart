import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Network Connectivity Exception!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
