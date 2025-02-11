import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantproject/Article.dart';
import 'package:plantproject/CultivationTips.dart';
import 'package:plantproject/Diseases.dart';
import 'package:plantproject/FertilizerCalculator.dart';
import 'package:plantproject/Detection.dart';

// import 'package:plantproject/UploadImage.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  navigateToPage(Widget route) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Make

      appBar: AppBar(
        title: const Text('Pro Plant'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: user != null
            ? GridView.count(
                crossAxisCount: 2, // Two buttons per row
                childAspectRatio: 1.0, // Maintain square aspect ratio
                children: [
                  // Button 1: Upload Picture
                  GestureDetector(
                    onTap: () => navigateToPage(InputImage()),
                    child: const Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 50.0),
                          SizedBox(height: 10.0),
                          Text('Upload Picture'),
                        ],
                      ),
                    ),
                  ),
                  // Button 2: Fertilizer Calculator
                  GestureDetector(
                    onTap: () => navigateToPage(const FertilizerCalculator()),
                    child: const Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.filter_list, size: 50.0),
                          SizedBox(height: 10.0),
                          Text('Fertilizer Calculator'),
                        ],
                      ),
                    ),
                  ),
                  // Button 3: Pests and Disease
                  GestureDetector(
                    onTap: () => navigateToPage(const Diseases()),
                    child: const Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bug_report, size: 50.0),
                          SizedBox(height: 10.0),
                          Text('Pests and Disease'),
                        ],
                      ),
                    ),
                  ),
                  // Button 4: Cultivation Tips
                  GestureDetector(
                    onTap: () => navigateToPage(CultivationTips()),
                    child: const Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.spa, size: 50.0),
                          SizedBox(height: 10.0),
                          Text('Cultivation Tips'),
                        ],
                      ),
                    ),
                  ),
                  // Button 5: Articles
                  GestureDetector(
                    onTap: () => navigateToPage(const Article()),
                    child: const Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.library_books, size: 50.0),
                          SizedBox(height: 10.0),
                          Text('Articles'),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : const Text(
                'You are not logged in.',
                style: TextStyle(fontSize: 24.0),
              ),
      ),
    );
  }
}
