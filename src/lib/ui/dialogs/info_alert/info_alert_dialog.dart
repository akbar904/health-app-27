import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class InfoAlertDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(request.description ?? ''),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => completer(DialogResponse(confirmed: true)),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}