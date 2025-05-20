import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  bool isWeekly = true;

  List<FlSpot> currentMonthSpots = [
    FlSpot(1, 2000),
    FlSpot(7.5, 2200),
    FlSpot(15, 2500),
    FlSpot(22.5, 1800),
    FlSpot(30, 2600),
  ];

  List<FlSpot> lastMonthSpots = [
    FlSpot(1, 2050),
    FlSpot(7.5, 1900),
    FlSpot(15, 2000),
    FlSpot(22.5, 2300),
    FlSpot(30, 2450),
  ];

  BarChartGroupData weeklyBars(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(2),
          width: 10,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5000,
            color: Colors.grey.shade200,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> barData() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return weeklyBars(0, 2200);
      case 1:
        return weeklyBars(1, 3000);
      case 2:
        return weeklyBars(2, 1200);
      case 3:
        return weeklyBars(3, 4600);
      case 4:
        return weeklyBars(4, 3800);
      case 5:
        return weeklyBars(5, 1900);
      case 6:
        return weeklyBars(6, 4000);
      default:
        return throw Error();
    }
  });

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 112, 112, 112),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('S', style: style);
        break;
      case 1:
        text = const Text('M', style: style);
        break;
      case 2:
        text = const Text('T', style: style);
        break;
      case 3:
        text = const Text('W', style: style);
        break;
      case 4:
        text = const Text('T', style: style);
        break;
      case 5:
        text = const Text('F', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(meta: meta, child: text);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final chartHeight = screenHeight * 0.25;

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Expenses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: chartHeight,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: FlGridData(show: true),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: currentMonthSpots,
                        isCurved: true,
                        color: Theme.of(context).colorScheme.primary,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                      ),
                      LineChartBarData(
                        spots: lastMonthSpots,
                        isCurved: true,
                        color: Colors.grey,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 800),
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Weekly Expenses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: chartHeight,
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: getTitles,
                        ),
                      ),
                    ),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    barGroups: barData(),
                  ),
                  duration: const Duration(milliseconds: 800),
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Top Spending Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(
                      Icons.smoking_rooms,
                      color: Colors.redAccent,
                    ),
                    title: const Text(
                      'Smoking',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const LinearProgressIndicator(
                      value: 1.0,
                      color: Colors.redAccent,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('NPR 1000'),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
            const Text(
              'Top Spending Categories compared to last month ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: chartHeight,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 30,
                        sections: [
                          PieChartSectionData(
                            value: 50,
                            title:
                                'Needs', //specific categories data rather than needs vs want vs savings
                            color: Theme.of(context).colorScheme.secondary,
                            radius: 50,
                          ),
                          PieChartSectionData(
                            value: 30,
                            title: 'Wants',
                            color: Theme.of(context).colorScheme.tertiary,
                            radius: 45,
                          ),
                          PieChartSectionData(
                            value: 20,
                            title: 'Savings',
                            color: Theme.of(context).colorScheme.primary,
                            radius: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: chartHeight,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 30,
                        sections: [
                          PieChartSectionData(
                            value: 60,
                            title: 'Needs',
                            color: Colors.green.shade200,
                            radius: 50,
                          ),
                          PieChartSectionData(
                            value: 25,
                            title: 'Wants',
                            color: Colors.orange.shade200,
                            radius: 45,
                          ),
                          PieChartSectionData(
                            value: 15,
                            title: 'Savings',
                            color: Colors.blue.shade200,
                            radius: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          //summaries
          //redirect to something closer to instagram stories to give a brief summary and overview of the user expenses
          //involves data science and studies to show what the user loves,
          //eg: user spent NPR 2000 in Food last week, out of which 90% of the expenses were Restaurant Foods,
          //PINKY showing summary of this, also user spends NPR 500 on Smoking last week as well
          //although thats just 25% of Food expenses, a significant less amount but
          //the user has had just 3 meals accounting for 90% of the NPR 2000 eating Restaurant Foods,
          //but the number of cigarette was 20, that means 1 cigarette = NPR 25,
          //so this means although less in amount, the user loves cigarette is what the data shows and display that
          //but also PINKY being PINKY sends suggestive insights not making them tell what to do like parents but like friends
          //but not OVERDOING, we tell them who they are and they love to hear about themselves that the GOAL!!!
          //appears after a month/week of using the app, month for better precision although should work to the expenses as of now
          //eg: user has been using the app for 10 days now, so give the summary details for upto 10 days and how he is doing
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          shadowColor: Colors.deepPurpleAccent,
        ),
        icon: const Icon(Icons.auto_graph, color: Colors.white, size: 21),
        label: const Text(
          'View Summary',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
