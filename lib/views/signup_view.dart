import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/assets.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/routes/app_routes.dart';
import 'package:food_delivery_app/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create your account.',
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
                const SizedBox(height: 30),
                const Text('Email Address',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                ),
                const Text('Username', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: _usernameController, hintText: 'Enter your username'),
                const Text('Password', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptedTerms = value ?? false;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),
                    const Expanded(
                      child: Text(
                        'I agree with Terms of Service and Privacy Policy',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,  
              children: [
                Container(
                  decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Image.asset(Assets.google),
                    iconSize: 40, // Adjusted size for better visibility
                    onPressed: () {
                      // Google login logic
                    },
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Image.asset(Assets.facebook),
                    iconSize: 40,
                    onPressed: () {
                      // Facebook login logic
                    },
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Image.asset(Assets.apple),
                    iconSize: 40,
                    onPressed: () {
                      // Apple login logic
                    },
                  ),
                ),
              ],
            ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _acceptedTerms ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shadowColor: Colors.black.withOpacity(0.3),
                      elevation: 8,
                    ),
                    child: const Text(
                      'Register',
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
                      child: Text('Already have an account?'),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: const Text(
                            'Login',
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
        ),
      ),
    );
  }
}
