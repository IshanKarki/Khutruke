import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGoalCard(context),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  _buildStreaksCard(context),
                  const SizedBox(height: 20),
                  _buildSavingGoalCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double progressbarValue = 0.9;

  Widget _buildGoalCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.vertical(
          top: Radius.zero,
          bottom: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            offset: Offset(0, 1),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Operation Axe Tune",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "MAY",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Electric Guitar",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.timer, color: Color(0xFFFFD0EF), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "14 DAYS",
                          style: GoogleFonts.poppins(
                            color: Color(0xFFFFD0EF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "NPR 15,262",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: CircularPercentIndicator(
              radius: MediaQuery.of(context).size.width * 0.2659,
              lineWidth: 10,
              percent: progressbarValue,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              reverse: true,
              progressColor: Colors.white,
              animationDuration: 1000,
              backgroundColor: Color.fromARGB(77, 255, 208, 239),
              center: Container(
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/guitar_goal.gif',
                    fit: BoxFit.contain,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearPercentIndicator(
                animation: true,
                lineHeight: 10.0,
                percent: progressbarValue,
                progressColor: Colors.white,
                backgroundColor: Color.fromARGB(77, 255, 208, 239),
                barRadius: const Radius.circular(10),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "90% Saved",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "10% Left",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStreaksCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: Theme.of(context).colorScheme.tertiary,
                size: 36,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "142 days",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Steps streak",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Daily Expense Limit:",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
          ),
          const SizedBox(height: 4),
          LinearPercentIndicator(
            lineHeight: 8.0,
            percent: 363 / 550,
            progressColor: Colors.white,
            backgroundColor: Colors.white24,
            barRadius: const Radius.circular(10),
          ),
          const SizedBox(height: 6),
          Text(
            "363 / 550",
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final day in [
                "Mon",
                "Tue",
                "Wed",
                "Thu",
                "Fri",
                "Sat",
                "Sun",
              ])
                Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color:
                          ["Mon", "Tue", "Wed"].contains(day)
                              ? Theme.of(context).colorScheme.tertiary
                              : Colors.white24,
                      size: 20,
                    ),
                    Text(
                      day,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSavingGoalCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7F0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/money_bag.png', height: 100),
              const SizedBox(height: 10),
              Text(
                "Savings Goal",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              LinearPercentIndicator(
                lineHeight: 10.0,
                percent: 0.4,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                barRadius: const Radius.circular(10),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Image.asset('assets/MiMi.png', height: 40),
            ),
          ),
        ],
      ),
    );
  }
}
