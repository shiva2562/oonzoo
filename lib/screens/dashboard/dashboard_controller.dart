import 'package:get/get.dart';

import '../../app/common_models/product_info.dart';

class DashBoardController extends GetxController {
  List<ProductInfo> products = [
    ProductInfo(
        description:
            'Beats Studio3 Class 1 Noise Cancelling Bluetooth Wireless On Ear Headphones with Mic Apple W1 Headphone Chip, Active Noise Cancelling, 22 Hours of Listening Time (Defiant White)',
        image: 'assets/images/product1.jpg',
        price: '₹3000',
        title: 'Beats HeadPhone'),
    ProductInfo(
        description: 'Nike Mens Revolution 6 Nn |Sports Shoes-Men Sneaker',
        image: 'assets/images/product2.jpg',
        price: '₹6500',
        title: 'Nike Shoes'),
    ProductInfo(
        description:
            'Fire-Boltt Gladiator 1.96" Biggest Display Smart Watch with Bluetooth Calling, Voice Assistant &123 Sports Modes, 8 Unique UI Interactions, SpO2, 24/7 Heart Rate Tracking (Light Gold)',
        image: 'assets/images/product3.jpg',
        price: '₹4500',
        title: 'Smart Watch'),
    ProductInfo(
        description:
            'Oraimo SoundFlow 50W Wireless Bluetooth Party Speaker Powerful Sound and Monstrous Bass,360°Colorful LED Lights with 6000mAh Battery,USB/TF Card/AUX Input&Wireless Mic&TWS Pairing',
        image: 'assets/images/product4.jpg',
        price: '₹2000',
        title: 'Bluetooth Speaker'),
  ];
}
