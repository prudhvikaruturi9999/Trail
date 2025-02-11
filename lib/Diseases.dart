import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:plantproject/data.dart';

class Diseases extends StatefulWidget {
  const Diseases({Key? key}) : super(key: key);

  @override
  State<Diseases> createState() => _Diseases();
}

class _Diseases extends State<Diseases> {
  int _selectedIndex = 0; // Stores the index of the randomly selected object

  @override
  void initState() {
    super.initState();
    _selectRandomPlant();
  }

  Future<void> _selectRandomPlant() async {
    // Generate a random index within the list bounds
    final randomIndex = Random().nextInt(plantData.length);
    setState(() {
      _selectedIndex = randomIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedPlant = plantData[_selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Disease Info'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          // Add other Stack children here (optional)
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display the image using a NetworkImage
                Image(
                  image: AssetImage(
                    selectedPlant['image src']!, // Replace with your image path
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  selectedPlant['plant disease']!,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text('Target Plants: ${selectedPlant['target plan']!}'),
                const SizedBox(height: 10.0),
                Text('Symptoms: ${selectedPlant['Symptoms']!}'),
                const SizedBox(height: 10.0),
                Text('Measures: ${selectedPlant['measure']!}'),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _selectRandomPlant,
                  child: const Text('Show Another Random Plant'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
