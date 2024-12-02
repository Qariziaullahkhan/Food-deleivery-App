import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/assets.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pageContent = [
    {
      'title': 'We serve incomparable delicacies',
      'subtitle': 'All the best restaurants with their top menu waiting for you, they can’t wait for your order!'
    },
    {
      'title': 'Fresh Ingredients, Delicious Meals',
      'subtitle': 'All the best restaurants with their top menu waiting for you, they can’t wait for your order!'
    },
    {
      'title': 'Fast Delivery, Quality Food',
      'subtitle': 'All the best restaurants with their top menu waiting for you, they can’t wait for your order!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.image1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // PageView Container
            Center(
              child: Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.6,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pageContent.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _pageContent[index]['title']!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              _pageContent[index]['subtitle']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(),
                            ),
                            const SizedBox(height: 100),
                            if (_currentPage < 2)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () => Get.offAllNamed(AppRoutes.login),
                                    child: const Text(
                                      'Skip',
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Next',
                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_forward, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            if (_currentPage == 2)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () => Get.offAllNamed(AppRoutes.login),
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: const  BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.fromBorderSide(
                                          BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(Icons.arrow_forward, color: AppColors.primary),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    return List<Widget>.generate(_pageContent.length, (index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _currentPage == index ? 20 : 10,
        height: 10,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == index ? AppColors.secondary : Colors.white,
        ),
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
