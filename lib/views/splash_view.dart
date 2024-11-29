import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/assets.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

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
      'subtitle': 'All the best restaurants with their top menu waiting for you, they cant’t wait for your order!'
    },
    {
      'title': 'Fresh Ingredients, Delicious Meals',
      'subtitle': 'All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!'
    },
    {
      'title': 'Fast Delivery, Quality Food',
      'subtitle': 'All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!'
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
            // Fixed Background Image
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
            // Pagination Container
            Center(
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.5, // Adjusted height to avoid overflow
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
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                          // Show Skip and Next buttons only on first two pages
                          if (_currentPage < 2)
                            Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.offAllNamed(AppRoutes.login);
                                    },
                                    child: const Text(
                                      'Skip',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _pageController.nextPage(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children:  [
                                        Text(
                                          'Next',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          // Only show the SlideAction on the last page
                          if (_currentPage == 2)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: SlideAction(
                                  innerColor: Colors.white,
                                  outerColor: AppColors.primary,
                                  sliderButtonIcon: const Icon(Icons.arrow_forward, color: AppColors.primary),
                                  text: '',
                                  alignment: Alignment.center,
                                  elevation: 0,
                                  height: 55,
                                  borderRadius: 30,
                                  onSubmit: () {
                                    Get.offAllNamed('/home');
                                    return null;
                                  },
                                ),
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
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pageContent.length; i++) {
      indicators.add(
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: i == _currentPage ? 20 : 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == _currentPage ? AppColors.secondary : Colors.white,
          ),
        ),
      );
    }
    return indicators;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
