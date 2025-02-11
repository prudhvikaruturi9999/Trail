import 'package:flutter/material.dart';

class CultivationTips extends StatelessWidget {
  CultivationTips({Key? key}) : super(key: key);

  final List<String> tips = [
    'Tip 1: Choose the right location with proper sunlight and soil conditions.',
    'Tip 2: Prepare the soil by tilling, removing weeds, and adding nutrients if needed.',
    'Tip 3: Plant seeds or seedlings at the appropriate depth and spacing.',
    'Tip 4: Water regularly, but avoid overwatering.',
    'Tip 5: Provide adequate fertilization based on plant needs and soil test results.',
    'Tip 6: Control pests and diseases with organic methods whenever possible.',
    'Tip 7: Mulch around plants to retain moisture and suppress weeds.',
    'Tip 8: Regularly monitor plant health and address any problems promptly.',
    'Tip 9: Harvest your crops at the peak of ripeness for optimal quality.',
    'Tip 10: Rotate crops each season to improve soil health and prevent disease buildup.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cultivation Tips'),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // Start position of the gradient
                  end: Alignment.bottomRight, // End position of the gradient
                  colors: [
                    Colors.green.shade200,
                    Colors.green.shade400,
                  ], // Colors for the gradient
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bullet point marker
                        const Icon(Icons.lightbulb_outline),
                        const SizedBox(width: 10.0),
                        // Tip text with left alignment
                        Expanded(
                          child: Text(
                            tips[index],
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
