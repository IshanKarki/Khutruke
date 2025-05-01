import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add Expense',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
