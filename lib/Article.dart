import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({Key? key}) : super(key: key);

  final String title = 'Article - Tomato Diseases';
  final String imageURL =
      'https://www.gardeningknowhow.com/wp-content/uploads/2017/07/late-blight-tomato-plants.jpg'; // Replace with your image URL
  final String content = """
        Tomato plants, a staple in many home gardens, are susceptible to various diseases that can significantly impact yield and quality. Early detection and intervention are crucial for keeping your tomato plants healthy and producing delicious fruit. This article explores some of the most common tomato diseases, their symptoms, and management strategies.

1. Early Blight:

Symptoms: Look for small, brown or black lesions on older leaves, progressing upwards. Affected leaves become dry and brittle, eventually defoliating the plant.
Cause: This fungal disease thrives in cool, wet weather. Spores spread through wind and splashing water.
Management: Practice crop rotation. Use resistant tomato varieties. Prune lower leaves to improve air circulation. Apply fungicides according to label instructions, focusing on preventative measures before symptoms appear.

2. Late Blight:

Symptoms: This devastating disease causes large, water-soaked lesions on leaves, stems, and fruit. The undersides of leaves develop a white, fuzzy mold. Infected fruit become mushy and dark brown or black.
Cause: Late blight thrives in cool, humid conditions and is spread by windblown spores or infected transplants.
Management: Similar to early blight, practice crop rotation and use resistant varieties. Remove and destroy infected plant debris. Avoid overhead watering. Fungicides can be used preventatively, but late blight can be challenging to control.

3. Bacterial Spot:

Symptoms: Small, circular, water-soaked spots with a yellow halo appear on leaves, stems, and fruit. As the spots enlarge, the centers become dry and scabby.
Cause: Bacterial spot is spread by splashing water and contaminated tools or equipment. Warm, humid weather favors its development.
Management: Practice crop rotation and sanitation. Avoid overhead watering. Prune away infected leaves and stems when initial symptoms appear. Copper-based bactericides can be used preventatively.

4. Septoria Leaf Spot:

Symptoms: This fungal disease causes small, circular brown spots with dark centers on leaves. As the spots mature, they may develop a ring-like pattern. Severely infected leaves turn yellow and drop.
Cause: Septoria leaf spot thrives in cool, wet conditions and spreads by windblown spores.
Management: Practice crop rotation. Provide good air circulation by spacing plants adequately. Remove and destroy infected plant debris. Use fungicides preventatively if conditions favor the disease.

5. Tomato Spotted Wilt Virus (TSWV):

Symptoms: This viral disease causes a variety of symptoms, including stunted growth, distorted leaves with a mottled or bronzed appearance, and yellow or brown rings on fruit.
Cause: TSWV is transmitted by thrips, tiny insects that feed on plant sap.
Management: Control thrips populations with insecticidal soap or neem oil. Use row covers to exclude thrips from your plants. Remove and destroy infected plants to prevent further spread. No direct treatment exists for the virus itself.

General Tips for Preventing Tomato Diseases:

* Purchase disease-resistant tomato varieties.
* Practice crop rotation to avoid soilborne pathogens.
* Provide good air circulation by spacing plants adequately and avoiding overhead watering.
* Water deeply and infrequently at the base of the plant.
* Sanitize tools and equipment between use to avoid spreading diseases.
* Monitor your plants regularly for signs of disease and take action promptly.
* Consider organic methods like copper-based sprays or neem oil for preventative control.
""";
  final String cont = '''
      Several diseases can affect tomato plants, impacting their growth and yield. Here are some common ones to be aware of:

      * **Late blight:** This fungal disease causes brown spots on leaves, stems, and fruits. Cool, damp weather favors its development.

      * **Early blight:** Similar to late blight, but with more circular lesions on leaves. It thrives in warm, humid conditions.

      * **Septoria leaf spot:** Causes small, brown spots with dark centers on leaves.

      * **Bacterial spot:** Produces water-soaked spots on leaves and fruits, eventually turning black.

      * **Tomato spotted wilt virus:** Transmitted by thrips, it causes yellowing, stunting, and wilting of plants.

      **Prevention and Control:**

      * Practice crop rotation to avoid disease build-up in the soil.
      * Provide good air circulation around plants by spacing them adequately.
      * Water at the base of the plant to avoid wetting leaves.
      * Remove and destroy infected plant parts promptly.
      * Consider using organic sprays or resistant tomato varieties.
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Article image
              Image(
                image: AssetImage(
                    'assets/images/Tomato.jpg'), // Replace with your image path
              ),
              SizedBox(height: 20.0),

              // Article title (already in AppBar)

              // Article content with styling
              Text(
                content,
                style: TextStyle(
                    fontSize: 16.0, height: 1.2), // Add some line height
                textAlign: TextAlign.justify, // Justify for better readability
              ),
            ],
          ),
        ),
      ),
    );
  }
}
