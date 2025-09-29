import 'package:flutter/material.dart';
import 'package:quizzical/controllers/categories_controller.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesController controller = Get.put(
    CategoriesController(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCategoryList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Assuming a transparent app bar to keep the status bar area clean
        backgroundColor: Colors.transparent,
        elevation: 0,
        // The notch cutout area is typically handled by the device/Scaffold
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title: "Quizzical"
            const Text(
              'Quizzical',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Montserrat', // Using a generic custom font look
              ),
            ),
            const SizedBox(height: 8),

            // Subtitle: "choose a category to focus on:"
            const Text(
              'choose a category to focus on:',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // 2x3 Grid View of Categories
            Obx(
              () => // Use Obx to rebuild the part that depends on state (optional here, but good practice)
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Important for nested scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 16.0, // Horizontal spacing
                  mainAxisSpacing: 16.0, // Vertical spacing
                  childAspectRatio:
                      0.95, // Adjust aspect ratio for pixel-perfect look
                ),
                itemCount: controller.categoryList.length,
                itemBuilder: (context, index) {
                  final category = controller.categoryList[index];
                  return CategoryTile(
                    id: category.id!,
                    name: category.name!,
                    backgroundColor: Colors.primaries[index % Colors.primaries.length]
                        .shade200,
                    imageTag: 'category_${category.id}', // Placeholder tag
                    onTap: () {
                      // Call the GetX controller method on tap
                      controller.selectCategory(category.id!.toString());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Optional: Display current selection for demonstration
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Selected: ${controller.selectedCategory.value}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final int id;
  final String name;
  final Color backgroundColor;
  final String imageTag; // For image display (using a placeholder in code)
  final VoidCallback onTap;

  const CategoryTile({
    Key? key,
    required this.id,
    required this.name,
    required this.backgroundColor,
    required this.imageTag,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Note: To perfectly match the image, you'd use specific 3D assets/images
    // instead of a simple Container with text.
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20), // Rounded corners for the card
      child: Container(
        height: 180, // Approximate height for a 2x3 grid item
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            // Subtle shadow for depth (optional, but common in UIs)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for the large 3D graphic.
            // In a real app, you'd put the image here, e.g., Image.asset('assets/images/$imageTag.png')
            const Spacer(), // Pushes the text to the bottom

            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
