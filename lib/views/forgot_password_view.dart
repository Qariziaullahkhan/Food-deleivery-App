import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/views/email_verification_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Text('Forgot Password ', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
              const Text("Enter your email address and we’ll send you confirmation code to reset your password"),
              const SizedBox(height: 20),
              const Text('Email Address', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
              
              CustomTextField(controller: _emailController, hintText: "Enter your email address"),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: (){
                      Get.to(() => const EmailVerificationView());
                    },
                    child: const Text("Continue", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),              
              const Spacer(),             
                    
            ],
          ),
        ));
  }
}
