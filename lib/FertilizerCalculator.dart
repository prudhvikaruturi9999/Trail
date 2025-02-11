import 'package:flutter/material.dart';

class FertilizerCalculator extends StatefulWidget {
  const FertilizerCalculator({Key? key}) : super(key: key);

  @override
  State<FertilizerCalculator> createState() => _FertilizerCalculatorState();
}

class _FertilizerCalculatorState extends State<FertilizerCalculator> {
  double area = 0.0; // Stores entered area value
  String selectedUnit = 'acre'; // Default selected unit (acre)

  double daprate = 0;
  double urearate = 0;
  final fertilizerRates = {
    'acre': 50, // Fertilizer rate per acre (kg)
    'hectare': 120, // Fertilizer rate per hectare (kg)
  };

  final UreaRates = {
    'acre': 46,
    'hectare': 125,
  };

  void _handleAreaChange(String value) {
    setState(() {
      area = double.parse(value);
    });
  }

  void _handleUnitChange(String? value) {
    if (value != null) {
      setState(() {
        selectedUnit = value;
      });
    }
  }

  double _calculateFertilizerAmount() {
    setState(() {
      daprate = area * fertilizerRates[selectedUnit]!;
      urearate = area * UreaRates[selectedUnit]!;
    });

    return area * fertilizerRates[selectedUnit]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fertilizer Calculator'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover, // Replace with your image path
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(30, 50, 30, 30),
              padding: const EdgeInsets.all(16.0),
              color: Colors.green, // Set background color to green
              height: 400.0, // Set container height to 400
              width: 300,
              child: Column(
                children: [
                  // Area input field
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter Area',
                    ),
                    onChanged: _handleAreaChange,
                  ),
                  const SizedBox(height: 10.0),

                  // Radio buttons for unit selection
                  Row(
                    children: [
                      Radio<String>(
                        groupValue: selectedUnit,
                        value: 'acre',
                        onChanged: _handleUnitChange,
                      ),
                      const Text('Acre'),
                      const SizedBox(width: 10.0),
                      Radio<String>(
                        groupValue: selectedUnit,
                        value: 'hectare',
                        onChanged: _handleUnitChange,
                      ),
                      const Text('Hectare'),
                    ],
                  ),

                  const SizedBox(height: 20.0),
                  // Button to calculate fertilizer amount
                  ElevatedButton(
                    onPressed: () {
                      if (area > 0) {
                        // Calculate fertilizer amount only if area is entered
                        final fertilizerAmount = _calculateFertilizerAmount();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Fertilizer required: ${fertilizerAmount.toStringAsFixed(2)} kg',
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Calculate Fertilizer Amount'),
                  ),
                  SizedBox(height: 10.0),
                  if (area > 0) Text('DAP: $daprate Kg'),
                  SizedBox(height: 5), // Add spacing between texts (optional)
                  if (area > 0) Text('urea: $urearate Kg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
