import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:math';

// import 'package:khutruke/data/data.dart';
import 'package:khutruke/screens/add_expense/views/categories.dart';
import 'package:khutruke/screens/add_expense/views/new_transaction.dart';
import 'package:khutruke/screens/home/views/all_transactions.dart';
import 'package:khutruke/screens/home/views/stat_screen.dart';
import 'package:khutruke/src/expense.dart';
import 'package:khutruke/src/expense_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

Widget buildTransactionTile(BuildContext context, Expense expense) {
  final icon = getCategoryIcon(expense.category);
  final color = getCategoryColor(expense.category);
  var formattedDate = DateFormat('MMM d').format(expense.date);

  String betterformattedDate() {
    if (DateFormat('MMM d').format(DateTime.now()) == formattedDate) {
      return formattedDate = 'Today';
    }
    if (DateFormat(
          'MMM d',
        ).format(DateTime.now().subtract(Duration(days: 1))) ==
        formattedDate) {
      return formattedDate = 'Yesterday';
    }
    return formattedDate;
  }

  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: const Offset(0, 2),
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    icon,
                  ],
                ),
                const SizedBox(width: 12),
                Text(
                  expense.category,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.arrowtriangle_up_fill,
                      color: Colors.red.shade900,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'NPR ${expense.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red.shade800,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Text(
                  betterformattedDate(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class _MainScreenState extends State<MainScreen> {
  // Add this line to define or get the expenseService instance
  final expenseService = ExpenseService();

  double monthlyTotal = 0.0;
  double todayTotal = 0.0;
  double yesterdayTotal = 0.0;

  @override
  void initState() {
    super.initState();
    // _loadData(); // Uncomment and implement _loadData() if needed
  }

  // void _loadData() async {
  //   final monthTotal = await expenseService.getMonthlyTotal(DateTime.now());
  //   final dailyToday = await expenseService.getDailyTotal(DateTime.now());
  //   final yesterday = await expenseService.getDailyTotal(
  //     DateTime.now().subtract(Duration(days: 1)),
  //   );
  //   if (!mounted) return;

  //   setState(() {
  //     monthlyTotal = monthTotal;
  //     todayTotal = dailyToday;
  //     yesterdayTotal = yesterday;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Expense>>(
          stream: expenseService.getExpenses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            //understand ! in both cases, you know how
            // print('Snapshot data: ${snapshot.data}');
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No transactions yet.'));
            }

            final expenses = snapshot.data;
            final now = DateTime.now();
            final yesterday = now.subtract(Duration(days: 1));
            final monthlyExpenses = (expenses ?? []).where(
              (e) => e.date.year == now.year && e.date.month == now.month,
            );

            final monthlyTotal = monthlyExpenses.fold(
              0.0,
              (sum, e) => sum + e.amount,
            );

            final todayTotal = (expenses ?? [])
                .where(
                  (e) =>
                      e.date.year == now.year &&
                      e.date.month == now.month &&
                      e.date.day == now.day,
                )
                .fold(0.0, (sum, e) => sum + e.amount);

            final yesterdayTotal = (expenses ?? [])
                .where(
                  (e) =>
                      e.date.year == yesterday.year &&
                      e.date.month == yesterday.month &&
                      e.date.day == yesterday.day,
                )
                .fold(0.0, (sum, e) => sum + e.amount);
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.amber[900],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Icon(
                                CupertinoIcons.person_fill,
                                size: 30,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome!",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),

                              Text(
                                "John Doe",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.calendar_today),
                            iconSize: 28,
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.bell_fill),
                            iconSize: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      //redirect to the insights or analytics screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatScreen()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                            Theme.of(context).colorScheme.tertiary,
                          ],
                          transform: const GradientRotation(pi / 4),
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey.shade700,
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Total Expenses this month',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'NPR ${monthlyTotal.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                        color: Colors.white30,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          CupertinoIcons.arrowtriangle_up_fill,
                                          size: 14,
                                          color: Colors.red.shade700,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Yesterday",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'NPR ${yesterdayTotal.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                        color: Colors.white30,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          CupertinoIcons.arrowtriangle_up_fill,
                                          size: 14,
                                          color: Colors.red.shade700,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Today's Expenses",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'NPR ${todayTotal.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transactions',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //redirect to all transactions
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (_) => AllTransactions(
                                    expenseStream: expenseService.getExpenses(),
                                  ),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(121, 91, 91, 91),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Text(
                              'View All',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: ListView.builder(
                      itemCount: expenses!.length,
                      itemBuilder: (context, int i) {
                        final expense = expenses[i];
                        return buildTransactionTile(context, expense);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTransaction()),
          );
        },
        elevation: 8,
        shape: const CircleBorder(),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: GradientRotation(pi / 4),
            ),
          ),
          child: Icon(CupertinoIcons.add),
        ),
      ),
    );
  }
}
