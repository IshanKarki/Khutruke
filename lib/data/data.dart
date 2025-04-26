import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionsData = [
  {
    'icon': FaIcon(FontAwesomeIcons.solidLightbulb, color: Colors.white),
    'name': 'Electricity Bills',
    'date': 'Today',
    'price': 'NPR 250',
    'color': Colors.amber.shade800,
  },
  {
    'icon': FaIcon(FontAwesomeIcons.plane, color: Colors.white),
    'name': 'Flight/Airlines',
    'date': 'Today',
    'price': 'NPR 2800',
    'color': Colors.cyan.shade700,
  },
  {
    'icon': FaIcon(FontAwesomeIcons.smoking, color: Colors.white),
    'name': 'Smoking',
    'date': 'Today',
    'price': 'NPR 40',
    'color': Colors.pink.shade700,
  },
  {
    'icon': FaIcon(FontAwesomeIcons.mugHot, color: Colors.white),
    'name': 'Coffee',
    'date': 'Today',
    'price': 'NPR 170',
    'color': Colors.brown.shade700,
  },
  {
    'icon': FaIcon(FontAwesomeIcons.film, color: Colors.white),
    'name': 'Movie',
    'date': 'Yesterday',
    'price': 'NPR 350',
    'color': Colors.deepPurple,
  },
  {
    'icon': FaIcon(FontAwesomeIcons.smoking, color: Colors.white),
    'name': 'Smoking',
    'date': 'Yesterday',
    'price': 'NPR 20',
    'color': Colors.pink.shade700,
  },
  {
    'icon': FaIcon(FontAwesomeIcons.gasPump, color: Colors.white),
    'name': 'Petrol',
    'date': 'Yesterday',
    'price': 'NPR 650',
    'color': Colors.amber.shade900,
  },
];
