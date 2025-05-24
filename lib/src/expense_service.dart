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
}
