import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/widgets/otp_textfield_widget.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/views/reset_password_view.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('OTP '),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email Verification',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Enter the verification code we send you on:  Alberts******@gmail.com|',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(child: OtpTextField()),
            const SizedBox(
              height: 20,
            ),
            // New Row with clock icon and text

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Didn\'t receive the code?',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend',
                      style: TextStyle(color: AppColors.primary),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time,
                    color: AppColors.secondary), // Clock icon
                SizedBox(width: 8), // Space between icon and text
                Text('09:00',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            Center(
              child: SizedBox(
                height: 50,
                width: screenWidth * 0.9, // Make the button full-width
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ResetPasswordView());
                  },
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
                    'Continue',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ], // Added closing bracket for Column children
        ));
  }
}
