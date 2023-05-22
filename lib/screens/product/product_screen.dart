import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/common_models/product_info.dart';
import '../../app/routes.dart';
import 'product_page_controller.dart';

class ProductPage extends GetView<ProductPageController> {
  final ProductInfo productInfo;

  const ProductPage({required this.productInfo});

  static const route = Routes.productScreen;
  static GetPage page = GetPage(
      name: ProductPage.route,
      page: () {
        final ProductInfo tempProductInfo = Get.arguments as ProductInfo;
        return ProductPage(
          productInfo: tempProductInfo,
        );
      },
      binding: BindingsBuilder(() {
        Get.put(ProductPageController());
      }));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              productInfo.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productInfo.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    productInfo.price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    productInfo.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
