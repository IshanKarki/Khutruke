import 'package:flutter/material.dart';
import 'package:khutruke/screens/add_expense/views/add_expense.dart';
import 'package:khutruke/screens/add_expense/views/add_income.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);

          return StatefulBuilder(
            builder: (context, setState) {
              tabController.addListener(() {
                setState(() {}); // Rebuild when tab changes
              });

              Color selectedColor =
                  tabController.index == 0
                      ? Colors.red.shade900
                      : Colors.green.shade800;

              return Scaffold(
                appBar: AppBar(
                  title: Text('New Transaction'),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),

                                Icon(
                                  Icons.arrow_circle_up_rounded,
                                  color: Colors.red.shade900,
                                  size: 30,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Text('Expense'),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),

                                Icon(
                                  Icons.arrow_circle_down_rounded,
                                  color: Colors.green.shade800,
                                  size: 30,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Text('Income'),
                          ],
                        ),
                      ),
                    ],
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    // indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    indicator: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                body: TabBarView(children: [AddExpense(), AddIncome()]),
              );
            },
          );
        },
      ),
    );
  }
}
