import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:get/get.dart';

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
        leading: IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back_ios)),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const Text('Email Verification',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),

          const SizedBox(height: 20,),
          const Text('Enter the verification code we send you on: '
          'Alberts******@gmail.com|', style: TextStyle(fontSize: 16.0),),  
          const SizedBox(height: 20,),
          Center(
            child: SizedBox(
              height: 50,
              width: screenWidth * 0.9, // Make the button full-width
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  hintText: 'Enter OTP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
                  ),
                  
           Center(
             child: SizedBox(
               height: 50,
               width: screenWidth * 0.9, // Make the button full-width
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
      )
    );
  }
}