import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final Function(String) onCategorySelected;

  const Categories({Key? key, required this.onCategorySelected})
    : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final Map<String, List<String>> _categories = {
    'Food & Drinks': [
      'Groceries',
      'Restaurant Foods',
      'Coffee/Tea',
      'Snacks & Beverages',
      'Chocolates & Desserts',
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
      'Govt. Payments',
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
      'Movies & Events',
      'Video Games',
      'Hobbies & Crafts',
      'Concerts & Clubs',
    ],
    'Travels & Ticketing': [
      'Flight Tickets',
      'Hotels',
      'Tour Packages',
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
    'Addictions/Habits': [
      'Smoking',
      'Alcohol',
      'Pan Masala/Tobacco',
      'Betting/Gambling',
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
    _categories.keys.forEach((key) => _expanded[key] = false);
  }

  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                children:
                    _categories.keys.map((category) {
                      return ExpansionTile(
                        title: Text(
                          category,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        initiallyExpanded: _expanded[category]!,
                        onExpansionChanged: (expanded) {
                          setState(() {
                            _expanded[category] = expanded;
                          });
                        },
                        children:
                            _categories[category]!
                                .map(
                                  (subCat) => ListTile(
                                    title: Text(subCat),
                                    leading: const Icon(Icons.label_outline),
                                    onTap: () {
                                      widget.onCategorySelected(subCat);
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                                .toList(),
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
