import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/routes/app_routes.dart';
import 'package:food_delivery_app/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to your account.',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'please sign in to your account .',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40),
            const Text('Email Address',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
            CustomTextField(
              controller: _emailController,
              hintText: 'Enter your email',
            ),
            const SizedBox(height: 20),
            const Text('Password',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Enter your password',
              obscureText: true,
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password logic
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity, // Make the button full-width
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shadowColor: Colors.black.withOpacity(0.3),
                  elevation: 8,
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 20,
                    endIndent: 10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or Sign in with'),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 20,
                    endIndent: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.center,
                  child: Text('Don\'t have an account?'),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.register);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
