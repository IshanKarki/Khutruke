import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'expense.dart';

//connects to firestore and points to 'expenses'
class ExpenseService {
  final _db = FirebaseFirestore.instance;
  final _collection = 'expenses';
  final user = FirebaseAuth.instance.currentUser;

  ExpenseService() {
    if (user == null) {
      print('User is not signed in!');
      // Optionally, throw an exception or handle unauthenticated state here
    }
  }

  //adds an expense to the Firestore and saves it
  Future<void> addExpense(Expense expense) async {
    final docRef = await _db.collection(_collection).add(expense.toMap());
    await docRef.update({'id': docRef.id});
  }

  //Stream expenses for real-time updates, and sorts by date latest first wise
  Stream<List<Expense>> getExpenses() {
    return _db
        .collection(_collection)
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Expense.fromMap(doc.data(), doc.id))
                  .toList(),
        );
  }

  //creating a date range from start to end of current month
  Future<double> getMonthlyTotal(DateTime now) async {
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 0);

    //filters documents between start and end to calculate for the monthly expenses
    final query =
        await FirebaseFirestore.instance
            .collection(_collection)
            .where('date', isGreaterThanOrEqualTo: start)
            .where('date', isLessThanOrEqualTo: end)
            .get();

    //sums up all expenses during that time period
    double monthlyTotal = 0;
    for (var doc in query.docs) {
      monthlyTotal += (doc['amount'] as num).toDouble();
    }

    return monthlyTotal;
  }

  //for daily
  Future<double> getDailyTotal(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(Duration(days: 1));

    final querySnapshot =
        await _db
            .collection(_collection)
            .where(
              'date',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay),
            )
            .where('date', isLessThan: Timestamp.fromDate(endOfDay))
            .get();

    double dailyTotal = 0.0;
    for (var doc in querySnapshot.docs) {
      dailyTotal += (doc['amount'] as num).toDouble();
    }

    return dailyTotal;
  }
}
