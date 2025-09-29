import 'package:flutter/material.dart';
import 'package:quizzical/controllers/categories_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesController controller = Get.put(CategoriesController());
  

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
        padding: EdgeInsets.all(20.0), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title: "Quizzical"
            Text(
              'Quizzical',
              style: GoogleFonts.aoboshiOne(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Using a generic custom font look
              ),
            ),
            SizedBox(height: 8),

            // Subtitle: "choose a category to focus on:"
            Text(
              'choose a category to focus on:',
              style: GoogleFonts.amethysta(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 24),

            // 2x3 Grid View of Categories
            Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Important for nested scrolling
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          backgroundColor: Colors
                              .primaries[index % Colors.primaries.length]
                              .shade200,
                          categoryImage: category.id.toString(), // Placeholder tag
                          onTap: () {
                            // Call the GetX controller method on tap
                            controller.selectCategory(category.id!);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
    // Optional: Display current selection for demonstration
  }
}

class CategoryTile extends StatelessWidget {
  final int id;
  final String name;
  final Color backgroundColor;
  final String categoryImage; // For image display (using a placeholder in code)
  final VoidCallback onTap;

  CategoryTile({
    Key? key,
    required this.id,
    required this.name,
    required this.backgroundColor,
    required this.categoryImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // Note: To perfectly match the image, you'd use specific 3D assets/images
    // instead of a simple Container with text.
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20), // Rounded corners for the card
      child: Container(
        height: 180, // Approximate height for a 2x3 grid item
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            // Subtle shadow for depth (optional, but common in UIs)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Placeholder for the large 3D graphic.
            Image(
              image: AssetImage('assets/categories/$categoryImage.png'),
              width: screenHeight * 0.10,
            ),
            Spacer(), // Pushes the text to the bottom

            Text(
              name,
              style: GoogleFonts.baloo2(
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
