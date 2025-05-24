import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  final String? id;
  final double amount;
  final String category;
  final DateTime date;

  Expense({
    this.id,
    required this.amount,
    required this.category,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {'amount': amount, 'category': category, 'date': date};
  }

  factory Expense.fromMap(Map<String, dynamic> map, String docId) {
    return Expense(
      id: docId,
      amount: map['amount'],
      category: map['category'],
      date: (map['date'] as Timestamp).toDate(),
    );
  }
}
