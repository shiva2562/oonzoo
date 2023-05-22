import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/common_models/product_info.dart';
import '../../app/routes.dart';
import 'dashboard_controller.dart';
import 'widgets/category_card.dart';
import 'widgets/product_card.dart';

class DashboardPage extends GetView<DashBoardController> {
  const DashboardPage({super.key});
  static const route = Routes.dashboardScreen;
  static GetPage page = GetPage(
      name: DashboardPage.route,
      page: () => const DashboardPage(),
      binding: BindingsBuilder(() {
        Get.put(DashBoardController());
      }));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce App'),
        centerTitle: true,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/banner.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Summer Sale',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    icon: Icons.home,
                    title: 'Home',
                    onTap: () {},
                  ),
                  CategoryCard(
                    icon: Icons.shopping_cart,
                    title: 'Clothing',
                    onTap: () {},
                  ),
                  CategoryCard(
                    icon: Icons.mobile_friendly,
                    title: 'Electronics',
                    onTap: () {},
                  ),
                  CategoryCard(
                    icon: Icons.sports_basketball,
                    title: 'Sports',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 100,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    productInfo: ProductInfo(
                        image: controller.products[index % 4].image,
                        title: controller.products[index % 4].title,
                        price: controller.products[index % 4].price,
                        description:
                            controller.products[index % 4].description),
                    onTap: () {
                      Get.toNamed(Routes.productScreen,
                          arguments: controller.products[index % 4]);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
