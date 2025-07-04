import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories extends StatefulWidget {
  final Function(String) onCategorySelected;

  const Categories({super.key, required this.onCategorySelected});

  @override
  State<Categories> createState() => _CategoriesState();
}

Widget getCategoryIcon(String category) {
  switch (category.toLowerCase()) {
    case 'electricity bills':
      return FaIcon(FontAwesomeIcons.solidLightbulb, color: Colors.white);
    case 'groceries':
      return FaIcon(FontAwesomeIcons.cartShopping, color: Colors.white);
    case 'cigarette':
      return FaIcon(FontAwesomeIcons.smoking, color: Colors.white);
    case 'coffee':
    case 'tea':
      return FaIcon(FontAwesomeIcons.mugHot, color: Colors.white);
    case 'petrol/diesel':
      return FaIcon(FontAwesomeIcons.gasPump, color: Colors.white);
    case 'flight tickets':
      return FaIcon(FontAwesomeIcons.plane, color: Colors.white);
    case 'movies':
      return FaIcon(FontAwesomeIcons.film, color: Colors.white);
    case 'furniture & decor':
      return FaIcon(FontAwesomeIcons.couch, color: Colors.white);
    case 'chocolates & sweets':
      return FaIcon(FontAwesomeIcons.cookieBite, color: Colors.white);
    case 'ice cream & desserts':
      return FaIcon(FontAwesomeIcons.iceCream, color: Colors.white);
    case 'restaurant foods':
      return FaIcon(FontAwesomeIcons.utensils, color: Colors.white);
    case 'snacks & beverages':
      return FaIcon(FontAwesomeIcons.burger, color: Colors.white);
    case 'rent/mortgage':
    case 'tax':
      return FaIcon(FontAwesomeIcons.hotel, color: Colors.white);
    case 'home repair/maintenance/supplies':
      return FaIcon(
        FontAwesomeIcons.houseCircleExclamation,
        color: Colors.white,
      );
    case 'gardening & plants':
      return FaIcon(FontAwesomeIcons.leaf, color: Colors.white);
    case 'water bills':
      return FaIcon(FontAwesomeIcons.faucetDrip, color: Colors.white);
    case 'internet/wifi bills':
      return FaIcon(FontAwesomeIcons.wifi, color: Colors.white);
    case 'govt. bills':
    case 'emis':
    case 'insurance':
    case 'bank fees':
    case 'investment fees':
      return FaIcon(FontAwesomeIcons.buildingColumns, color: Colors.white);
    case 'tv bills':
      return FaIcon(FontAwesomeIcons.tv, color: Colors.white);
    case 'gas':
      return FaIcon(FontAwesomeIcons.fireBurner, color: Colors.white);
    case 'public transport':
      return FaIcon(FontAwesomeIcons.trainSubway, color: Colors.white);
    case 'pathao/indrives':
      return FaIcon(FontAwesomeIcons.taxi, color: Colors.white);
    case 'parking fees':
      return FaIcon(FontAwesomeIcons.squareParking, color: Colors.white);
    case 'vehicle servicing':
    case 'vehicle accessories':
      return FaIcon(FontAwesomeIcons.carBurst, color: Colors.white);
    case 'doctor consultation':
    case 'therapy':
      return FaIcon(FontAwesomeIcons.userDoctor, color: Colors.white);
    case 'prescription medicines':
      return FaIcon(FontAwesomeIcons.pills, color: Colors.white);
    case 'gym & diets':
      return FaIcon(FontAwesomeIcons.dumbbell, color: Colors.white);
    case 'haircuts & grooming':
    case 'skincare & beauty':
      return FaIcon(FontAwesomeIcons.handHoldingHeart, color: Colors.white);
    case 'work clothes':
    case 'seasonal wear':
    case 'casual clothing':
      return FaIcon(FontAwesomeIcons.shirt, color: Colors.white);
    case 'shoes & footwear':
      return FaIcon(FontAwesomeIcons.shoePrints, color: Colors.white);
    case 'fashion accessories':
      return FaIcon(FontAwesomeIcons.glasses, color: Colors.white);
    case 'jewelry & watches':
      return FaIcon(FontAwesomeIcons.gem, color: Colors.white);
    case 'school/college fees':
    case 'online courses':
    case 'books & study materials':
    case 'extracurricular fees':
      return FaIcon(FontAwesomeIcons.book, color: Colors.white);
    case 'hotels':
    case 'tour packages':
    case 'vacation expenses':
      return FaIcon(FontAwesomeIcons.hotel, color: Colors.white);
    case 'bus tickets':
      return FaIcon(FontAwesomeIcons.bus, color: Colors.white);
    case 'wine':
      return FaIcon(FontAwesomeIcons.champagneGlasses, color: Colors.white);
    case 'beer':
      return FaIcon(FontAwesomeIcons.beerMugEmpty, color: Colors.white);
    case 'vodka':
      return FaIcon(FontAwesomeIcons.martiniGlassCitrus, color: Colors.white);
    case 'whisky/rum':
      return FaIcon(FontAwesomeIcons.whiskeyGlass, color: Colors.white);
    case 'betting':
      return FaIcon(FontAwesomeIcons.handshake, color: Colors.white);
    default:
      return FaIcon(FontAwesomeIcons.icons, color: Colors.white);
  }
}

Color getCategoryColor(String category) {
  switch (category.toLowerCase()) {
    case 'electricity bills':
    case 'tv bills':
      return Colors.yellow.shade800;
    case 'groceries':
    case 'gardening & plants':
    case 'doctor consultation':
    case 'prescription medicines':
    case 'therapy':
    case 'pan masala/tobacco':
      return Colors.green.shade700;
    case 'cigarette':
    case 'wine':
    case 'vodka':
    case 'whisky/rum':
      return Colors.pink.shade700;
    case 'coffee':
    case 'tea':
    case 'chocolates & sweets':
    case 'furniture & decor':
      return Colors.brown.shade700;
    case 'petrol/diesel':
    case 'gas':
    case 'public transport':
    case 'pathao/indrives':
    case 'fashion accessories':
    case 'jewelry & watches':
    case 'beer':
      return Colors.deepOrange;
    case 'flight tickets':
    case 'parking fees':
    case 'hotels':
    case 'tour packages':
    case 'vacation expenses':
    case 'bus tickets':
      return Colors.cyan.shade700;
    case 'movies':
      return Colors.deepPurple;
    case 'restaurant foods':
    case 'snacks & beverages':
    case 'gym & diets':
      return Colors.redAccent.shade700;
    case 'rent/mortgage':
    case 'tax':
    case 'home repair/maintenance/supplies':
    case 'vehicle servicing':
    case 'vehicle accessories':
      return Colors.red.shade900;
    case 'water bills':
    case 'internet/wifi bills':
    case 'betting':
      return Colors.blueAccent;
    case 'govt. bills':
    case 'work clothes':
    case 'seasonal wear':
    case 'casual clothing':
    case 'shoes & footwear':
    case 'emis':
    case 'insurance':
    case 'bank fees':
    case 'investment fees':
      return Colors.blueGrey;
    default:
      return HSLColor.fromAHSL(
        1,
        Random().nextDouble() * 360,
        0.9,
        0.4,
      ).toColor();
  }
}

class _CategoriesState extends State<Categories> {
  final Map<String, List<String>> _categories = {
    'Food & Drinks': [
      'Groceries',
      'Coffee',
      'Tea',
      'Restaurant Foods',
      'Snacks & Beverages',
      'Chocolates & Sweets',
      'Ice Cream & Desserts',
    ],
    'Housing': [
      'Rent/Mortgage',
      'Tax',
      'Home Repair/Maintenance/Supplies',
      'Furniture & Decor',
      'Gardening & Plants',
    ],
    'Utilities': [
      'Electricity bills',
      'Water bills',
      'Internet/WiFi bills',
      'Govt. bills',
      'TV bills',
      'Gas',
    ],
    'Transportation': [
      'Public Transport',
      'Petrol/Diesel',
      'Pathao/InDrives',
      'Parking Fees',
      'Vehicle Servicing',
      'Vehicle Accessories',
    ],
    'Health & Medical': [
      'Doctor Consultation',
      'Prescription Medicines',
      'Therapy',
    ],
    'Personal Care': [
      'Gym & Diets',
      'Haircuts & Grooming',
      'Skincare & Beauty',
    ],
    'Clothing & Accessories': [
      'Work Clothes',
      'Seasonal Wear',
      'Casual Clothing',
      'Shoes & Footwear',
      'Fashion Accessories',
      'Jewelry & Watches',
    ],
    'Insurance & Financial': [
      'EMIs',
      'Insurance',
      'Investment Fees',
      'Bank Fees',
    ],
    'Education & Learning': [
      'School/College Fees',
      'Online Courses',
      'Books & Study Materials',
      'Extracurricular Fees',
    ],
    'Entertainment': [
      'Subscriptions',
      'Movies',
      'Video Games',
      'Hobbies & Crafts',
      'Concerts & Clubs',
    ],
    'Travels & Vacation': [
      'Flight Tickets',
      'Hotels',
      'Tour Packages',
      'Bus Tickets',
      'Vacation Expenses',
    ],
    'Children, Family & Friends': [
      'School Supplies',
      'Diapers & Baby Food',
      'Toys & Games',
      'Tuition/Coaching',
      'Babysitting/Daycare',
    ],
    'Gifting & Donations': [
      'Gifts for Family/Friends',
      'Charity/Donations',
      'Religious Offerings',
    ],
    'Habitual Spends': [
      'Cigarette',
      'Wine',
      'Beer',
      'Vodka',
      'Whisky/Rum',
      'Pan Masala/Tobacco',
      'Betting',
    ],
    'Emergencies & Unexpected': [
      'Emergency Fund Use',
      'Urgent Medical Expense',
      'Fines/Penalties',
    ],
    'Other': [
      'Pet Food & Vet Visits',
      'Pet Toys & Accessories',
      'Miscellaneous Purchases',
    ],
  };

  final Map<String, bool> _expanded = {};

  @override
  void initState() {
    super.initState();
    for (var key in _categories.keys) {
      _expanded[key] = false;
    }
  }

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final isSearching = _searchQuery.isNotEmpty;
    // Filtered categories during search
    final filteredCategories =
        isSearching
            ? Map.fromEntries(
                _categories.entries
                    .map((entry) => MapEntry(
                          entry.key,
                          entry.value
                              .where((subCat) => subCat
                                  .toLowerCase()
                                  .contains(_searchQuery.toLowerCase()))
                              .toList(),
                        ))
                    .where((entry) => entry.value.isNotEmpty),
              )
            : _categories;

    return Scaffold(
      appBar: AppBar(title: const Text('Top Categories'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search category...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged:
                        (value) => setState(() => _searchQuery = value.trim()),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Add category logic here
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child:
                  filteredCategories.isEmpty
                      ? const Center(child: Text('No matches found.'))
                      : ListView(
                        children:
                            filteredCategories.entries.map((entry) {
                              return ExpansionTile(
                                title: Text(
                                  entry.key,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                initiallyExpanded:
                                    isSearching, // force open if searching
                                children:
                                    entry.value.map((subCat) {
                                      return ListTile(
                                        leading: const Icon(
                                          Icons.label_outline,
                                        ),
                                        title: Text(subCat),
                                        onTap: () {
                                          widget.onCategorySelected(subCat);
                                          Navigator.pop(context);
                                        },
                                      );
                                    }).toList(),
                              );
                            }).toList(),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
