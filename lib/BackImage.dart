import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantproject/Article.dart';
import 'package:plantproject/CultivationTips.dart';
import 'package:plantproject/Diseases.dart';
import 'package:plantproject/FertilizerCalculator.dart';
import 'package:plantproject/InternalImage.dart';
import 'package:plantproject/Detection.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToPage(Widget route) {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => route));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro Plant'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        // Use Stack for layering
        children: [
          // Background image

          // Gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // Start position of the gradient
                  end: Alignment.bottomRight, // End position of the gradient
                  colors: [
                    Colors.green.shade200,
                    Colors.green,
                  ], // Colors for the gradient
                ),
              ),
            ),
          ),
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover, // Replace with your image path
            ),
          ),

          Center(
            child: Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () => navigateToPage(ImageInput()),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Light grey background
                      borderRadius: BorderRadius.circular(
                          16.0), // Curved edges with radius 16
                    ),
                    padding: const EdgeInsets.all(16.0), // Inner padding
                    margin: EdgeInsets.fromLTRB(30, 30, 30, 20),
                    child: Column(
                      // Arrange image and text vertically

                      mainAxisSize:
                          MainAxisSize.min, // Avoid excessive vertical space
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the icons horizontally
                          children: [
                            Column(
                              // Wrap each icon and heading in a Column
                              children: [
                                Image.asset(
                                  'assets/images/plant.jpg',
                                  width: 70.0, // Set desired width
                                  height: 70.0,
                                  // Set desired height
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Plant',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors
                                            .black)), // Customize text style
                              ],
                            ),
                            const SizedBox(width: 8.0), // Spacing between icons

                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.black,
                              size: 100,
                            ),
                            // Text('Arrow', style: TextStyle(fontSize: 14.0)),

                            const SizedBox(width: 8.0), // Spacing between icons
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/plantdis.jpg',
                                  width: 70.0, // Set desired width
                                  height: 70.0, // Set desired height
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Disease',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                        // const Icon(Icons.upload_file,
                        //     size: 200.0,
                        //     color: Colors.black), // Upload image icon
                        const SizedBox(
                            height: 8.0), // Spacing between icon and text
                        ElevatedButton(
                          onPressed: () {
                            navigateToPage(InputImage());
                            // Handle button press event (same as GestureDetector?)
                            print('Upload image button pressed');
                          },
                          child: Text(
                            'Upload Image',
                            style: TextStyle(
                              color: Colors.black, // Black text color
                              fontSize: 16.0, // Adjust font size if needed
                              fontWeight: FontWeight.bold, // Bold text style
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green.shade500, // Green button color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(16.0), // Curved edges
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: GridView.count(
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 50,
                    crossAxisCount: 2, // Two buttons per row
                    childAspectRatio: 1.5,
                    // Maintain square aspect ratio
                    children: [
                      // Button 1: Upload Picture
                      // GestureDetector(
                      //   // onTap: () => navigateToPage(ImageInput()),
                      //   child: const Card(
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Icon(Icons.image, size: 50.0),
                      //         SizedBox(height: 10.0),
                      //         Text('Upload Picture'),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Button 2: Fertilizer Calculator
                      GestureDetector(
                        onTap: () =>
                            navigateToPage(const FertilizerCalculator()),
                        child: const Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.filter_list, size: 40.0),
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
                              Icon(Icons.bug_report, size: 40.0),
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
                              Icon(Icons.spa, size: 40.0),
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
                              Icon(Icons.library_books, size: 40.0),
                              SizedBox(height: 10.0),
                              Text('Articles'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ]),
          ),

          // Below the GestureDetector
        ],
      ),
    );
  }
}
