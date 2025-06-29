import 'package:flutter/material.dart';
import 'package:khutruke/screens/home/views/main_screen.dart';
import 'package:khutruke/src/expense.dart';

class AllTransactions extends StatefulWidget {
  final Stream<List<Expense>> expenseStream;

  const AllTransactions({super.key, required this.expenseStream});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Search transactions…',
            border: InputBorder.none,
          ),
          onChanged: (text) => setState(() => _query = text.toLowerCase()),
        ),
      ),
      body: StreamBuilder<List<Expense>>(
        stream: widget.expenseStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No transactions yet.'));
          }

          // filter locally
          final expenses = snapshot.data!
              .where((e) =>
                  e.category.toLowerCase().contains(_query) ||
                  e.amount.toString().contains(_query))
              .toList();

          if (expenses.isEmpty) {
            return const Center(child: Text('No matches.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, i) =>
                  buildTransactionTile(context, expenses[i]),
            ),
          );
        },
      ),
    );
  }
}
