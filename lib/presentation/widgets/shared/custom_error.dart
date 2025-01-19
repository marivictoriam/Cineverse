import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const CustomError({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Error',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.error_outline,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text('Intentar de nuevo'),
            ),
          ],
        ),
      ),
    );
  }
}
